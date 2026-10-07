# ProPublica

## ProPublica API

ProPublica provides several APIs and structured data repositories. For the Trump Team financial disclosures, the data is primarily hosted via the Trump Town interactive database and the ProPublica Data Store.

### Congress API Documentation

- https://projects.propublica.org/api-docs/congress-api/

### Campaign Finance API Documentation

- https://propublica.github.io/campaign-finance-api-docs/

### Nonprofit Explorer API Documentation

- https://projects.propublica.org/nonprofits/api/v2/

### ProPublica Data Terms of Use

- https://www.propublica.org/datastore/terms

## API Functional Endpoints

Below are the core URI structures used to programmatically interact with ProPublica's datasets.

All requests require an X-API-Key header.

### Member Financial Disclosures 

(Congress)

- https://api.propublica.org/congress/v1/members/{member-id}/financial_disclosures.json

### Presidential Civilian Nominations

- https://api.propublica.org/congress/v1/{congress}/nominees.json

### Candidate Search 

(Campaign Finance)

- https://api.propublica.org/campaign-finance/v1/{cycle}/candidates/search.json?query={name}

### Specific Filing Summary

- https://api.propublica.org/campaign-finance/v1/{cycle}/filings/{filing-id}.json

### Nonprofit Organization Details

- https://projects.propublica.org/nonprofits/api/v2/organizations/{ein}.json

### Data Structure Definitions

ProPublica datasets generally adhere to the following schema patterns for financial and biographical tables.

### Staffer/Appointee Table

### id

- Unique identifier for the individual.

### name

- Full name of the staffer.

### agency_slug

- Short name of the federal agency

- (e.g., "department-of-energy").

### role

- Official title held within the administration.

### Financial Disclosure Table

(Form 278e)

### asset_description

- Name of the holding, stock, or property.

### value_range

- Estimated worth

- (e.g., "$100,001 - $250,000").

### income_type

- Categorization of earnings

- (e.g., "Dividends," "Salary").

### income_amount

- The specific or range-based dollar amount earned.

### Lobbying/Ethics Table

### waived

- Boolean indicating if a conflict-of-interest waiver was granted.

### former_employer

- Entity the staffer worked for prior to government service.

### lobbying_firm

- If applicable, the firm where the individual was a registered lobbyist.

# Questions

Does ProPublica offer a single JSON dump that combines both the Trump Town staffing list and the individual OGE 278e data?

What is the procedure for obtaining an API key for the Campaign Finance v1 endpoints?

How are "Special Government Employees" flagged in the data structure compared to permanent political appointees?

Are the "Value Range" fields in the JSON responses standardized across different disclosure years?

Does the Congress API provide the raw text of the "Comments" section found in the original financial disclosure PDFs?

## Sources

- https://www.propublica.org/datastore/

- https://projects.propublica.org/api-docs/congress-api/

- https://propublica.github.io/campaign-finance-api-docs/

- https://projects.propublica.org/trump-town/

- https://github.com/propublica/

-----

## Data Roadblocks

When automating the extraction of financial disclosures from ProPublica, you must navigate a layer of technical and legal security measures. These are designed to prevent server abuse while ensuring compliance with government data usage policies.

## Access Control Requirements

### Authentication Header

- All API requests must include a valid API key passed in the custom header X-API-Key. Authentication via query string parameters is generally not supported.

### HTTPS Enforcement

- All endpoints require an encrypted HTTPS connection. Standard HTTP requests will be blocked or redirected.

### User Agent Identification

- While not always strictly enforced, using a descriptive User-Agent string in your requests

- (e.g., specifying your research project name) helps prevent your automated traffic from being flagged as malicious bot activity.

### Creative Commons Licensing

- Data is typically provided under a Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license. This means you must cite ProPublica and cannot legally sell the extracted data or use it for commercial gain without a separate licensing agreement.

## Throttling

### Daily Request Cap

- Most ProPublica APIs (Congress, Campaign Finance) are capped at 5,000 requests per day.

### Rate Limit Headers

- Responses include headers such as RateLimit-Remaining and RateLimit-Reset, which tell you exactly how many requests you have left and when the counter will reset (usually a 24-hour window).

### Concurrency Limits

- While there is no published "burst" limit, rapid-fire requests (multiple per second) may trigger a temporary 429 "Too Many Requests" error. It is best practice to include a short "sleep" delay

- (e.g., 0.5 to 1 second) between requests.

### Jina AI Limits

