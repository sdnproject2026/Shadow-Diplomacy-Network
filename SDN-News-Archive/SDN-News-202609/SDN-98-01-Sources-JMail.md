# JMail

Riley Walz is a software developer and creative technologist known for high-concept internet projects that often blend social commentary with technical mischief.

Together with developer Luke Igel, Walz has built a reputation for creating "digital artifacts" that resurrect or satirize controversial moments in internet history.

Their most high-profile collaboration, Jmail, is an interactive recreation of Jeffrey Epstein’s private email inbox.

The project was built using data from thousands of pages of unsealed court documents, organized into a functional, searchable email interface that allows users to browse the financier's correspondence as if they were logged into his account.

## June 2024

The duo officially released Jmail.

The project was designed as a "living archive," turning static legal PDF documents into a UI that mimicked the look of an early 2000s webmail provider.

## June 2024

Wired published a feature detailing Walz and Igel's work, labeling Walz a "prankster" for his history of disruptive digital art.

The article highlighted the ethical complexities of gamifying sensitive legal discovery.

## June 2024

Jmail gained significant viral traction on social media.

Walz and Igel clarified that while the interface was a "recreation," the content of the emails was strictly sourced from authentic, publicly available court filings from the Florida and New York investigations.

## Pros

### Accessibility

- It transforms thousands of pages of dense, unsearchable legal documents into a user-friendly format for researchers and the public.

### Accountability

- The project keeps high-profile legal evidence in the public eye through a medium that is more engaging than standard government archives.

### Innovation

- Demonstrates a unique "forensic UI" approach to data visualization and investigative journalism.

## Cons

### Sensationalism

- Critics argue that turning a sex trafficking investigation into a "browsable" experience risks trivializing the crimes and the victims' experiences.

### Privacy Concerns

- Even though the data is public, the easy searchability of the inbox may expose the contact information or peripheral details of individuals not directly involved in criminal activity.

### Deception Risk

- Because it is a recreation, casual users might confuse the artistic interface with a direct hack of a live server, leading to potential misinformation about how the data was obtained.

# Questions

Who is Riley Walz and what are some of his other notable "prank" projects outside of the Jmail recreation?

What specific legal documents or court cases were used to populate the data found within the Jmail interface?

How did Wired describe the technical process Luke Igel used to convert static PDFs into a functional email database?

What have been the primary ethical criticisms from legal experts regarding the gamification of the Epstein court records?

Has Jmail faced any legal challenges or takedown notices from the estates or individuals mentioned in the emails?

## Sources

- https://www.wired.com/story/jmail-jeffrey-epstein-email-inbox/

- https://jmail.cc/

- https://rileywalz.com/

- https://www.theverge.com/2024/6/20/24182570/jeffrey-epstein-emails-jmail-riley-walz-luke-igel

- https://www.rollingstone.com/culture/culture-news/jeffrey-epstein-emails-searchable-database-jmail-1235043530/

----

# Rolling Repository

Jmail has been updated to include the massive influx of data released under the Epstein Files Transparency Act (EFTA).

The creators, Riley Walz and Luke Igel, have transitioned the platform from a static archive into a rolling repository that integrates new tranches of government documents as they are unsealed.

Specifically, following the January 30, 2026, Department of Justice release of over 3 million pages, the site underwent significant updates to process and display the new material, which included approximately 180,000 images and 2,000 video files.

## November 2025

The creators launched the platform immediately following the House Oversight Committee’s first major document dump.

They utilized AI and LLMs to convert plain-text PDF files back into a searchable email format within a single five-hour development session.

## December 2025

Following the initial DOJ compliance deadline on December 19, the site was updated to include thousands of newly released photos and police reports.

During this period, the "JPhotos" extension was integrated to handle the influx of visual media.

## January 2026

The platform integrated the largest release to date, comprising 3.5 million pages.

The creators utilized a specialized AI tool called "Jemini" to parse the text-heavy releases and "Reducto" to extract data from the complex, often poorly scanned government PDFs.

## February 2026

Walz and Igel expanded the site into a full "Google Suite" parody, adding JDrive (for PDFs), JFlights (for flight logs), and Jotify (for audio recordings), ensuring all formats of the latest government releases are accessible through a familiar UI.

## Pros

### Speed of Access

- The use of AI allows the creators to make millions of pages "hyperlegible" and searchable within days of a government data dump, whereas manual review would take months.

### Crowdsourced Discovery

- The "Starred" feature allows the site's millions of visitors to highlight significant findings in new files, effectively acting as a public, real-time filtering system for the massive datasets.

### Cross-Media Integration

- By adding JPhotos and Jotify, the platform now links emails to related photos and audio files released in the latest batches, providing a more comprehensive investigative tool.

## Cons

### Data Verification Risks

- The rapid, AI-driven conversion of PDFs to emails can occasionally lead to formatting errors or "hallucinations" in how metadata is presented, potentially misrepresenting the original court records.

