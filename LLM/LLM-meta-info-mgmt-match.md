# Storage, Hashing 

Multi-Candidate `edgecase` State, and Proof for Name-Role Matching

## 1. Storage Model 

Name-Role Elements

Keep raw inputs immutable and separate normalized forms, candidate groupings, and adjudication proof rather than overwriting fields or flattening everything into one string:

### Raw ingestion store 

(immutable)

Preserve `raw_person_name`, `raw_role_text`, source/feed ID, locale/language hint, and ingestion timestamp. Never overwrite or mutate raw records so pipelines can be replayed and audited.

### Canonical & edge-case element store

Store the validated `canonical_role_code` (from your predefined role set), `nfc_name` (UTF-8 NFC normalized), optional structured name parts (given, family, particles/affixes, script/language tag), and edge-case indicator flags (e.g., diacritics, non-Latin script, role alias/ambiguity, punctuation/spacing variation).

### Edge-case group & candidate membership store

Represent multi-candidate ambiguities (`2+` candidates) explicitly as a shared group with per-candidate statuses (`EDGE_CASE`, `CONFIRMED_SAME`, `DISPROVEN_DISTINCT`) instead of forcing premature merges or losing candidate links.

### Adjudication & proof store

Record structured evidence used to prove or disprove a match between candidates, along with decision outcome, rule/version ID, reviewer/system actor, timestamp, and an `evidence_fingerprint` for re-evaluation.

## 2. Hashing Method 

(Canonical IDs vs. Edge-Case Buckets)

Separate strict identity hashing from loose candidate-grouping hashing:

### Strict `person_role_id` (repeatable canonical hash)

1. Normalize strings to UTF-8 NFC, trim and collapse whitespace cleanly, apply a single deterministic casing rule (if casing is folded across your system), and validate `canonical_role_code` against your predefined role list.

2. Build an unambiguous, versioned payload (such as length-prefixed fields: `v1|role=EDITOR|name_len=11|name=José García`) so delimiters inside names or roles cannot cause boundary collisions and future rule changes can increment the version cleanly.

3. Hash with a fast, well-distributed hash (such as BLAKE3, XXH3, or truncated SHA-256) sized for your expected dataset scale to keep birthday collisions negligible, then encode into your target character set (respecting URL/path safety, case sensitivity, and human-readability rules).

### Loose `edgecase_bucket_hash` 

(candidate grouping key)

- Compute a separate hash over a relaxed comparison key (for example, diacritic-folded / transliterated / punctuation-normalized name + `canonical_role_code`) solely to cluster `2+` potential matches into an edge-case evaluation group.

- Never treat `edgecase_bucket_hash` as a final merged `person_role_id`; candidates in the same bucket may be proven to be the same entity or disproven as distinct people.

## 3. Saving `edgecase` 

Status Across 2+ Candidates

Model multi-candidate edge cases explicitly so status is clear, queryable, and repeatable across re-runs:

### Group record (`edgecase_group`)

- `edgecase_group_id` (unique identifier for the 2+ candidate set)

- `edgecase_bucket_hash` (key that grouped the candidates)

- `edgecase_reasons` (list of edge-case triggers, e.g., diacritic mismatch, transliteration, role synonym, partial name match)

- `status` (`OPEN`, `RESOLVED_MATCH`, `RESOLVED_SEPARATE`, `PARTIAL`)

- `created_at`, `resolved_at`, `resolved_by` (automated rule, human adjudicator, or authoritative source)

### Candidate membership rows

(`edgecase_candidates`)

- One row per candidate (`2+` rows per group) linking `edgecase_group_id`, `candidate_id` / `person_role_id`, `candidate_status` (`EDGE_CASE`, `PROVEN_MATCH`, `DISPROVEN_MATCH`), and the matching rule/score that placed it in the group.

### Repeatable post-resolution behavior

- When `2+` candidates are disproven as distinct people, retain their separate `person_role_id`s and persist a disproven-pair / negative-match record (keyed by candidate pair + evidence fingerprint) so subsequent runs with unchanged inputs do not re-surface the same false edge case.

- When candidates are proven to refer to the same person-role, record the canonical equivalence/alias link explicitly while keeping raw source provenance intact.

## 4. Information Required 

to "Prove" or "Disprove" a Match

Store concrete, structured proof elements so decisions are verifiable, reproducible, and reversible if new facts arrive:

### Name & role comparison inputs

- Exact `raw_person_name`, `nfc_name`, and any folded, transliterated, or script-converted variants.

- Parsed name tokens/components (given/family names, particles like `van`/`de`/`al-`, suffixes) and BCP-47 language/script tags.

- `raw_role_text`, `canonical_role_code`, and any role context/scope (e.g., project/work ID, department, credit sequence, or time window).

### Corroborating vs. disconfirming

- Provenance metadata (source system, record/document ID, batch ID, source confidence/tier).

- Co-occurring non-conflicting or conflicting details (within privacy/scope limits), such as birth year/range, affiliation/organization, location/jurisdiction, or co-participants/linked entities.

- To prove a match: Consistent name/role structure plus aligned corroborating signals (e.g., matching affiliation, shared work/context, or verified alias/transliteration) with no irreconcilable contradictions.

- To disprove a match: Clear contradictions (e.g., mutually exclusive birth years/dates, conflicting authoritative IDs for separate individuals, or incompatible role/context attributes).

### Audit & re-evaluation metadata

- `decision` (`PROVEN`, `DISPROVEN`, `PENDING_EVIDENCE`), `supporting_signals` / `contradicting_signals`, `rule_or_model_version`, `decided_at`, `actor_id`, and `evidence_fingerprint` (hash of the evidence set so new supporting or contradicting data automatically triggers re-evaluation).

----

----