- If using the r.jina.ai prefix for conversion, be aware that Jina itself has its own rate limits and anti-scraping protections that may block you if you attempt to process hundreds of URLs in a single burst without a paid plan or proper spacing.

## Data Silos

### The "PDF Wall"

- Many disclosures are hosted only as scanned PDF files rather than HTML tables. Jina AI and standard scrapers cannot "read" these without an integrated OCR (Optical Character Recognition) layer.

### JavaScript Rendering

- The "Trump Town" database uses dynamic loading for its search results. A simple GET request may return an empty template; you often need a tool that can render JavaScript (like Jina or a headless browser) to see the actual links.

### No Single "Master List" Endpoint

- There is no public API endpoint that returns all 1,300+ disclosure URLs in one go. You are forced to scrape the paginated search results or purchase the pre-compiled CSV from the ProPublica Data Store.

### Historical Snapshots

- Some data is maintained as a "historical snapshot." If an appointee leaves or updates their filing, the API may not reflect changes in real-time, requiring you to cross-reference with official OGE (Office of Government Ethics) portals.

# Questions

What is the specific process for requesting a rate limit increase if 5,000 requests per day is insufficient for my project?

How can I tell if a specific appointee's disclosure is available in HTML or only as a scanned PDF?

Does ProPublica's "X-API-Key" requirement apply to the Trump Town web pages or just the structured API endpoints?

What are the common indicators in the Jina AI response that suggest a page was blocked by a firewall?

Is there a specific legal risk in using LLMs to re-distribute extracted data under a NonCommercial license?

## Sources

- https://projects.propublica.org/api-docs/congress-api/

- https://propublica.github.io/campaign-finance-api-docs/

- https://www.propublica.org/datastore/

- https://r.jina.ai/

- https://creativecommons.org/licenses/by-nc-nd/3.0/us/

-----

# Enumeration

To retrieve all financial disclosure data for the 1,500+ Trump appointees identified in the 2026 ProPublica "Trump Team" database, you must calculate your request volume based on a two-stage discovery and extraction process.

The following enumeration breaks down the required API and web requests against the 5,000 daily request cap.

## Request Category Enumeration

### Mapping the Directory

(Discovery Phase)

- 75 Requests.

- The "Trump Team" search index contains records for more than 1,500 appointees.

- ProPublica's search and directory results are paginated at 20 results per page.

- To identify all 1,500 staffers and capture their unique profile slugs, you must iterate through the search endpoint ($1500 / 20 = 75$ requests).

### Fetching Primary Disclosure Data

(Extraction Phase)

- 1,500 Requests.

- Each staffer has a unique landing page

- (e.g., .../appointees/staffer-name/) containing their structured OGE 278e financial data.

- A single GET request is required per staffer to retrieve the Jina-rendered Markdown stream via the r.jina.ai prefix.

### Accessing Supplementary Ethics Documents

(Deep Dive Phase)

- ~3,200 Requests.

- As of March 2026, ProPublica has released a trove of approximately 3,200 disclosure records.

- While there are 1,500 appointees, many high-level officials have multiple filings (New Entrant, Annual, Termination, and Ethics Agreements).

- To "get all" available records, you must account for one request for every document link found on a staffer's profile.

### Total Volume Against 5,000 Daily Cap

- ~4,775 Requests.

- Mapping (75) + Primary (1,500) + Supplementary (3,200) = 4,775 Total Requests.

- This volume represents approximately 95.5% of your 5,000-request daily limit.

## Technical Constraints and Strategy

### Rate Limit Buffer

- Running 4,775 requests in a single day leaves a very thin margin (225 requests). If your scraper retries failed attempts or encounters 404 errors, you will likely hit the cap. It is recommended to split the process over two days.

### Header Authentication

- Ensure every request to structured endpoints (API) includes your X-API-Key. Standard web "gets" via Jina AI (r.jina.ai) may not require this key but are subject to Jina's own independent throttling limits.

### The OCR Roadblock

- Even with 4,775 successful "gets," any disclosure marked as "View Original Filing (PDF)" will return binary data or an image wrapper. These require a secondary LLM or OCR process to convert into Markdown ASCII text.

### Wait Times

- To avoid a 429 "Too Many Requests" block, implement a staggered delay of at least 1 second between requests, which would result in a total execution time of approximately 1 hour and 20 minutes for the full dataset.

# Questions

Is there a way to request a temporary increase to the 5,000-request daily cap for academic or journalistic research?

How can I identify which of the 3,200 records are "New Entrant" filings versus "Annual" updates to avoid redundant processing?

