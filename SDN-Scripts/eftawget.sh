#!/data/data/com.termux/files/usr/bin/bash

set -u
set -o pipefail

# ==============================================================
# EFTA PDF downloader
#   eftawget.sh
#
# Sources:
#   1. RollCall
#   2. DOJ / Justice.gov
#   3. GetKino: DISABLED
#
# Input:
#   eftalist.txt
#
# Output:
#   EFTA########.pdf
#
# Failed IDs:
#   eftafail.txt
#
# Log:
#   eftawget.log
# ==============================================================

LISTFILE="eftalist.txt"
OUTDIR="."
LOGFILE="eftawget.log"
FAILED_FILE="eftafail.txt"

MAX_RETRIES=3
INITIAL_BACKOFF=3
TIMEOUT=60
DELAY=2

USER_AGENT="Mozilla/5.0 (Android; Termux) EFTA-PDF-Downloader/3.0"

mkdir -p "$OUTDIR"

# Start a fresh failed list.
: > "$FAILED_FILE"

# ==============================================================
# Logging
# ==============================================================

log() {
    printf '[%s] %s\n' \
        "$(date '+%Y-%m-%d %H:%M:%S')" \
        "$*" | tee -a "$LOGFILE"
}

dbg() {
    log "[DBG] $*"
}

warn() {
    log "[WARN] $*"
}

err() {
    log "[ERR] $*" >&2
}

# ==============================================================
# Dependencies
# ==============================================================

if ! command -v wget >/dev/null 2>&1; then
    log "[INFO] Installing wget"
    pkg install -y wget || exit 1
fi

dbg "wget: $(command -v wget)"

if command -v pdfinfo >/dev/null 2>&1; then
    HAVE_PDFINFO=1
    dbg "pdfinfo available"
else
    HAVE_PDFINFO=0
    dbg "pdfinfo unavailable"
    dbg "Optional: pkg install poppler"
fi

# ==============================================================
# Clean input
# ==============================================================

