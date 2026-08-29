# LLM Jina.ai Workflow

`https://r.jina.ai`

## ChatGPT

- Accepts long Markdown directly and preserves headings, lists, and code blocks for accurate reasoning over Jina.ai output.

- Supports workflows where you paste Markdown and issue directives such as "summarize", "extract", or "rewrite".

- Handles multi-section documents without flattening structure, making it suitable for technical or narrative Markdown.

## Claude

- Interprets Markdown with high fidelity and maintains structure even for very long Jina.ai responses.

- Supports extremely large inputs, allowing multi-document or multi-section analysis in a single prompt.

- Performs well on tasks requiring structural awareness such as outline extraction, section rewriting, or hierarchical summarization.

## Gemini

- Accepts Markdown as-is and processes structured text reliably, including headings, lists, and fenced code blocks.

- Works well for transformation workflows such as converting Markdown to other formats or reorganizing content.

- Handles Jina.ai responses without stripping formatting, preserving context for downstream tasks.

## Perplexity

- Allows direct pasting of Markdown and responds accurately to structural cues in the text.

- Suitable for question answering, extraction, and summarization workflows based on Jina.ai content.

- Lightweight interface makes it efficient for iterative Markdown-based tasks.

## Mistral Chat

- Handles Markdown input consistently and is effective for technical or structured transformations.

- Good for workflows involving code blocks, configuration text, or multi-level lists.

- Fast response times make it suitable for repeated Markdown analysis.

## Groq Chat

- Extremely fast inference while preserving Markdown structure in the input.

- Works well for iterative workflows where you repeatedly paste Jina.ai Markdown and request transformations.

- Suitable for long-form reasoning tasks that depend on Markdown hierarchy.

## ChatGPT File Upload

- Accepts .md files directly, enabling workflows where Jina.ai output is saved and uploaded instead of pasted.

- Preserves structure during analysis and supports multi-file reasoning.

- Useful when dealing with very long Markdown documents.

## Claude File Upload

- Handles large Markdown files and maintains structural fidelity during processing.

- Supports workflows involving multi-document ingestion or cross-document reasoning.

- Effective for tasks requiring detailed structural analysis of Markdown.

## Gemini File Upload

- Accepts Markdown files and processes them with consistent formatting.

- Suitable for workflows where Jina.ai output is saved locally before being analyzed.

- Maintains headings, lists, and code blocks during ingestion.

## NotebookLM

- Designed for document ingestion and handles Markdown as a first-class input format.

- Supports multi-document workflows and cross-referencing between Markdown files.

- Useful for long-term projects involving repeated analysis of Jina.ai-generated Markdown.

## DeepSeek

- Understands Markdown but may flatten some formatting while still preserving logical structure.

- Suitable for reasoning tasks where exact formatting is less critical.

- Works for extraction and summarization but may not preserve all visual hierarchy.

## Cohere Command Models

- Accept Markdown input and reason over it effectively.

- Rendering fidelity varies, but structural cues are generally preserved.

- Suitable for workflows involving semantic extraction or rewriting of Markdown.

-----

# Summary

Below is a clean, direct list of LLM services, each with **one** recommended directive written in the pattern you requested:

**"Given the Jina.ai/http... URL get request response, list all of the (a kind of content) ..."**

Each directive is tuned to the strengths of that specific service.

## ChatGPT

Given the Jina.ai/http... URL get request response, list all of the major sections and provide a concise description of each.

## Claude

Given the Jina.ai/http... URL get request response, list all of the headings and subheadings in hierarchical order.

## Gemini

Given the Jina.ai/http... URL get request response, list all of the main ideas expressed in the document.

## Perplexity

Given the Jina.ai/http... URL get request response, list all of the factual claims made in the text.

## Mistral Chat

Given the Jina.ai/http... URL get request response, list all of the code blocks and explain the purpose of each.

## Groq Chat

Given the Jina.ai/http... URL get request response, list all of the key points in the order they appear.

## ChatGPT File Upload

Given the Jina.ai/http... URL get request response contained in this Markdown file, list all of the sections and summarize each one.

## Claude File Upload

Given the Jina.ai/http... URL get request response contained in this Markdown file, list all of the themes discussed in the document.

## Gemini File Upload

Given the Jina.ai/http... URL get request response contained in this Markdown file, list all of the important concepts and explain their relationships.

## NotebookLM

Given the Jina.ai/http... URL get request response contained in this Markdown file, list all of the insights and show how they connect across the document.

## DeepSeek

Given the Jina.ai/http... URL get request response, list all of the claims made and identify the supporting statements.

## Cohere Command Models

Given the Jina.ai/http... URL get request response, list all of the entities mentioned and describe their roles in the text.

-----

-----
