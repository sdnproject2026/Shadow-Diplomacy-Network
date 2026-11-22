# Using Packages 

Across Research Content Repos

Since the same tooling will serve several repos with different subject matters, Packages become much more worthwhile.

The value comes from separating the engine (shared, versioned) from the content (per-repo), and, for people-focused research, from a shared people layer that groups can draw on.

## Where each piece belongs

### Per-repo content (md, pdf, csv)

  - Stays in each repo and deploys to its own github.io site

### Zip bundles and dataset snapshots

  - Releases, as attached assets

### Shared bash and LLM tooling

  - Packages (container image on GHCR)

### Shared people data (commons and group packs)

  - Packages (OCI artifacts on GHCR, or npm packages of md files)

### Subject-specific config

  - Stays in each repo: prompts, schemas, entity lists

### API keys

  - Actions secrets, injected at runtime

## Best uses of Packages here

### One shared tooling image on GHCR (strongest fit)

  - Contains jq, pandoc, poppler, Python or Node, the LLM client, and your sh scripts

  - Every research repo runs its workflow with `container: ghcr.io/you/research-tools:v1`

  - A fix in one place reaches all repos by bumping the version tag

### Separate engine from config

  - Image holds generic steps: ingest, extract, summarize, build graph, publish

  - Each repo supplies only `prompts/`, `schema.yml`, and `sources/`

  - New subject matter means new config, not new scripts

### Optional npm or Python CLI inside the image

  - Wrap the scripts as one command, e.g. `research-tools extract --schema schema.yml`

  - Publish standalone only if you want local installs outside Actions

## Shared people information across groups

### Core idea: people are shared, groups are views

  - A person is one entity that may appear in several cohesive groups

  - A group is a collection of people plus context about how they connect

  - Overlap happens naturally when the same person belongs to more than one group

### Two kinds of packages

  - People commons: canonical person cards reused by many groups

  - Group packs: one package per cohesive group (a circle, team, family, movement, era)

### Group pack contents

  - `group.md`: description, time span, how the group hangs together, sources

  - `members.md`: a plain list of member slugs with a short note on each role

  - `people/`: optional group-specific notes on a person ("in this group, she acted as...")

  - `interactions.md` or `interactions.csv`: events and relationships inside the group

  - `sources/`: citations or pointers to the original PDFs and documents

### Commons contents

  - One md file per person, named by a stable slug (e.g. `people/jane-doe.md`)

  - Light frontmatter: `id`, `names`, `aliases`, `born`, `died`, `groups`, `confidence`

  - Free-text body for biography, notes, and open questions

### Layered, not merged

  - Keep the canonical card short and stable

  - Put group-specific facts in overlay notes inside the group pack

  - Never overwrite one group's claims with another's; keep both with their sources

### How overlaps surface

  - A person's slug appearing in two `members.md` files links those groups

  - A build step lists "bridge people" (members of 2+ groups) and shows them on each group's site

  - Group-to-group links are derived from shared members, not hand-maintained

## Looser formatting, leveraging the LLM

### Not a strict RDBMS, by design

  - Markdown cards with loose frontmatter replace tables, foreign keys, and migrations

  - Fields can be missing, inconsistent, or free-text without breaking the build

  - The LLM reads the messy material and normalizes it when needed

### Use the LLM as the reconciler

  - Match name variants, nicknames, and spelling differences to existing slugs

  - Merge notes about the same person from different groups into a readable summary

  - Draft "same person?" candidates with reasons rather than silently merging

### Keep a human gate on identity

  - Store proposals in `candidates.md` with status: proposed, confirmed, rejected

  - Only confirmed matches update the `aliases` field in the commons

  - Wrong merges are the costliest error, so default to "keep separate"

### Normalize at build time, not at write time

  - Authors write naturally; a pipeline step extracts structure into `nodes.csv` and `edges.csv`

  - Derived files are disposable and regenerated from the markdown

  - Source of truth stays human-readable text in git

### Keep a small amount of fixed structure

  - Stable slugs for people and groups (the one strict rule)

  - A source reference on every claim

  - A confidence note on LLM-inferred links

  - Everything else can stay loose

## How packages distribute people data

### Publish each group pack as its own versioned package

  - e.g. `ghcr.io/you/people-group-<name>:v3` as an OCI artifact (via ORAS), or an npm package of md files

  - Content repos pin the versions they depend on

### Publish the commons as its own package

  - e.g. `ghcr.io/you/people-commons:v12`

  - Updated when new people are added or aliases are confirmed

### Consume in a workflow

  - Pull the commons and the relevant group packs into the build

  - Run the shared tooling image to resolve overlaps, build graphs, and generate pages

  - Deploy to github.io

### Alternatives if OCI feels heavy

  - A Release asset (tar or zip) per group pack, fetched by tag

  - A git submodule or sparse checkout of the commons repo

  - Choose Packages when you want version pinning and many consuming repos

## Fit for people, interactions, and connections

### Core pipeline stages to standardize

  - Source ingest: PDF to text, CSV cleanup, md normalization

  - Entity extraction: people, organizations, places, dates

  - Identity resolution against the commons (LLM proposes, human confirms)

  - Interaction extraction: who did what with whom, when, per which source

  - Graph build: `nodes.csv` and `edges.csv`, with a group tag on each edge

  - Site generation: profile pages, group pages, bridge-people views, timelines

### Keep outputs structured

  - Have LLM scripts emit JSON or CSV against a fixed schema, then validate it in CI

  - Every edge should carry a source citation and a confidence value

  - Structured outputs make diffs reviewable and rebuilds reproducible

### Cross-repo linking

  - Use stable IDs for people who appear in more than one repo

  - Link each person page to every group page they belong to

## Privacy and sourcing

- Decide per repo whether people are public figures, historical, or private individuals

- Keep unpublished source material in private repos or out of Pages output

- Add a CI step that flags sensitive fields (contact details, addresses) before deploy

- Record provenance for every claim so LLM-extracted links can be audited

- Treat LLM output as a draft; require review for relationship claims about real people

- Shared commons raise the stakes: a sensitive detail added once appears everywhere

  - Consider a `visibility` field per person or per field, honored at build time

  - Consider a private commons plus a public subset package

## Practical advice

- Tag images and packs by version and pin workflows to tags so older repos keep building

- Grant `packages: write` only to the publishing workflow

- Link each package to its source repo so permissions are inherited

- Set a cleanup policy to prune old versions

- Use a reusable workflow for the shared pipeline so each repo only needs a short caller file

- Cache LLM results keyed by source hash so rebuilds do not re-bill unchanged files

- Start small with the commons

  - Begin with a folder in one repo, split it into a package once a second group needs it

## Suggested structure

### research-tools repo

  - Dockerfile, sh scripts, LLM scripts, reusable workflow

  - Publishes `ghcr.io/you/research-tools` on each tagged release

### people-commons repo

  - `people/*.md`, `aliases`, `candidates.md`

  - Publishes `ghcr.io/you/people-commons` on each tagged release

### Each group pack repo (or folder)

  - `group.md`, `members.md`, `people/` overlays, `interactions`, `sources/`

  - Publishes `ghcr.io/you/people-group-<name>`

### Each content repo

  - `sources/`, `prompts/`, `schema.yml`, pinned list of commons and group pack versions

  - Thin workflow calling the shared one, deploying to its github.io

### Releases

  - Per-repo snapshots: zip bundles, `nodes.csv` and `edges.csv` exports, PDFs