Does the Jina AI Reader support batch processing, or must each of the 1,500+ URLs be submitted individually?

What is the best method for the LLM to verify that the extracted ASCII text matches the numeric values in the original PDF?

Are there specific Android tools that can monitor my API request count in real-time to prevent hitting the 5,000-cap?

## Sources

- https://www.propublica.org/article/trump-administration-financial-disclosures-steve-feinberg

- https://projects.propublica.org/trump-team-financial-disclosures/

- https://r.jina.ai/

- https://projects.propublica.org/api-docs/congress-api/

- https://www.propublica.org/datastore/

-----

# No JSON Dump

As of early 2026, ProPublica does not provide a single, public JSON dump that consolidates the staffing metadata and the granular financial details from individual OGE 278e forms.

While the "Trump Team" database is highly structured on the front end, the underlying technical infrastructure remains intentionally fragmented for several reasons.

## Accessibility Status

### Consolidated Master List

- The ProPublica Data Store typically offers a "Trump Town" CSV or JSON file containing high-level metadata (names, agencies, titles, and resume links). However, this file usually excludes the line-by-line financial data (assets, income, liabilities) found in the 278e forms.

### Granular Financial Data

- The line-by-line holdings are hosted in individual datasets or rendered as HTML tables on a per-staffer basis. ProPublica treats the 1,500+ disclosures as individual documents rather than a flat relational database for public download.

### Premium Datasets

