# LLMs Analyze Still Images

## Gemini 1.5 Pro

- General multimodal image understanding for still photos, including object and scene analysis.

### Pros / Cons

- Pros

  - Strong general-purpose vision and reasoning capabilities.

  - Good for descriptive and qualitative analysis of images.

- Cons

  - Not specialized for exact people counting.

  - Typically requires paid API usage.

### Paid / Free

- Paid

  - Used via Google’s paid Gemini API or platform plans.

### Bulk Image Processing

- Yes - supports batch-style interactions via API when configured for multiple images.

## ChatGPT 4o

- Capable of analyzing still images, generating captions, and answering questions about visual content.

### Pros / Cons

- Pros

  - Very accessible and easy to use in chat form.

  - Good qualitative understanding of image content.

- Cons

  - Generic description focus; not optimized for precise counts.

  - Usage is tied to OpenAI subscription or API billing.

### Paid / Free

- Paid

  - Access via paid OpenAI subscription tiers or API usage.

### Bulk Image Processing

- Yes - can handle multiple images in sequence over an API, but not a native “bulk” ingestion pipeline without custom orchestration.

## Claude

- Multimodal model for analyzing still images and describing their contents in structured text.

### Pros / Cons

- Pros

  - Good at natural-language description and reasoning over images.

  - Use cases range from simple description to light visual QA.

- Cons

  - Not tuned for specialized counting or gender detection.

  - Relies on Anthropic’s paid access model.

### Paid / Free

- Paid

  - Access via paid usage on Anthropic’s platform or API.

### Bulk Image Processing

- Yes - supports sending multiple images in sequence through API, depending on rate limits and tools.

## LLaVA

- Open multimodal model family designed for still-image analysis and visual question answering.

### Pros / Cons

- Pros

  - Open-source, can be self-hosted and customized.

  - Good for general image understanding in research or local setups.

- Cons

  - Requires more setup and compute resources.

  - Not targeted at counting or gender classification out of the box.

### Paid / Free

- Free

  - Open-source, free to download and run locally.

### Bulk Image Processing

- Yes/No - technically yes if you script batch processing, but no built-in “bulk” web console; it depends on your custom pipeline.

## Qwen‑VL

- Multimodal model family for image understanding and visual question answering.

### Pros / Cons

- Pros

  - Open options available with strong English and code-aware variants.

  - Suitable for general image description and QA.

- Cons

  - Not optimized specifically for counting or gender detection.

  - May require local deployment or use of partner platforms.

### Paid / Free

- Partially Free

  - Some open-source versions are free; cloud-hosted APIs may be paid.

### Bulk Image Processing

- Yes/No - bulk-capable if you build a pipeline around the model, but no native mass‑upload UI.

## CogVLM

- Open multimodal model for image reasoning and description tasks.

### Pros / Cons

- Pros

  - Good performance on commonsense visual reasoning.

  - Open weights available for local use.

- Cons

  - Requires GPU and setup effort.

  - Not specialized for people counting or gender labels.

### Paid / Free

- Free

  - Open-source, can be run locally at no direct cost.

### Bulk Image Processing

- Yes/No - feasible via scripts and batch inference, but no built-in bulk web tooling.

## Sightengine

- API built specifically for detecting and counting people in images and videos.

### Pros / Cons

- Pros

  - Optimized for people counting and crowd analysis.

  - Robust and production-ready for volume use.

- Cons

  - Focused on detection and count, less on general description.

  - Relies on a commercial API.

### Paid / Free

- Paid

  - Operates on a usage‑based paid API model.

### Bulk Image Processing

- Yes - designed for processing many images or video streams in bulk.

## Nyckel

- Offers image classifiers for people counting and related tasks.

### Pros / Cons

- Pros

  - Simple setup for detecting people and counting them.

  - Can be configured for gender‑aware counting workflows.

- Cons

  - Limited to the scope of its classifier framework.

  - Hosted platform with usage‑based pricing.

### Paid / Free

- Paid

  - Runs on a paid, usage‑based API model.

### Bulk Image Processing

- Yes - supports sending multiple images to the classifier in batch.

## OpenCV‑Based Human Counting

- General computer‑vision approach using libraries like OpenCV for counting people in images.

