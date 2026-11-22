# API-Scripted Pastes

## Short take

### paste publishing 

a reasonable redundancy and distribution layer

- The main privacy objection (exposing private individuals) largely falls away

- Obscurity is no longer protecting anything essential, so it becomes an optional nicety rather than a requirement

### Remaining risks 

from privacy to accuracy, attribution, and operations

- Wrong or overreaching relationship claims, host policy changes, scraping of your content without credit, and link rot

### Best role

disposable, verifiable mirrors of public artifacts, not a source of truth

## Where it has real use value

### Redundancy against single-point failure

- If the github.io site, repo, or account is suspended or reorganized, mirrors survive

- Several independent domains reduce exposure to any one vendor's policy change

### Cheap sharing and citation

- One URL for a group pack, a `nodes.csv` / `edges.csv` export, or a rendered summary

- Readers need no account or repo access

### Rendered-markdown hosting

- rentry-style services render md directly, which suits your md-heavy content

- Quick "read this snapshot" links without a full Pages build

### Pipeline-friendly

- A final CI step posts artifacts and writes the resulting URLs to a `mirrors.json` manifest

- Fits the existing Actions workflow and the shared tooling image

### Loose timestamping

- A public post with a known SHA-256 shows the content existed in that form at that time

- Weaker than a Release, Zenodo DOI, or Internet Archive capture, but cheap

### Discovery

- Public pastes can be indexed or shared, which may help if you want the research found

## obscurity 

does and does not buy you

### Hashed or unlisted URLs 

are still not access control

- Fine as a way to avoid clutter or casual discovery

- Not a reason to trust the host with anything you would regret being public

### integrity and tidiness

- Unguessable slugs prevent others from squatting or overwriting predictable URLs on hosts with custom slugs

- Edit and delete tokens matter more than the slug for preventing tampering

### Scraping is now mostly harmless

- If it is public anyway, being copied is acceptable

- The new concern is copies drifting out of date, so each mirror should state a version and point to the canonical source

## Remaining risks 

planning for

### Accuracy of LLM-inferred interactions

- Even for public professionals, a wrongly asserted relationship (e.g. "collaborated with", "reported to", "funded by") can mislead or defame

- Mirrors multiply a mistake you cannot fully retract

- Keep a confidence value and source citation on every edge, and publish only reviewed or high-confidence claims to mirrors

### Public does not mean unbounded

- Keep to people's public roles and publicly documented interactions

- Strip incidental personal details that leak in from sources (home addresses, personal contact info, family details, health, private social accounts)

- A CI scan for those fields before publishing is cheap insurance

### Aggregation still has an effect

- A compiled network can be more revealing than any single source

- Professional connection maps are usually fine; maps of private associations or whereabouts are not

### Terms of service

- Some hosts restrict automated bulk posting or posting about third parties

- Rate limits and bans would defeat the redundancy goal

### Deletion and corrections

- Delete APIs and edit codes vary and can fail

- Plan for corrections by publishing a new version and updating the manifest, rather than relying on deletion

## Mirror topology

### Primary (authoritative)

- github.io plus Releases, which you control, version, and can correct

### Same-domain redundancy

- Multiple posts on one host protect little against a ban or outage

- Still useful for versioning (one paste per release) or splitting large files

### Multi-domain redundancy

- Two or three unrelated hosts survive single-vendor failure

- Treat each as a disposable cache that points back to the canonical URL

### Combined pattern

- Same content on a few hosts, with one signed manifest listing every mirror and hash

### Better-fit durable alternatives

- Internet Archive 

    - (Wayback capture or item upload)

- Zenodo 

    - for a citable DOI and permanent versioned archives

- GitHub Gists

    - or a Codeberg/GitLab mirror of the repo

- IPFS 

    - pinning for content-addressed, hash-verifiable distribution

## Design for verifiable mirrors

### Publish a signed manifest

- Fields: 

    - mirror URLs, content SHA-256, package or release version, date, canonical URL

- Sign

    - with minisign or gpg, or use a GitHub-attested release asset

- Readers verify 

    - any mirror against the manifest

### Stable slugs, optionally derived

- `slug = truncate(HMAC(secret, content_hash))` gives reproducible, unguessable URLs

- Reruns are idempotent and mirrors never collide

- Skip the secret and use plain content hashes if you do not care about guessability

### Versioned posts

- Include the version tag and build date in a header line of each paste

- Link each mirror back to the Release and the github.io page

### Format for mirrors

- Plain md and CSV render and parse well on paste hosts

- Avoid binary blobs (zip, PDF) on pastes; keep those in Releases, Zenodo, or Internet Archive

### Optional encryption tier

- Only needed if some packs are unreviewed drafts or lower-confidence LLM output

- `age` or a client-side-encrypted service keeps ciphertext on the host

## Tiering what gets mirrored

### Mirror freely

- Reviewed group packs, `nodes.csv` and `edges.csv` with citations, group summaries, bridge-people lists

### Mirror with care

- Low-confidence inferred edges (label them clearly or leave them out)

- Long extracted text from sources (copyright and size)

### Keep off pastes

- Raw source PDFs and zips

- Unreviewed candidate identity matches (`candidates.md`)

- Anything flagged by the sensitive-field scan

## Scripting and operational notes

### API availability varies

- Pastebin has an official API with a dev key

- Other services may offer partial, undocumented, or restricted APIs, and these can change

- Check each service's current docs and terms before building against it

### Pipeline integration

- A final workflow job reads the build output, filters by `visibility: public`, posts to each configured host, and writes `mirrors.json`

- API keys live in Actions secrets, not in the image or repo

### Be a good citizen

- Throttle, retry with backoff, and skip hosts that error rather than hammering them

### Fail closed

- CI refuses to publish items lacking a source, a confidence value, or `visibility: public`

### Retention and audit

- Record every URL, hash, and edit or delete credential privately

- A scheduled job can check that mirrors still resolve and still match their hashes, then flag or repost

## Net assessment

### Worth doing

- Content is public, professional, and cited, and you want cheap redundancy

- You publish a signed hash manifest so mirrors are verifiable

- You treat mirrors as disposable copies, with github.io, Releases, and an archive as the real record

### Be cautious about

- Posting unreviewed LLM-inferred relationship claims

- Relying on same-domain duplicates as meaningful redundancy

- Using plain `http` hosts, even for public content

- Expecting hashed URLs to do any real access control

### Strongest combination

- Authoritative copy on github.io and Releases

- Durable public archive on Zenodo or Internet Archive

- Two or three paste mirrors of md and CSV, tied together by a signed manifest

----

----
