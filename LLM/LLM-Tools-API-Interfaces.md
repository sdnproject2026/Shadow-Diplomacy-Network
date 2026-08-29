# API interfaces 

## Remote Directory Storage 

### Rclone

- This is the standard command line tool for Termux to manage Google Drive. It allows you to mount the drive as a local directory or use sync and copy commands.

### Gdrive

- A dedicated command line utility for Google Drive that focuses on simple file uploading, downloading, and sharing via a shell scriptable interface.

### Google Drive API

- You can interact directly with the REST API using curl by setting up an OAuth2 client ID and obtaining a bearer token for file operations.

## Email Services

### Proton Mail Send Email

### Proton Mail Bridge

- To send emails via script, you must run the Bridge in a background process or use the headless version to expose a local SMTP interface at 127.0.0.1.

### Hydroxide

- An open source third party Bridge implementation that is lightweight and often easier to run in a containerized or resource constrained Termux environment.

### SMTP-CLI

- Once a bridge is active, this perl script can be used within Termux to send attachments and formatted emails through the local bridge port.

## URL Content Hashing

### Hashy

- An online API service where you submit a URL and it returns a cryptographic hash of the current page content for change detection.

### Content-Hash API

- A simple microservice that fetches a URL and returns a SHA-256 or MD5 string of the body to verify integrity via curl.

### Common Crawl

- While more complex, you can query their index via API to get historical hashes of URL content to compare changes over time.

## Pastebin And Alternatives

### Pastebin API

- The official API allows you to create pastes by sending a POST request with an API dev key and the text content.

### Hastebin

- A popular open source alternative that provides a clean REST API where you can pipe text directly into a POST request to get a short URL.

### Paste.ee

- A feature rich alternative that supports encrypted pastes and has a very simple API designed for command line users.

### 0bin

- Focuses on client side encryption, allowing you to host or use public instances where the API accepts encrypted blobs for secure sharing.

## URL Shortening

### TinyURL API

- Offers a straightforward GET based API where you pass the long URL as a parameter and receive the shortened string in plain text.

### Bitly

- A more robust service requiring an access token, but providing detailed analytics and a professional REST API for script integration.

### Is.gd

- A simple, no sign up required shortener that provides a plain text API response specifically optimized for shell scripts.

### Shorte.st

- An alternative that provides an API for shortening links with options for monetization or direct redirection.

## PDF To Markdown

### PDFRest

- A dedicated API toolkit that allows you to upload a PDF via curl and receive a structured Markdown file in the response.

### CloudConvert

- A massive conversion platform that supports PDF to Markdown and can be automated using their REST API and a secret key.

### Aspose.PDF

- Provides a high fidelity cloud API for document conversion that preserves tables and formatting when moving from PDF to Markdown.

## Image OCR 

### OCR.space

- Offers a free tier API that accepts image URLs or file uploads and returns the extracted text in a JSON object.

### Tesseract OCR

- While primarily a local tool, it can be used in Termux alongside wrappers that call public Tesseract API endpoints.

### Google Vision API

- The gold standard for accuracy; it can be called via curl to perform OCR on images stored in Google Cloud or sent as base64 strings.

## MP4 Transcript To Text

### AssemblyAI

- A developer focused API that allows you to upload MP4 files and receive a highly accurate text transcript with speaker labels.

### Rev.ai

- Provides a robust transcription API that handles various video formats and returns plain text or SRT files for scripts.

### Deepgram

- Known for high speed transcription; their API is optimized for real time and batch processing of video audio streams.

## Sources

- https://rclone.org/drive/

- https://github.com/ProtonMail/proton-bridge

- https://pdfrest.com/learning/tutorials/how-to-convert-pdf-to-markdown-with-curl/

- https://ocr.space/OCRAPI

- https://www.assemblyai.com/docs

# Questions

How do I configure Rclone to use a service account for headless Google Drive access in Termux?

What is the specific curl command syntax for sending a text file to Hastebin?

Is it possible to run the Proton Mail Bridge natively in Termux without a full Linux distribution?

Which OCR API provides the best support for handwriting recognition in images?

What are the daily rate limits for the free tier of the TinyURL API?

-----

-----