### Pros / Cons

- Pros

  - Highly customizable and free to use.

  - Can be integrated with gender‑classification models.

- Cons

  - Requires more development and tuning.

  - Accuracy depends on model quality and scene conditions.

### Paid / Free

- Free

  - Libraries such as OpenCV are free and open‑source.

### Bulk Image Processing

- Yes - easy to script bulk processing over directories of images.

## DeepFace

- Face‑analysis library often used for gender, age, and emotion detection.

### Pros / Cons

- Pros

  - Simple to use for face‑level attributes like gender.

  - Can be combined with counting pipelines.

- Cons

  - Not optimized for counting people in a scene.

  - Gender labels are probabilistic and context‑sensitive.

### Paid / Free

- Free

  - Open‑source Python library.

### Bulk Image Processing

- Yes - can be scripted to process many images in a loop.

## Google Cloud Vision

- Cloud API for detecting faces, objects, and related attributes in images.

### Pros / Cons

- Pros

  - Production‑grade API with strong support.

  - Good for finding faces and basic attributes.

- Cons

  - Billing per image or per API call.

  - Not specifically tuned for precise people counting.

### Paid / Free

- Paid

  - Usage‑based pricing on Google Cloud.

### Bulk Image Processing

- Yes - supports batch operations via the Vision API and batch requests.

----- 

# Tor

Gemini

- Tor causes access problems (CAPTCHA blocks) 

- App Over Orbot

    - No (Google Play restrictions)

Perplexity

- Tor causes access problems (rate limits) 

- App Over Orbot

    - Partial (Orbot works inconsistently)

ChatGPT

- Tor causes access problems (frequent blocks) 

- App Over Orbot

    - No (OpenAI detects Tor)

Copilot

- Tor causes access problems (Microsoft blocks) 

- App Over Orbot

    - No

Duck

- Tor works reliably 

- App Over Orbot

    - Yes (privacy-focused)

Claude

- Tor causes access problems (Anthropic blocks) 

- App Over Orbot

    - Web/PWA only

Lumo

- Tor causes access problems (Proton restrictions) 

- App Over Orbot

    - No official app

Pi

- Tor causes access problems 

- App Over Orbot

    - Partial

Poe

- Tor causes access problems 

- App Over Orbot

    - Partial

Tidio

- Tor causes access problems (business service) 

- App Over Orbot

    - No

Intercom

- Tor causes access problems 

- App Over Orbot

    - SDK only

Drift

- Tor causes access problems 

- App Over Orbot

    - No

Lindy

- Tor causes access problems 

- App Over Orbot

    - Web only

Midjourney

- Tor blocked (Discord detects) 

- App Over Orbot

    - No (Discord blocks Tor)

DALL·E v3

- Tor causes access problems 

- App Over Orbot

    - No

Adobe Firefly

- Tor causes access problems 

- App Over Orbot

    - No

Leonardo

- Tor causes access problems 

- App Over Orbot

    - Partial

Canva

- Tor works with delays 

- App Over Orbot

    - Yes

Ideogram

- Tor causes access problems 

- App Over Orbot

    - Web only

Imagen 3

- Tor causes access problems (Google) 

- App Over Orbot

    - No

Recraft

- Tor causes access problems 

- App Over Orbot

    - Web only

DreamStudio

- Tor causes access problems 

- App Over Orbot

    - Web only

Freepik

- Tor works 

- App Over Orbot

    - Yes

Runway

- Tor causes access problems 

- App Over Orbot

    - No

Synthesia

- Tor causes access problems 

- App Over Orbot

    - Web only

Veo

- Tor causes access problems (Google Labs) 

- App Over Orbot

    - No

Sora

- Tor causes access problems 

- App Over Orbot

    - No

HeyGen

- Tor causes access problems 

- App Over Orbot

    - Partial

DeepBrain

- Tor causes access problems 

- App Over Orbot

    - No

InVideo

- Tor works with delays 

- App Over Orbot

    - Yes

LTX Studio

- Tor causes access problems 

- App Over Orbot

    - Web only

Kling

- Tor causes severe network errors 

- App Over Orbot

    - No (upload failures)

Jina AI

- Tor works (API-focused) 

- App Over Orbot

    - API only

-----

-----

