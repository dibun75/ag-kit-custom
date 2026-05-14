# AG-Kit Custom Documentation

Welcome to the `ag-kit-custom` master repository. This repository acts as the central "Brain" for all your AI agents, containing the latest upstream updates from the core `ag-kit` along with our proprietary custom skills for mobile deployments.

## Setting Up a New Project

To inherit this exact AI skill set into a brand new project (without polluting your project's Git history), follow these steps:

1. **Ensure the Kit is cloned locally:**
   Make sure you have this repository cloned somewhere central on your computer (e.g., your home directory).
   ```bash
   git clone https://github.com/dibun75/ag-kit-custom.git ~/ag-kit-custom
   ```

2. **Create the Symlink in your new project:**
   Navigate to your new project's root folder and create a shortcut pointing to the kit:
   ```bash
   cd ~/your-new-project
   ln -s ~/ag-kit-custom/.agent .agent
   ```

3. **Ignore the link in Git:**
   Ensure your project ignores the symlink so you don't accidentally commit AI prompts into your codebase:
   ```bash
   echo ".agent" >> .gitignore
   ```

4. **Ready to Go:**
   Your AI assistant will now automatically read `.agent` and load all 47 skills!

---

## 🌟 Our Custom Skills & Workflows

These are our internally developed skills tailored for specific requirements:

* **`app-store-deployment`** (Skill): Manages `Info.plist`, `AndroidManifest`, versioning, and privacy requirements for App Store Connect & Google Play Console submissions.
* **`mobile-monetization`** (Skill): Manages strict RevenueCat configuration and AdMob platform locking (ensuring iOS/Android ad unit IDs are mapped dynamically).
* **`context-reset`** (Skill) & **`/reset`** (Workflow): Cleans up disk-hogging `.gemini` AI artifacts and resets the AI's internal context to the source code truth.
* **`/publish-mobile`** (Workflow): An interactive, step-by-step checklist workflow designed to guide you through the multi-day mobile deployment and review lifecycle.

---

## 📚 Complete Skill Reference

| Skill Name | Description | Custom |
|---|---|---|
| `api-patterns` | API design principles and decision-making. REST vs GraphQL vs tRPC selection, response formats, versioning, pagination. |  |
| `app-builder` | Main application building orchestrator. Creates full-stack applications from natural language requests. Determines project type, selects tech stack, coordinates agents. |  |
| `app-store-deployment` | Mobile App Store deployment rules and configuration standards for iOS (App Store Connect) and Android (Google Play Console). Covers Info.plist, AndroidManifest, versioning, and privacy requirements. | ✅ |
| `architecture` | Architectural decision-making framework. Requirements analysis, trade-off evaluation, ADR documentation. Use when making architecture decisions or analyzing system design. |  |
| `bash-linux` | Bash/Linux terminal patterns. Critical commands, piping, error handling, scripting. Use when working on macOS or Linux systems. |  |
| `batch-operations` | Apply operations across multiple files simultaneously. Pattern-based bulk modifications, search-and-replace across codebases, consistent changes to many files at once. |  |
| `behavioral-modes` | AI operational modes (brainstorm, implement, debug, review, teach, ship, orchestrate). Use to adapt behavior based on task type. |  |
| `brainstorming` | Socratic questioning protocol + user communication. MANDATORY for complex requests, new features, or unclear requirements. Includes progress reporting and error handling. |  |
| `clean-code` | Pragmatic coding standards - concise, direct, no over-engineering, no unnecessary comments |  |
| `code-review-checklist` | Code review guidelines covering code quality, security, and best practices. |  |
| `code-review-graph` | Token-efficient code review using Tree-sitter AST graphs and MCP. Reduces AI assistant token usage by 6.8–49x by computing blast radius of changes instead of reading entire codebases. Uses SQLite graph database for structural analysis. |  |
| `context-compression` | Manage and compress conversation context in long sessions. Detect when context is growing large, summarize completed work phases, archive old findings while preserving key decisions. Prevents context degradation. |  |
| `context-reset` | Hard reset for AI context and disk cleanup of heavy artifacts in .gemini directory. | ✅ |
| `coordinator-mode` | Advanced multi-agent orchestration with parallel workers, synthesis protocols, and coordinator lifecycle. Use when complex tasks require multiple agents working in parallel with intelligent result synthesis. |  |
| `database-design` | Database design principles and decision-making. Schema design, indexing strategy, ORM selection, serverless databases. |  |
| `deployment-procedures` | Production deployment principles and decision-making. Safe deployment workflows, rollback strategies, and verification. Teaches thinking, not scripts. |  |
| `documentation-templates` | Documentation templates and structure guidelines. README, API docs, code comments, and AI-friendly documentation. |  |
| `frontend-design` | Design thinking and decision-making for web UI. Use when designing components, layouts, color schemes, typography, or creating aesthetic interfaces. Teaches principles, not fixed values. |  |
| `game-development` | Game development orchestrator. Routes to platform-specific skills based on project needs. |  |
| `geo-fundamentals` | Generative Engine Optimization for AI search engines (ChatGPT, Claude, Perplexity). |  |
| `i18n-localization` | Internationalization and localization patterns. Detecting hardcoded strings, managing translations, locale files, RTL support. |  |
| `intelligent-routing` | Automatic agent selection and intelligent task routing. Analyzes user requests and automatically selects the best specialist agent(s) without requiring explicit user mentions. |  |
| `lint-and-validate` | Automatic quality control, linting, and static analysis procedures. Use after every code modification to ensure syntax correctness and project standards. Triggers onKeywords: lint, format, check, validate, types, static analysis. |  |
| `mcp-builder` | MCP (Model Context Protocol) server building principles. Tool design, resource patterns, best practices. |  |
| `memory-system` | Persistent cross-session memory management. Enables agents to remember user preferences, project conventions, and past decisions across different sessions using a structured MEMORY.md index and topic files. |  |
| `mobile-design` | Mobile-first design thinking and decision-making for iOS and Android apps. Touch interaction, performance patterns, platform conventions. Teaches principles, not fixed values. Use when building React Native, Flutter, or native mobile apps. |  |
| `mobile-monetization` | Monetization rules and App Store compliance standards for mobile applications. Covers AdMob platform locking, RevenueCat configuration, and Apple App Store Guideline 3.1.2(c) mandatory subscription disclosures. | ✅ |
| `nextjs-react-expert` | React and Next.js performance optimization from Vercel Engineering. Use when building React components, optimizing performance, eliminating waterfalls, reducing bundle size, reviewing code for performance issues, or implementing server/client-side optimizations. |  |
| `nodejs-best-practices` | Node.js development principles and decision-making. Framework selection, async patterns, security, and architecture. Teaches thinking, not copying. |  |
| `parallel-agents` | Multi-agent orchestration patterns. Use when multiple independent tasks can run with different domain expertise or when comprehensive analysis requires multiple perspectives. |  |
| `performance-profiling` | Performance profiling principles. Measurement, analysis, and optimization techniques. |  |
| `plan-writing` | Structured task planning with clear breakdowns, dependencies, and verification criteria. Use when implementing features, refactoring, or any multi-step work. |  |
| `powershell-windows` | PowerShell Windows patterns. Critical pitfalls, operator syntax, error handling. |  |
| `python-patterns` | Python development principles and decision-making. Framework selection, async patterns, type hints, project structure. Teaches thinking, not copying. |  |
| `red-team-tactics` | Red team tactics principles based on MITRE ATT&CK. Attack phases, detection evasion, reporting. |  |
| `rust-pro` | Master Rust 1.75+ with modern async patterns, advanced type system |  |
| `seo-fundamentals` | SEO fundamentals, E-E-A-T, Core Web Vitals, and Google algorithm principles. |  |
| `server-management` | Server management principles and decision-making. Process management, monitoring strategy, and scaling decisions. Teaches thinking, not commands. |  |
| `simplify-code` | Reduce complexity of over-engineered code. Identify unnecessary abstractions, remove dead code, flatten deep nesting, and simplify logic while preserving behavior. |  |
| `skillify` | Auto-create new skills from repetitive workflows. When you notice yourself doing the same multi-step process repeatedly, extract it into a reusable SKILL.md that any agent can use. |  |
| `systematic-debugging` | 4-phase systematic debugging methodology with root cause analysis and evidence-based verification. Use when debugging complex issues. |  |
| `tailwind-patterns` | Tailwind CSS v4 principles. CSS-first configuration, container queries, modern patterns, design token architecture. |  |
| `tdd-workflow` | Test-Driven Development workflow principles. RED-GREEN-REFACTOR cycle. |  |
| `testing-patterns` | Testing patterns and principles. Unit, integration, mocking strategies. |  |
| `verify-changes` | Prove code works by running it, not just checking it exists. Verification through execution rather than inspection. Use after writing or modifying code to ensure it actually functions correctly. |  |
| `vulnerability-scanner` | Advanced vulnerability analysis principles. OWASP 2025, Supply Chain Security, attack surface mapping, risk prioritization. |  |
| `web-design-guidelines` | Review UI code for Web Interface Guidelines compliance. Use when asked to "review my UI", "check accessibility", "audit design", "review UX", or "check my site against best practices". |  |
| `webapp-testing` | Web application testing principles. E2E, Playwright, deep audit strategies. |  |