clean_line() {
    local s="$1"

    # Windows CRLF.
    s="${s//$'\r'/}"

    # Leading whitespace.
    s="${s#"${s%%[![:space:]]*}"}"

    # Trailing whitespace.
    s="${s%"${s##*[![:space:]]}"}"

    printf '%s' "$s"
}

# ==============================================================
# Normalize EFTA ID
# ==============================================================

normalize_efta() {
    local s="$1"

    s="$(clean_line "$s")"
    s="${s^^}"

    if [[ "$s" =~ ^EFTA[0-9]{8}$ ]]; then
        printf '%s' "$s"
        return 0
    fi

    return 1
}

# ==============================================================
# Dataset lookup
# ==============================================================

dataset_for() {
    local n="$1"

    if (( n >= 1 && n <= 3158 )); then
        echo 1
        return 0
    fi

    if (( n >= 3159 && n <= 3857 )); then
        echo 2
        return 0
    fi

    if (( n >= 3858 && n <= 5586 )); then
        echo 3
        return 0
    fi

    if (( n >= 5705 && n <= 8320 )); then
        echo 4
        return 0
    fi

    if (( n >= 8409 && n <= 8528 )); then
        echo 5
        return 0
    fi

    if (( n >= 8529 && n <= 8998 )); then
        echo 6
        return 0
    fi

    if (( n >= 9016 && n <= 9664 )); then
        echo 7
        return 0
    fi

    if (( n >= 9676 && n <= 39023 )); then
        echo 8
        return 0
    fi

    if (( n >= 39025 && n <= 1262781 )); then
        echo 9
        return 0
    fi

    if (( n >= 1262782 && n <= 2205654 )); then
        echo 10
        return 0
    fi

    if (( n >= 2205655 && n <= 2730264 )); then
        echo 11
        return 0
    fi

    if (( n >= 2730265 && n <= 2858497 )); then
        echo 12
        return 0
    fi

    return 1
}

# ==============================================================
# URL builders
# ==============================================================

rollcall_url() {
    local efta="$1"

    printf \
        'https://media-cdn.rollcall.com/epstein-files/%s.pdf' \
        "$efta"
}

doj_url_encoded() {
    local efta="$1"
    local dataset="$2"

    printf \
        'https://www.justice.gov/epstein/files/DataSet%%20%s/%s.pdf' \
        "$dataset" \
        "$efta"
}

doj_url_space() {
    local efta="$1"
    local dataset="$2"

    printf \
        'https://www.justice.gov/epstein/files/DataSet %s/%s.pdf' \
        "$dataset" \
        "$efta"
}

# ==============================================================
# PDF validation
# ==============================================================

validate_pdf() {
    local file="$1"

    if [ ! -f "$file" ]; then
        err "Validation: file does not exist"
        return 1
    fi

    local size
    size="$(wc -c < "$file" | tr -d ' ')"

    dbg "Size: ${size} bytes"

    if [ "$size" -lt 1024 ]; then
        err "Rejected: file too small"
        return 1
    fi

    # ----------------------------------------------------------
    # PDF magic header
    # ----------------------------------------------------------

    if ! head -c 5 "$file" | grep -q '^%PDF-'; then
        err "Rejected: missing %PDF- header"

        dbg "First 120 bytes:"

        head -c 120 "$file" 2>/dev/null |
            cat -v >&2 || true

        return 1
    fi

    # ----------------------------------------------------------
    # EOF
    # ----------------------------------------------------------

    if ! tail -c 16384 "$file" |
        grep -aq '%%EOF'; then

        err "Rejected: missing %%EOF"

        return 1
    fi

    # ----------------------------------------------------------
    # Optional structural check
    # ----------------------------------------------------------

    if [ "$HAVE_PDFINFO" -eq 1 ]; then

        if ! pdfinfo "$file" >/dev/null 2>&1; then
            err "Rejected: pdfinfo could not parse PDF"
            return 1
        fi

    fi

    return 0
}

# ==============================================================
# Extract final HTTP status
# ==============================================================

get_http_status() {
    local headers="$1"

    grep -E '^  HTTP/[0-9.]+' "$headers" 2>/dev/null |
        tail -n 1 |
        awk '{print $2}'
}

# ==============================================================
# Download a single URL
#
# Return codes:
#
#   0 = valid PDF
#   2 = permanent HTTP failure, e.g. 404
#   1 = transient/other failure
# ==============================================================

download_once() {
    local url="$1"
    local destination="$2"

    local part="${destination}.part"
    local headers="${destination}.part.headers"

    # CRITICAL:
    # Remove all stale temporary material first.
    rm -f "$part" "$headers"

    dbg "URL: $url"

    if wget \
        --https-only \
        --secure-protocol=TLSv1_2 \
        --no-hsts \
        --timeout="$TIMEOUT" \
        --connect-timeout="$TIMEOUT" \
        --tries=1 \
        --user-agent="$USER_AGENT" \
        --server-response \
        -O "$part" \
        "$url" \
        2>"$headers"; then

        dbg "wget completed"
    else
        warn "wget returned non-zero"

        grep -E \
            'HTTP/|Content-Type:|Content-Length:|Location:' \
            "$headers" 2>/dev/null || true

        # Try to determine whether this was a permanent HTTP error.
        local failed_status
        failed_status="$(get_http_status "$headers" || true)"

        case "$failed_status" in
            400|401|403|404|410)
                warn "Permanent HTTP status: $failed_status"

                rm -f "$part" "$headers"

                return 2
                ;;
        esac

        rm -f "$part" "$headers"

        return 1
    fi

    # ----------------------------------------------------------
    # HTTP status
    # ----------------------------------------------------------

    local status
    status="$(get_http_status "$headers" || true)"

    dbg "HTTP status: ${status:-unknown}"

    case "$status" in

        2[0-9][0-9])
            ;;

        404|410)
            warn "Permanent HTTP status: $status"

            rm -f "$part" "$headers"

            return 2
            ;;

        400|401|403)
            warn "Permanent HTTP status: $status"

            rm -f "$part" "$headers"

            return 2
            ;;

        *)
            warn "Non-success HTTP status: ${status:-unknown}"

            rm -f "$part" "$headers"

            return 1
            ;;
    esac

    # ----------------------------------------------------------
    # Validate actual bytes
    # ----------------------------------------------------------

    if ! validate_pdf "$part"; then

        warn "Response was not a valid PDF"

        rm -f "$part" "$headers"

        return 1
    fi

    # ----------------------------------------------------------
    # Atomic replacement
    # ----------------------------------------------------------

    mv -f "$part" "$destination"

    rm -f "$headers"

    log "[INFO] VALID PDF: $destination"

    return 0
}

# ==============================================================
# Retry
# ==============================================================

download_retry() {
    local url="$1"
    local destination="$2"
    local source="$3"

    local attempt=1
    local delay="$INITIAL_BACKOFF"

    while [ "$attempt" -le "$MAX_RETRIES" ]; do

        log "[INFO] $source attempt $attempt/$MAX_RETRIES"

        download_once "$url" "$destination"

        local rc=$?

        if [ "$rc" -eq 0 ]; then
            return 0
        fi

        # 404/403/etc. means don't waste all retries on this source.
        if [ "$rc" -eq 2 ]; then
            warn "$source permanently unavailable"
            return 2
        fi

        if [ "$attempt" -lt "$MAX_RETRIES" ]; then

            warn "$source failed"

            log "[INFO] Backoff: ${delay}s"

            sleep "$delay"

            delay=$((delay * 2))
        fi

        attempt=$((attempt + 1))
    done

    return 1
}