- ProPublica occasionally releases comprehensive "bulk" datasets for a fee or specific research partnerships. You should check the current "Trump Team Financials" section of the [Data Store](https://www.propublica.org/datastore/) to see if a unified file has been added to their premium inventory.

## Siloed

### Document Integrity

- Many disclosures are legally filed as separate entities. ProPublica often extracts this data from PDFs, and the varied quality of these filings makes a single, clean JSON dump difficult to maintain.

### API Limits

- The [ProPublica Campaign Finance API](https://projects.propublica.org/api-docs/campaign-finance/) and [Congress API](https://projects.propublica.org/api-docs/congress-api/) focus on committee filings and legislative metadata, not executive branch appointee ethics forms.

### Update Frequency

- Financial disclosures are dynamic; an appointee might file an original report, an amendment, and a transaction report (OGE 278-T). Managing these as a single JSON "snapshot" could provide outdated information.

# Questions

Does the ProPublica Data Store currently offer any free datasets specifically for the 2025–2026 appointee cycle?

How can I use the Office of Government Ethics (OGE) official website to find the same 278e data in a more machine-readable format?

What are the specific headers required to access ProPublica's structured data via a standard GET request?

Is there a way to filter the ProPublica search results to only show staffers who have filed both an OGE 278e and an ethics waiver?

Can an LLM accurately parse the "Transactions" section of the Jina-converted Markdown text without missing date ranges?

## Sources

- https://www.propublica.org/datastore/

- https://projects.propublica.org/trump-team-financial-disclosures/

- https://jina.ai/reader/

- https://www.oge.gov/web/oge.nsf/Financial%2BDisclosure

- https://projects.propublica.org/api-docs/congress-api/

-----

# Structural Changes

The transition between the 2017–2021 "Trump Town" database and the 2026 "Trump Team" project involves several structural changes. Understanding these discrepancies is key to maintaining a clean dataset for your LLM processing.

## Database Slugs and Discrepancies

### Naming Convention Shifts

- ProPublica generally follows a lastname-firstname pattern for slugs. However, in the 2026 project, middle initials are more frequently incorporated into the slug

- (e.g., van-kirk-taylor-j) compared to the 2017 database, where middle initials were often omitted unless needed to resolve name collisions.

### Collision Resolution

- If a staffer appears in both administrations, they typically retain their original slug. If two different staffers share a name across both databases, the newer entry will receive a numeric suffix

- (e.g., john-doe-2), even if the "original" John Doe is no longer in government.

### URL Path Changes

- The 2017–2021 database is hosted under the /trump-town/ path, while the current 2026 project uses the /trump-team-financial-disclosures/ path. You cannot simply swap slugs between these two root URLs, as the page structures (HTML IDs and classes) have also been updated.

## Detecting Removed Staffers

### Baseline Comparison

- To detect removals, you must maintain a "golden master" CSV of slugs from your initial Data Store download. By comparing a new weekly export against this master list, any slug present in the old list but missing from the new one indicates a removal.

### 404 Monitoring

- Use a bulk URL checker or the Jina AI prefix to ping your list of slugs. A 404 Not Found response usually indicates a staffer has been removed from the live database, whereas a 200 OK with a "Termination Report" notice means they have left their position but their data remains public.

### Data Store Update Logs

- ProPublica occasionally includes a "change log" or "readme" file in their Data Store bundles. This file often notes significant deletions or agency-wide updates that could explain missing slugs.

## Data Store Fees and Access

### Premium Dataset Fees

- ProPublica typically charges for "premium" datasets that require significant manual cleaning. Historically, these fees are approximately $200 for journalists and $2,000 for academic/corporate researchers.

### Free Samples

- The Data Store usually provides a free "sample" download. This sample often contains a small subset of the data

- (e.g., the first 50 rows) and the full data dictionary, allowing you to test your LLM prompts before purchasing the full set.

### Basic Metadata

- While the interactive web search is free, downloading the curated CSV of 1,500+ names and slugs as a single file is almost always a "premium" feature requiring a fee. However, you can technically "scrape" these names for free via the paginated search results if you stay under the 5,000-request daily cap.

# Questions

Are there specific API parameters to filter for staffers who have filed "Termination" versus "New Entrant" reports?

How does ProPublica handle staffers who change their legal name during their time in the administration?

Does the premium Data Store purchase include access to the raw PDF files in addition to the CSV tables?

What is the most efficient way to cross-reference 2017 slugs with 2026 slugs to find returning officials?

Can the Jina AI Reader detect when a page has been "archived" versus when it is a live, active profile?

## Sources

- https://www.propublica.org/datastore/

- https://projects.propublica.org/trump-team-financial-disclosures/

- https://www.propublica.org/article/how-we-compiled-trump-town

- https://r.jina.ai/

- https://projects.propublica.org/trump-town/

-----

# Complete List

As of March 2026, the primary method for obtaining the complete list of 1,500+ staffer slugs is through the interactive search index or the "Trump Town" section of the ProPublica Data Store. These slugs act as the unique identifiers for every disclosure page and are essential for any Jina AI-based extraction workflow.

Below are the direct URLs where you can locate the snapshot lists of these identifiers.

## Identifier Source URLs

### Primary Search Index

(Paginated List):

This page contains the live, searchable list of all 1,500 appointees. By inspecting the URLs of the names listed here, you can extract the slugs

- (e.g., tatulyan-kevin).

- https://projects.propublica.org/trump-team-financial-disclosures/search/

### Department-Specific Snapshot

(e.g., State Department):

You can isolate slugs by agency to manage the 5,000-request daily cap in smaller batches.

- https://projects.propublica.org/trump-team-financial-disclosures/search/?agency=Department+of+State

### ProPublica Data Store

(CSV Snapshot Source):

The Data Store is the official location for downloading the "as-is" CSV or JSON files that contain the full column of staffer slugs.

- https://www.propublica.org/datastore/dataset/trump-town-appointees

### 2017–2021 Historical Snapshot

(Legacy Slugs):

Use this for cross-referencing officials who served in the first term and may have retained their original unique identifiers.

- https://projects.propublica.org/trump-town/staffers/

### ProPublica Graphics Landing Page:

A high-level visual index that often includes a "master table" of hundreds of officials and their financial summaries.

- https://projects.propublica.org/graphics/trump-disclosures

## Technical Identifier Structure

Each staffer is assigned a unique text-based ID called a slug. This slug is the final part of their profile URL.

### Standard Slug Format

- firstname-lastname or lastname-firstname

- (e.g., tatulyan-kevin).

### Collision Handling

- If two staffers have the same name, a numeric suffix is added

- (e.g., john-doe-2).

### Jina AI Construction

- To get the Markdown version of a staffer's data, you simply append their slug to the root path and prefix it:

- https://r.jina.ai/https://projects.propublica.org/trump-team-financial-disclosures/appointees/[staffer-slug]

# Questions

Is there a way to generate a full list of slugs using only the "Agency" landing pages instead of the main search?

Does the ProPublica Data Store provide the "date added" for each slug so I can track new appointees?

Are there any hidden API endpoints that return a JSON list of all 1,500 slugs in a single response?

How do I handle middle names that are hyphenated within the staffer slug during my automation?

Can I find the official OGE Filer ID number within the metadata provided in the Data Store CSV?

## Sources

- https://www.propublica.org/datastore/

- https://projects.propublica.org/trump-team-financial-disclosures/

- https://r.jina.ai/

- https://projects.propublica.org/api-docs/congress-api/

- https://www.oge.gov/web/oge.nsf/Financial%2BDisclosure

-----

-----
