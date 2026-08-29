# LLM

## Locally Operated Open-weight Model

### What You Are Actually Getting

Pre-trained Weights

- The model already contains all the complex mathematical parameters learned during its massive training phase.

Immediate Utility

- It is fully capable of answering questions, writing code, and summarizing text right out of the box.

Static Snapshot

- It represents a frozen snapshot of knowledge up to its specific cutoff date.

### How It Interacts With Local Operations

Zero Local Data Access

- It knows general human knowledge but has zero knowledge of your specific private files or company data.

No Automatic Learning

- The model does not natively learn or update its core weights from the prompts you type into it locally.

Customization Ready

- It acts as a highly advanced foundation that you can immediately customize using your own data.

### Two Ways to Give It Your Local Knowledge

Retrieval-Augmented Generation (RAG)

- You feed local documents into the prompt window as context so the model can read and answer questions about them.

Fine-Tuning

- You run a secondary, smaller training process on your hardware to permanently bake your specific industry terminology into the model weights.

# "Poisoned" Open Model

A poisoned model is a pre-trained model intentionally modified by a malicious actor before you download it. The overall risk is moderate to high depending on your source, as weights are executable structures.

### Exploit Vectors

Malicious File Serialization

- Poisoned models stored in older formats (like .bin or pickle files) can execute arbitrary code on your host machine during the loading phase.

Targeted Trojan Backdoors

- Attackers can trigger hidden malicious behavior or data exfiltration only when specific, rare trigger phrases are entered into the prompt.

Sleeper Agent Behavior

- The model can be subtly altered to provide flawed code, incorrect formulas, or biased analysis that bypasses standard benchmarking tests.

### Mitigation Steps

Enforce Safe File Formats

- Only download models packaged in modern, secure formats like Safetensors or GGUF that block code execution during loading.

Audit Source Provenance

- Exclusively pull weights from verified organizations on trusted registries like Hugging Face, avoiding unverified third-party repositories.

Implement Output Filtering

- Run automated security sweeps on model-generated source code before allowing it to enter production environments.

### Steps Required for "Breakout" Prevention

A breakout occurs when a model exploits vulnerabilities in its execution environment to escape constraints, access the host file system, or execute unauthorized system commands. The risk is low for the weights themselves, but high for the runtime applications hosting them.

### 1. Isolate the Runtime Environment

- Use Docker containers or lightweight virtual machines to run the model inference engine completely isolated from the host operating system.

- Enforce strict least-privilege user accounts within the container environment so the process lacks root administrative permissions.

- Mount the host file system as read-only to ensure the model runtime cannot alter or delete critical system configuration files.

### 2. Restrict Network Capabilities

- Disable all inbound and outbound internet access for the model container unless a strict, firewall-monitored connection to a secure database is required.

- Block the model engine from scanning or communicating with other sensitive machines residing on your internal local area network (LAN).

### 3. Constrain Compute Resources

- Implement strict CPU, GPU, and RAM limits via container configurations to prevent a malfunctioning or exploited model from freezing the host system.

- Set aggressive timeout thresholds for inference requests to automatically kill rogue, infinite-loop processes.

### 4. Secure the API and Tool Ecosystem

- Disable arbitrary code execution tools (like local Python interpreters) unless they are entirely sandboxed in their own distinct, disposable environments.

- Sanitize all system-level inputs and configurations passing into the inference framework to prevent prompt-injection attacks from hijacking server commands.

### Sources

- https://huggingface.co/blog/safetensors-security-audit

- https://arxiv.org/html/2603.02277v2

- https://edera.dev/stories/the-price-of-a-zero-day-vulnerability-is-an-api-call

- https://www.wired.com/story/openai-models-escaped-containment-and-hacked-huggingface/

- https://www.purpleshieldsecurity.com/post/ai-agents-container-breakout-risks

# Questions

What specific architectural differences make modern model storage formats immune to the arbitrary code execution risks found in legacy formats?

How can enterprise data engineering teams implement automated verification pipelines to detect hidden trojans or data poisoning in open-weight models before they enter internal systems?

What are the precise kernel boundaries and performance trade-offs associated with deploying local inference engines inside MicroVMs compared to standard container platforms?

How do indirect prompt injection vulnerabilities allow unvetted external documents to hijack an internally hosted model and trigger a sandbox escape sequence?

What monitoring tools and logging strategies should a security operations center implement to detect an open model attempting unauthorized lateral movement within a local network?

# Local Storage Mechanisms

## Added Training

When you train a locally deployed open-weight model after installation, you do not alter the massive original file. Instead, the system isolates new knowledge using specific, modular storage layers on your hardware.

### 1. Low-Rank Adaptation (LoRA) Weight Adapters

Delta Matrices

- The system freezes the original multi-gigabyte base model file and creates tiny, separate adapter files.

Storage Footprint

- These adapter files are incredibly small, typically ranging from a few megabytes to a couple of gigabytes.

Dynamic Loading

- The inference engine loads the frozen base model into GPU memory and injects these small adapter layers on top at runtime.

### 2. Vector Database Context Repositories

Semantic Embeddings

- If adding training data via Retrieval-Augmented Generation (RAG), text is converted into mathematical vectors using an embedding model.

External Storage

- These vectors are stored entirely outside the AI model in dedicated databases like Chroma, Pinecone, or Milvus.

On-the-Fly Queries

- The database retrieves relevant document snippets matching your prompt and pipes them into the model's short-term context window.

## Original vs. Enhanced

### 1. Original Base Model

Immutable Core

- The foundational model serves as a read-only mathematical anchor that never updates or changes on your disk.

Broad Capability

- It retains general human logic, linguistic structures, and broad public domain facts established by the creator.

Zero Overhead

- It requires significant VRAM to load but zero extra computing cycles for maintenance since it remains static.

### 2. Training-Enhanced Layer

Hyper-Specialized Focus

- The new layer contains only your proprietary data, internal company jargon, or specific task instructions.

High Volatility

- You can easily delete, rewrite, or swap these layers out without affecting the underlying model's stability.

Execution Overhead

- It introduces minimal computing overhead, slightly increasing VRAM consumption depending on the adapter rank (r) and target modules.

## Sources

- https://huggingface.co

- https://arxiv.org/abs/2106.09685

- https://www.geeksforgeeks.org/artificial-intelligence/vector-stores-in-langchain/

# Questions 

How do the training mathematical operations of LoRA minimize VRAM consumption compared to full parameter fine-tuning?

What deployment steps are required to dynamically merge multiple specialized LoRA adapters into a single base model at runtime?

How does the retrieval latency of a local vector database compare to the processing latency of an expanded token context window?

What specific degradation or "catastrophic forgetting" risks occur if an adapter layer is trained too aggressively on specialized data?

How do you secure the access controls of an external vector database to prevent unauthorized local users from querying restricted training data?

----

----
