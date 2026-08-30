# Bing hand‑buildable sketch

Here is a concise workflow using Bing Image Creator (DALL·E 3) to generate a hand‑buildable sketch of a car rear‑deck / trunk‑lid system with a piano hinge, including measurements and parts.

## Workflow

### 1. Open and prepare Bing Image Creator

- Open a browser and go to https://www.bing.com/images/create .  

- Sign in with a Microsoft account (not strictly required, but improves generation limits).  

- In the prompt box, confirm the model is set to DALL·E 3 (if given a model choice).  

### 2. Define the visual style (optional but helpful)

Before diving into the hinge‑specific prompt, choose a style that keeps the drawing simple and readable, not photorealistic. For example, add to the prompt:

- "simple 2D technical line drawing"  

- "no shading, only lines, arrows, and text labels"  

- "top‑down and side view, not 3D rendered"  

This helps Bing produce a sketch closer to a hand‑buildable plan.  

### 3. Write the main DALL‑E 3 prompt

Use a single prompt that explicitly asks for both the image and a text‑style spec list below it. Example (copy‑paste‑ready):

- "Draw a simple 2D technical sketch of a car rear‑deck lid system with a piano hinge.  

- The lid is attached along the full width of the trunk opening using one piano hinge.  

- Show:  

  - the trunk lid panel  

  - the rear‑deck structure it’s attached to  

  - the piano hinge clearly visible along the top edge  

- Use arrows and text labels to show the following dimensions in millimeters:  

  - total length of the lid  

  - total width of the lid  

  - panel thickness  

  - distance from the hinge line to the front edge of the lid  

  - distance from the hinge line to the rear edge of the lid  

- Below the drawing, in a simple text list, include:  

  - one piano hinge (length equal to the lid width, material: stainless steel)  

  - panel material (e.g., plywood or steel sheet, thickness in mm)  

  - quantity of hinge mounting screws  

  - minimal gap between the lid and the rear‑deck edge  

  - typical hand‑installation tools needed (screwdriver, clamps, measuring tape)  

- Keep the drawing schematic, not a realistic photo; use only lines, arrows, and text labels."

This style of prompt is recommended for DALL·E 3 in Bing to get better prompt following and coherent labels.  

### 4. Generate and review the first image

- Press Create (or the equivalent button) to generate the first set of images.  

- Look for any clear, readable sketch that includes:  

  - a hinge line across the top edge  

  - arrows pointing to dimensions  

  - short text labels near the arrows (e.g., “1200 mm”)  

If the image is too artistic, you can regenerate with a stricter prompt:

- "Exactly as above, but simplify further: only black lines, no colors, no shading, and text labels must be legible."  

### 5. Refine to emphasize measurements and parts

If the first output lacks clear measurements or parts, regenerate with a slightly adjusted prompt:

- "Redraw the same car rear‑deck lid with piano hinge, but:

  - Add at least 5 explicit dimension labels in mm.

  - Add a small text box below the drawing that lists:

    - Panel material and thickness

    - Piano hinge length and material

    - Number and type of screws

    - Required tools

  - Make sure the text is clearly readable and not overlapped by lines."

This iterative refinement is typical with Bing Image Creator and DALL·E 3, since more detail in the prompt tends to yield more precise labels.  

### 6. Use the sketch as a hand‑build plan

Once you get a clear version:

- Export the image (right‑click → Save image) to your device or cloud storage.  

- Print or trace it on cardboard/wood, then manually write in any missing numbers or part notes.  

- Treat the piano‑hinge line and dimension arrows as guides for cutting, drilling, and screw placement.  

This workflow lets you get a free, DALL·E‑3‑powered, labeled sketch of a piano‑hinged trunk‑lid rear‑deck, suitable for hand building, directly from Bing Image Creator.  

## Sources

- https://www.bing.com/images/create  

- https://www.bing.com/images/create/ai-image-generator  

- https://www.microsoft.com/en-us/bing/features/bing-image-creator  

- https://blogs.bing.com/search/october-2023/DALL-E-3-now-available-in-Bing-Chat-and-Bing-com/create-for-free  

-----

# LLMs Small‑design Ranking

9 - https://www.siliconflow.com

- LLM hosting platform offering free trials of image‑capable models; supports materials and measurement specs via API prompts)  

8 - https://www.fireworks.ai

- Fireworks free tier, LLM API‑style platform that can target design‑spec outputs; images via external image hosts)  

7 - https://www.cohere.com

- Cohere free tier for reasoning and parts lists; image generation via external tools)  

6 - https://www.deepseek.com

- DeepSeek free tier, strong text reasoning for materials and measurements; image‑generation via external tools)  

5 - https://perplexity.ai

- free‑tier Perplexity LLM, can output detailed material and measurement lists; image generation via web view or pairing with image sites)  

4 - https://ai.meta.com/llama