### Infrastructure Costs

- The massive increase in data - from 20,000 emails to millions of documents - has forced the creators to rely on public donations and significant personal investment to keep the servers running under the weight of 450 million page views.

### Redaction Sensitivity

- As the DOJ releases files on a "rolling basis," some documents have been briefly posted and then removed for privacy or redaction errors; Jmail’s permanent archiving of these files can create conflicts with government efforts to protect victim identities.

# Questions

What specific AI models or technical tools are Walz and Igel using to process the 3 million pages released in January 2026?

How does the "Jemini" AI feature within Jmail differ from standard search functions when navigating the Epstein Files Transparency Act releases?

Have there been any documented instances where the Jmail archive captured files that were later deleted or retracted from the official Department of Justice website?

What are the hosting and maintenance costs associated with managing a database that now holds millions of documents and images for 25 million unique visitors?

How does the "Jotify" feature organize the newly released audio recordings compared to the original raw files provided by the DOJ?

## Sources

- https://en.wikipedia.org/wiki/Jmail

- https://www.cjr.org/laurels-and-darts/youve-got-jmail-tool-clone-epstein-files-parse-mississippi-today-free-press-florida-medical-waiting-list-home-health-care.php

- https://www.livemint.com/news/us-news/jmail-crosses-450-million-page-views-what-is-the-gmail-like-tool-gaining-attention-amid-epstein-files-case-11770707052414.html

- https://www.justice.gov/opa/media/1426091/dl

- https://www.mashable.com/article/jmail-read-epstein-files-emails-gmail-interface

----

# Research Groups

Since the launch of Jmail by Riley Walz and Luke Igel, several independent developers and research groups have utilized similar AI pipelines - often combining Reducto, Google Gemini, or Vision-LLMs - to transform the massive Jeffrey Epstein document dumps into searchable, structured, or visually familiar interfaces.

The following projects and tools have emerged to recreate or expand upon the "Jmail-style" output of making fragmented legal PDFs hyperlegible.

## November 2025

Jmail.World

A community-driven expansion of the original concept that indexes materials from the House Oversight Committee and DOJ.

It organizes files into a "workspace" UI that includes email attachments and metadata filters.

## December 2025

Epstein's Phone 

- https://epsteinsphone.org

Developed by a user on Hacker News (toon-noot), this project uses a vision-LLM pipeline to reconstruct messages from thousands of image files released by the House.

It displays the content in a mobile-style "text message" UI rather than a desktop email client.

## January 2026

EpsteinFiles-RAG (GitHub)

An open-source repository by developer AnkitNayak-eth that provides the backend logic for a Retrieval-Augmented Generation (RAG) system.

It uses AI to parse the latest January 2026 DOJ releases, allowing users to query the documents via a chat interface.

## February 2026

Epstein Document Search (GitHub)

A project by developer paulgp that uses Meilisearch and Python scripts to process court documents into a fast, searchable index.

It emphasizes page-level indexing and metadata extraction for precise legal research.

## February 2026

Google Pinpoint: Epstein Estate

A repository created by the news organization COURIER.

While not a "parody" UI, it uses Google’s AI-powered journalist tools to perform the same function as Jmail: converting 20,000 fragmented estate files into a searchable database with entity extraction.

## Pros

### Diverse Visualization

- Different projects offer various "skins" (e.g., iPhone messages vs.

Google Drive), allowing researchers to view the data in the context that best suits their investigation.

### Open Source Transparency

- Unlike Jmail, which is a closed platform, projects on GitHub allow other developers to inspect the AI prompts and cleaning scripts to ensure the "recreated" text is accurate to the original.

### Feature Specialization

- Some alternatives focus on specific data types, such as "Epstein-Maxwell-Netviz," which creates interactive D3.js visualizations of connections between individuals rather than just displaying text.

## Cons

### Data Fragmentation

- The proliferation of multiple sites means there is no single "canonical" version of the archive, potentially leading to confusion if different AI models interpret redacted text differently.

### Hosting Reliability

- Many of these are solo-developer "Show HN" (Hacker News) projects and may not have the server infrastructure to handle the massive traffic spikes that occur after new document releases.

### Varying Accuracy

- Projects using basic OCR without the "Agentic OCR" self-correction found in professional tools like Reducto may contain more transcription errors or "hallucinated" words in poorly scanned sections.

# Questions

Is there an open-source version of the "Reducto" parsing engine that independent developers can use for their own Jmail clones?

How does the "Epstein's Phone" interface handle group chat threads compared to the standard email threads found in Jmail?

Which of these alternative platforms offers the most robust support for the 3.5 million pages released in January 2026?

Are there any collaborative efforts between these independent developers to create a single, unified open-source database of the Epstein files?

What are the primary differences in how Google Pinpoint and Jmail's "Jemini" AI summarize the same legal documents?

## Sources

- https://jmail.world/

- https://epsteinsphone.org/

