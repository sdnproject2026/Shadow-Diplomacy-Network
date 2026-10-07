#!/data/data/com.termux/files/usr/bin/bash
# Scan *.md files, detect paired/unpaired, then echo final unmatched list

shopt -s nullglob

UNMATCHED=()

for b in *.md; do
    # skip suffixed files
    [[ "$b" == *"-Meta.md" ]] && continue

    stem="${b%.md}"
    companion="${stem}-Meta.md"

    if [[ -e "$companion" ]]; then
        :  # paired, do nothing
    else
        UNMATCHED+=( "$b" )
    fi
done

echo "-----"
printf "%s\n" "${UNMATCHED[@]}"