- Meta Llama, free‑tier / hosted instances can generate design‑text specs and simple SVG‑style diagrams when paired with image tools)  

3 - https://huggingface.co

- hosted open‑source LLMs and image models; many free models for sketch‑style diagrams and text specs, local or web, without paywall)  

2 - https://gemini.google.com

- Google Gemini, free images with credits, supports simple labeled diagrams, materials, and measurement descriptions)  

1 - https://chat.openai.com

- OpenAI ChatGPT with DALL·E, paid tier best, but free‑tier mobile access exists; can generate labeled sketches plus materials and measurement lists)  

0 - https://www.bing.com/images/create

- Bing Image Creator using DALL·E 3, free tier, strong image drawing, supports text labels for measurements and materials)  

-----

# image‑generator systems

Below are the LLMs and image‑generator systems that work best for drawing small, CAD‑free, hand‑built designs with explicit measurements and parts lists. Each entry includes payment model, main pros/cons, app/website, and how to activate the image‑generation or design module on Android.

## OpenAI DALL·E 3 (via ChatGPT Plus)

### Free or paid

- Primarily paid: ChatGPT Plus (GPT‑4 / DALL·E 3 access) is subscription‑based. [businesswaretech](https://www.businesswaretech.com/blog/benchmarking-ai-on-tables-and-engineering-drawings-results-findings)

- Free tier of ChatGPT usually does not include DALL·E image generation. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

### Pros

- Very strong at interpreting “hand‑buildable” instructions and embedding measurements and part lists alongside sketches. [businesswaretech](https://www.businesswaretech.com/blog/benchmarking-ai-on-tables-and-engineering-drawings-results-findings)

- Can generate simple 2D diagrams directly from text and keep text labels (e.g., “150 mm”) on the image. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

### Cons

- Image‑generation module is locked behind the paid ChatGPT Plus tier. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

- No true offline / local mode; requires internet.

### Android app / website

- App: ChatGPT (Android) from OpenAI; website: https://chat.openai.com. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

### How to activate image and design module

- Ensure you are logged into a ChatGPT Plus account.  

- Start a new chat and type, for example:  

  - “Use DALL·E to generate an image”  

  - Then follow with your design prompt (see example prompt at the end). [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

## Google Gemini 2.5 Pro (with Imagen 3)

### Free or paid

- Free tier: basic Gemini in the app and Google AI Studio. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

- Paid / higher‑tier access: via Google AI Studio or Workspace/Enterprise plans for heavy usage. [architizer](https://architizer.com/blog/practice/tools/top-ai-tools-for-architects-and-designers/)

### Pros

- Excellent at technical and engineering‑style prompts, so it can keep dimension values and part counts consistent. [architizer](https://architizer.com/blog/practice/tools/top-ai-tools-for-architects-and-designers/)

- On Android, image generation and text reasoning are integrated into one app. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

### Cons

- Image quality lags slightly behind DALL·E 3 for very precise line‑style diagrams. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

- Some advanced features may require higher‑tier or developer accounts.

### Android app / website

- App: Gemini app on Google Play; website: https://gemini.google.com. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

### How to activate image and design module

- In the Android app, enable the image‑generation setting (usually under “Models” or “Features”).  

- Start a new chat and write:  

  - “Generate an image of this design”  

  - Then paste your design prompt; the model will auto‑trigger image‑gen if the account level allows it. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

## Claude 3.5 / 3.7 (via Anthropic / mobile partners)

### Free or paid

- Claude 3.5 and 3.7 run on paid tiers (e.g., Claude Pro). [jampa](https://www.jampa.dev/p/should-i-get-a-designer-an-llm-benchmark)

- Some integrations (Slack, third‑party apps) may offer limited free use. [architizer](https://architizer.com/blog/practice/tools/top-ai-tools-for-architects-and-designers/)

### Pros

- Exceptionally strong at parsing long, structured prompts and outputting clear measurements and parts lists. [jampa](https://www.jampa.dev/p/should-i-get-a-designer-an-llm-benchmark)

- When paired with an image‑generator (e.g., via another tool), it can directly advise how to draw each view and label dimensions. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

### Cons

- Native image generation is not always available directly in the main Anthropic web UI; often requires a separate image‑generator integration. [eweek](https://www.eweek.com/artificial-intelligence/best-ai-3d-generators/)

- Full feature set is gated behind paid plans.

### Android app / website

- App: via integrations such as the Claude app or partner apps on Android; web: https://claude.ai. [jampa](https://www.jampa.dev/p/should-i-get-a-designer-an-llm-benchmark)

### How to activate image and design module

- In the web UI or app, choose the Claude 3.5 / 3.7 model from the model selector.  

- Then ask explicitly:  

  - “Create a text description of a 2D sketch of this design, then, if you can, generate an image of it.”  

  - If the platform supports image generation, it will trigger the image module when the prompt is sufficiently image‑oriented. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

## Llama‑3‑class 8B / GLM‑4‑9B (small local models)

### Free or paid

- Llama‑3‑based systems are typically free and open‑source (self‑hosted). [siliconflow](https://www.siliconflow.com/articles/en/best-small-LLMs-for-personal-projects)

- GLM‑4‑9B and similar can also be free depending on the hosting provider. [siliconflow](https://www.siliconflow.com/articles/en/best-small-LLMs-for-personal-projects)

### Pros

- Can run locally on Android devices or PCs, so no cloud‑based cost after setup. [siliconflow](https://www.siliconflow.com/articles/en/best-small-LLMs-for-personal-projects)

- Can generate simple SVG‑style diagrams and text‑only part lists suitable for hand‑built projects. [reddit](https://www.reddit.com/r/LocalLLaMA/comments/1hj50f5/best_small_llms_for_realworld_use_your/)

### Cons

- Image rendering quality is lower than DALL·E 3 or Gemini; better suited for rough sketches than polished diagrams. [siliconflow](https://www.siliconflow.com/articles/en/best-small-LLMs-for-personal-projects)

- Requires technical setup and usually pairing with a separate image‑generator app or local UI.

### Android app / website

- App: usually via local‑LLM apps such as Ollama mobile, LM Studio on a PC, or other Android‑based local‑model runners.  

- Websites for models: Meta Llama at https://ai.meta.com/llama, GLM via OpenBMB / GLM web demos. [siliconflow](https://www.siliconflow.com/articles/en/best-small-LLMs-for-personal-projects)

### How to activate image and design module

- Run the model inside a local‑LLM app that supports image export (e.g., SVG / text‑based diagrams).  

- In the chat, ask:  

  - “Describe and then draw this as a simple 2D SVG‑style diagram, including all dimensions as text labels.”  

  - Then let the app export the ASCII‑style or SVG sketch and list of parts. [siliconflow](https://www.siliconflow.com/articles/en/best-small-LLMs-for-personal-projects)

## DALL·E 3 + Midjourney (for visual clarity)

### Free or paid

- DALL·E 3: via ChatGPT Plus (paid). [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

- Midjourney: paid via Discord subscription; no official Android app, but accessible via browser or Discord mobile. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

### Pros

- Midjourney is very strong at clean, artistic but still readable diagrams and can embed simple text labels if prompted carefully. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

- DALL·E 3 excels at labeled technical sketches and can be combined in a workflow: DALL·E for the labeled sketch, Midjourney for clearer visuals. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

### Cons

- Midjourney text is not always reliable; labels can distort or become unreadable. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

- Both require paid subscriptions and are not fully offline. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

### Android app / website

- App: ChatGPT (Android) for DALL·E 3; Discord app for Midjourney prompts.  

- Website: https://chat.openai.com (DALL·E), https://www.midjourney.com (Midjourney). [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

### How to activate image and design module

- For DALL·E 3: in ChatGPT mobile, select the model (GPT‑4 / DALL·E) and include “generate an image” in the prompt. [reddit](https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/)

- For Midjourney: in Discord mobile, type `/imagine` and paste your prompt; the bot will activate image generation automatically. [botpenguin](https://botpenguin.com/blogs/comparing-the-best-llms-for-image-generation)

## Example LLM prompt you can copy‑paste

### Design prompt (for any of the above)

- “Draw a small wooden box that can be built by hand, without CAD.  

- Show only one simple side view.  

- Label all dimensions in millimeters (length, width, height, thickness).  

- Below the image, list:  

  - Number and sizes of boards  

  - Screws or nails needed  

  - Tools required  

- Do not render this as a 3D model or professional CAD drawing; keep it as a simple 2D sketch for hand building.”

This prompt style works particularly well with DALL·E 3, Gemini 2.5 Pro, and Claude 3.5/3.7. [businesswaretech](https://www.businesswaretech.com/blog/benchmarking-ai-on-tables-and-engineering-drawings-results-findings)

-----

## Sources

- https://chat.openai.com  

- https://gemini.google.com  

- https://claude.ai  

- https://ai.meta.com/llama  

- https://www.midjourney.com  

- https://www.businesswaretech.com/blog/benchmarking-ai-on-tables-and-engineering-drawings-results-findings  

- https://www.reddit.com/r/IndustrialDesign/comments/1q55zdv/ai_tools_for_sketches_to_renders/  

# Questions

What type of hand‑built project are you planning to design first (e.g., simple shelf, box, tool rack)?  

Do you prefer working entirely offline on your Android device, or are you okay with cloud‑based tools?  

Would you rather focus on highly accurate dimension‑only text output and a very rough sketch, or a more polished but less precise visual?  

Do you want the LLM to also suggest common lumber sizes (e.g., 1x or 2x stock) and hardware (e.g., 2‑inch screws) for a typical workshop?  

Are you comfortable installing a local‑LLM app on Android, or would you prefer a purely web‑based solution?  

-----

-----

