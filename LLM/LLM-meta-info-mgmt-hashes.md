# Repeatable Short'ish Person-Role IDs

## 1. Canonicalize Inputs Before Hashing

Normalize Unicode first: Convert all strings to UTF-8 NFC so precomposed and decomposed Unicode characters produce identical byte sequences. Avoid NFKC unless you explicitly want compatibility folding that may alter cultural or typographic distinctions.

Normalize whitespace explicitly: Trim leading and trailing whitespace and collapse internal runs of whitespace (spaces, tabs, non-breaking spaces) into a single space using Unicode-aware rules.

### Define casing and diacritic rules upfront:

- Decide whether casing is significant or folded. If folding case, use a single, deterministic, locale-invariant normalization rule across every service so languages with special casing (such as Turkish dotted/dotless `i`/`I`) do not diverge across environments.

- Be cautious with automatic diacritic stripping (`é` -> `e`) or transliteration across Latin, Cyrillic, CJK, Arabic, or Devanagari scripts, as distinct characters can carry semantic or cultural meaning. Document your exact public-name normalization policy.

Validate and canonicalize roles: Restrict inputs to your predefined allowlist of roles and map to a canonical internal code/enum (for example, `PRIMARY_AUTHOR` rather than localized or display strings). Reject or fail explicitly on unknown roles instead of silently guessing.

## 2. Structure and Namespace the Hash Payload

Include a versioned domain prefix: Prefix the payload (for example, `person-role:v1:`) so you can safely update normalization rules or role taxonomies in the future without breaking historical IDs or creating silent conflicts.

Avoid ambiguous concatenation: Do not join raw fields with a naive delimiter like `name + "|" + role` if names or roles can contain that delimiter. Use unambiguous framing such as length-prefixed fields or canonical structured encoding:

> `v1|role=AUTHOR|name_len=11|name=José García`

Choose a well-distributed hash function: Use a fast, non-cryptographic hash (such as XXH3 or BLAKE3) or a SHA-256 digest truncated to the required bit budget. Cryptographic hashes like SHA-256 and BLAKE3 offer strong uniformity and avalanche behavior even when sliced.

## 3. Size for Collisions and Handle Edge Cases

Account for the birthday paradox: With $N$ total person-role pairs and a hash space of $2^b$ values, collision probability scales roughly as:

> `P(collision) ≈ N^2 / (2 * 2^b)`

Choose enough bits so collision probability stays comfortably low for your expected dataset size and growth rate.

Define a deterministic collision policy: Even with solid bit lengths, collisions remain theoretically possible. Decide how your system behaves on conflict:

- Enforce a unique index/constraint and fail/flag explicitly rather than silently overwriting an existing record.

- If automatic disambiguation is required, append a deterministic suffix derived from an extra disambiguating attribute or sequence only upon collision, keeping the primary ID clean for standard entries.

## 4. Specified Character Set

### Respect alphabet constraints and environment limits:

- Ensure every character in the generated ID belongs strictly to your allowed character set.

- If IDs appear in URLs, query parameters, filenames, or command-line arguments, avoid characters that require escaping or cause shell/filesystem conflicts.

- If humans read, type, or transcribe IDs, exclude visually ambiguous characters (such as `0`/`O` or `1`/`I`/`l`) when your character set allows, or use a human-friendly alphabet like Crockford Base32.

- If downstream databases, filesystems, or search indexes are case-insensitive, avoid relying on mixed case (`a-z` vs. `A-Z`) to differentiate distinct IDs.

### Avoid bias when mapping bytes to a custom alphabet: 

Convert hash bytes cleanly (such as big-integer base conversion or bit-chunking) rather than truncating to a small integer before taking modulo.

## 5. Separate Public Name Rules from ID Lifecycle

Clarify what happens when a public name changes: If an ID is computed directly from a mutable public name plus role, any edit—such as fixing a spelling error, updating a stage/public name, or recording a legal name change—will generate a different ID.

### Match the ID design to your stability requirement:

- Use a hash of `(canonical_public_name, canonical_role)` when you specifically want a deterministic, stateless, content-addressed ID for that exact name-role pair.

- Anchor the ID to a stable internal person key plus role if you need the ID to remain constant when public display text changes.

----

----