- https://github.com/AnkitNayak-eth/EpsteinFiles-RAG

- https://github.com/paulgp/epstein-document-search

- https://journaliststudio.google.com/pinpoint/search?collection=092314e384a58618

- https://github.com/topics/epstein-files

- https://reducto.ai/

- https://news.ycombinator.com/item?id=46243658

----

# High-capacity Platforms

As of mid-February 2026, the digital landscape for Epstein-related data has consolidated around a few high-capacity platforms capable of indexing the massive 3.5 million-page release from January 30, 2026.

While the official Department of Justice (DOJ) Epstein Library remains the primary legal source, community-driven projects have become the preferred tools for researchers due to their superior search and cross-referencing capabilities.

## February 2026

Jmail 

- https://jmail.cc

Remains the most popular and robust interface.

It has successfully integrated the 3 million new pages released in January, expanding its "Google Suite" parody to include JDrive for PDFs and JPhotos for the 180,000 newly released images.

As of February 9, the site crossed 450 million pageviews, demonstrating its ability to handle massive traffic and data scale.

## February 2026

EpsteinFiles-RAG (GitHub / Reddit r/Rag)

This open-source project offers the most advanced technical support for the full 2026 dataset.

It utilizes a Retrieval-Augmented Generation (RAG) pipeline to process over 2 million unique pages from the latest dumps.

It is specifically designed for users who want to perform complex semantic searches and Q&A over the entire corpus using local LLMs.

## February 2026

Epstein Archive 

- https://epstein-docs.github.io

This platform provides a highly structured database that has been updated to include 12,243 people and 5,709 organizations mentioned in the latest files.

It offers 8,186 AI-generated summaries, making it a "robust" choice for those who need a summarized, person-centric view of the 3.5 million pages rather than just raw text.

## February 2026

The Epstein OSINT Database (Notion/Community)

There is a growing collaborative movement among independent OSINT (Open Source Intelligence) researchers to create a "Unified Truth Table." This effort aims to synchronize data between Jmail, Epstein’s Phone, and the Epstein Archive to ensure that nicknames and aliases (e.g., "J.E." or specific email handles) are mapped to a single, verified identity across all platforms.

## February 2026

Public GitHub Repositories

Developers are increasingly sharing "cleaning and chunking" scripts (MIT Licensed) on GitHub to help other researchers process the DOJ's often poorly scanned PDFs.

This "open-source collaboration" ensures that if one site goes down due to traffic or legal pressure, others can quickly spin up a clone using the same pre-processed data.

## February 2026

Lawmaker/Developer Feedback Loop

Following the "redaction errors" admitted by the DOJ in early February, independent developers have begun collaborating with victim advocates to identify and flag sensitive information that was inadvertently released, creating a "community redaction" layer that exists on top of the public archives.

## Pros

### Cross-Platform Accuracy

- Collaboration reduces "hallucinations" by allowing different AI models to check each other's work on the same set of 3.5 million pages.

### Resilience

- A unified, open-source approach prevents a "single point of failure" if the main Jmail site were to face a takedown or server crash.

### Advanced Discovery

- Shared "Entity Tracking" allows researchers to follow a single individual's mentions across emails, flight logs, and newly released video evidence simultaneously.

## Cons

### Decentralization Confusion

- With multiple "robust" versions of the same 3.5 million pages, casual users may struggle to know which site contains the most up-to-date or accurate transcriptions.

### Privacy Risks

- Unified databases make it easier for bad actors to weaponize the data, especially as developers work to "un-redact" or guess names that the DOJ attempted to hide.

### Technical Barrier

- While Jmail is user-friendly, the "most robust" open-source RAG tools require significant technical knowledge to install and run locally.

# Questions

Which platform currently offers the most accurate mapping of the 180,000 images to the specific email threads they were originally attached to?

Are there any active legal efforts to shut down the open-source GitHub repositories that host pre-processed versions of the 2026 Epstein files?

How do the "AI Analyses" on the Epstein Archive handle the conflicting information found in the 3.5 million pages compared to previous releases?

Is there a "master list" of verified aliases and email addresses being shared between Jmail and the Epstein OSINT Database?

Have any of the independent developers released a mobile app version of their unified database for real-time tracking of new releases?

## Sources

- https://www.justice.gov/opa/pr/department-justice-publishes-35-million-responsive-pages-compliance-epstein-files

- https://mashable.com/article/jmail-read-epstein-files-emails-gmail-interface

- https://epstein-docs.github.io/

- https://www.reddit.com/r/Rag/comments/1r1o9qz/epsteinfilesrag_building_a_rag_pipeline_on_2m/

- https://daftarsekolah.spmb.teknokrat.ac.id/2026/02/resource-guide-the-most-reliable-databases-for-epstein-related-research/

- https://www.wsls.com/news/politics/2026/02/06/justice-department-will-allow-lawmakers-to-see-unredacted-versions-of-released-epstein-files/

----



