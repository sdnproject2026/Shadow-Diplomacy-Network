# OCR API Providers 

## OpenAI – GPT‑4o‑mini Vision OCR

- Type: Multimodal LLM with OCR  

- Free tier (realistic): One‑time free credit for new accounts; no ongoing free tier  

- Pricing (approx): Low per‑token cost; around $0.15 per 1M input tokens and $0.60 per 1M output tokens  

- Rate limits (typical): Low on unverified accounts; higher once billing is enabled  

- Requirements: OpenAI account, email verification, API key  

- Pros: Very cheap per token, strong OCR on complex layouts  

- Cons: No recurring free tier  

- Endpoint:

```
POST https://api.openai.com/v1/chat/completions

```

## Google Gemini Flash (AI Studio)

- Type: Multimodal LLM  

- Free tier (realistic): Large daily token quota (region‑dependent), no credit card  

- Pricing (approx): Pay per 1M tokens after free quota  

- Rate limits (typical): Per‑minute throttling  

- Requirements: Google account, enable Gemini API, API key  

- Pros: Very generous free tier, strong OCR reasoning  

- Cons: Strict rate limits  

- Endpoint:

```
POST https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent

```

## Microsoft Azure Computer Vision OCR

- Type: Dedicated OCR API  

- Free tier (realistic): About 5,000 OCR transactions per month  

- Pricing (approx): Billed per 1,000 OCR calls after free tier  

- Rate limits (typical): Around 20 requests per minute  

- Requirements: Azure account, Vision resource, API key  

- Pros: Strong specialized OCR, multi‑language support  

- Cons: Requires Azure subscription  

- Endpoint:

```
POST https://<region>.api.cognitive.microsoft.com/vision/v3.2/ocr

```

## Google Cloud Vision OCR

- Type: Dedicated OCR/vision API  

- Free tier (realistic): Small monthly free allowance  

- Pricing (approx): Pay per 1,000 units after free tier  

- Rate limits (typical): Standard Google Cloud quotas  

- Requirements: Google Cloud project  

- Pros: High accuracy for documents  

- Cons: Free tier is small

## OCR.Space API

- Type: Dedicated OCR API  

- Free tier (realistic): About 500 requests/day per IP; 1 request/sec  

- Pricing (approx): Paid plans increase limits  

- Rate limits (typical): 1 RPS, daily cap  

- Requirements: Email to obtain API key  

- Pros: Simple, no credit card  

- Cons: Basic OCR only  

- Endpoint:

```
POST https://api.ocr.space/parse/image

```

## Nanonets OCR API

- Type: OCR with structured document models  

- Free tier (realistic): 100 pages/month  

- Pricing (approx): Scales by pages/month  

- Rate limits (typical): Moderate throttling  

- Requirements: Account + API key  

- Pros: Good for invoices, receipts, structured extraction  

- Cons: Very small free tier  

- Endpoint:

```
POST https://app.nanonets.com/api/v2/OCR/Model/<model_id>/LabelFile/
```

## Hugging Face Inference API

- Type: Hosted open‑source models  

- Free tier (realistic): Permanent free tier with rate limits  

- Pricing (approx): Paid tiers for dedicated hardware  

- Rate limits (typical): Shared infrastructure, slower at peak  

- Requirements: Hugging Face account  

- Pros: Large variety of OCR models  

- Cons: Performance varies by model and load

## Cloudflare Workers AI

- Type: Serverless AI runtime  

- Free tier (realistic): Around 10,000 compute units/day  

- Pricing (approx): Usage‑based after free tier  

- Rate limits (typical): Daily quota  

- Requirements: Cloudflare account  

- Pros: Good daily allowance  

- Cons: Daily reset; requires Workers setup

## NVIDIA NIM

- Type: Hosted inference microservices  

- Free tier (realistic): Around 40 requests/min for some models  

- Pricing (approx): Usage‑based  

- Rate limits (typical): Request‑based  

- Requirements: NVIDIA account  

- Pros: High throughput  

- Cons: Request‑based limits can be restrictive for large images

## OpenRouter

- Type: Multi‑model routing API  

- Free tier (realistic): About 50 requests/day  

- Pricing (approx): Pay‑as‑you‑go for higher tiers  

- Rate limits (typical): Daily caps  

- Requirements: Account  

- Pros: Many models behind one API  

- Cons: Small free tier

## GitHub Models

- Type: Hosted models for developers  

- Free tier (realistic): Free usage with internal caps  

- Pricing (approx): Paid tiers for higher usage  

- Rate limits (typical): Request caps  

- Requirements: GitHub account  

- Pros: Easy access to many models  

- Cons: Not suitable for heavy production

## Vercel AI Gateway

- Type: API gateway for AI models  

- Free tier (realistic): Free prototyping tier  

- Pricing (approx): Usage‑based  

- Rate limits (typical): Prototyping limits  

- Requirements: Vercel account  

- Pros: Good for app developers  

- Cons: Limited to Vercel ecosystem

----

----