# ==============================================================
# Existing PDF check
# ==============================================================

check_existing() {
    local file="$1"

    [ -f "$file" ] || return 1

    log "[INFO] Existing file: $file"

    if validate_pdf "$file"; then
        log "[INFO] Existing PDF is valid"
        return 0
    fi

    warn "Existing PDF is invalid; deleting"

    rm -f "$file"

    return 1
}

# ==============================================================
# Download one EFTA
# ==============================================================

download_efta() {
    local efta="$1"

    local number="${efta#EFTA}"

    local decimal=$((10#$number))

    local dataset

    if ! dataset="$(dataset_for "$decimal")"; then
        err "$efta: unknown dataset"
        return 1
    fi

    local output="${OUTDIR}/${efta}.pdf"

    local rollcall
    local doj_encoded
    local doj_space

    rollcall="$(rollcall_url "$efta")"

    doj_encoded="$(doj_url_encoded "$efta" "$dataset")"

    doj_space="$(doj_url_space "$efta" "$dataset")"

    log "------------------------------------------------------------"
    log "[INFO] $efta"
    log "[INFO] Dataset: $dataset"
    log "[INFO] Output: $output"

    dbg "RollCall : $rollcall"
    dbg "DOJ #1   : $doj_encoded"
    dbg "DOJ #2   : $doj_space"

    # ----------------------------------------------------------
    # Existing valid file
    # ----------------------------------------------------------

    if check_existing "$output"; then
        return 0
    fi

    # Clean any leftovers from previous versions.
    rm -f \
        "${output}.part" \
        "${output}.part.headers" \
        "${output}.headers"

    # ----------------------------------------------------------
    # SOURCE 1: RollCall
    # ----------------------------------------------------------

    download_retry \
        "$rollcall" \
        "$output" \
        "RollCall"

    local rc=$?

    if [ "$rc" -eq 0 ]; then
        log "[INFO] $efta SUCCESS: RollCall"
        return 0
    fi

    warn "$efta: RollCall failed"

    # ----------------------------------------------------------
    # SOURCE 2: DOJ encoded URL
    # ----------------------------------------------------------

    download_retry \
        "$doj_encoded" \
        "$output" \
        "DOJ"

    rc=$?

    if [ "$rc" -eq 0 ]; then
        log "[INFO] $efta SUCCESS: DOJ encoded URL"
        return 0
    fi

    warn "$efta: DOJ encoded URL failed"

    # ----------------------------------------------------------
    # SOURCE 3: DOJ literal-space URL
    #
    # wget will URL-encode the space itself.
    # ----------------------------------------------------------

    download_retry \
        "$doj_space" \
        "$output" \
        "DOJ-space"

    rc=$?

    if [ "$rc" -eq 0 ]; then
        log "[INFO] $efta SUCCESS: DOJ space URL"
        return 0
    fi

    # ----------------------------------------------------------
    # Complete failure
    # ----------------------------------------------------------

    err "$efta FAILED"

    printf '%s\n' "$efta" >> "$FAILED_FILE"

    rm -f \
        "$output" \
        "${output}.part" \
        "${output}.part.headers" \
        "${output}.headers"

    return 1
}

# ==============================================================
# Main
# ==============================================================

if [ ! -f "$LISTFILE" ]; then
    err "Missing list file: $LISTFILE"
    exit 1
fi

log "============================================================"
log "EFTA downloader starting"
log "GetKino: DISABLED"
log "Source 1: RollCall"
log "Source 2: DOJ"
log "============================================================"

total=0
success=0
failed=0

while IFS= read -r raw || [ -n "$raw" ]; do

    line="$(clean_line "$raw")"

    [ -z "$line" ] && continue

    case "$line" in
        \#*)
            continue
            ;;
    esac

    if ! efta="$(normalize_efta "$line")"; then
        err "Invalid EFTA ID: [$line]"
        printf '%s\n' "$line" >> "$FAILED_FILE"
        failed=$((failed + 1))
        continue
    fi

    total=$((total + 1))

    if download_efta "$efta"; then
        success=$((success + 1))
    else
        failed=$((failed + 1))
    fi

    sleep "$DELAY"

done < "$LISTFILE"

# ==============================================================
# Summary
# ==============================================================

log "============================================================"
log "Finished"
log "============================================================"
log "Total   : $total"
log "Success : $success"
log "Failed  : $failed"
log "Output  : $OUTDIR"
log "Failed  : $FAILED_FILE"
log "Log     : $LOGFILE"
log "============================================================"

if [ "$failed" -eq 0 ]; then
    exit 0
fi

exit 1
