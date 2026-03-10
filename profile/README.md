# CodeVantaOS

**Unified AI-Native Platform** — Infrastructure, Core, Applications, Modules, and Observability.

## Architecture

| Layer | Repository | Description |
|---|---|---|
| 🏛️ Governance | [`.github`](https://github.com/codevantaos/.github) | Organization-level shared workflows, templates, profile, and governance entry point |
| 🏗️ Infrastructure | [`infra-base`](https://github.com/codevantaos/infra-base) | Unified platform infrastructure — IaC, DevSecOps, and ecosystem integrations |
| 🔁 GitOps | [`infra-gitops-agent`](https://github.com/codevantaos/infra-gitops-agent) | GitOps automation agent — deployment orchestration, credential flow, and reconciliation |
| ⚙️ Core | [`core-main`](https://github.com/codevantaos/core-main) | Core platform — control plane, enterprise services, and system capabilities |
| 🧪 Core CI/CD | [`core-kernel`](https://github.com/codevantaos/core-kernel) | CI/CD workflows core — runner management, smoke tests, and reusable pipelines |
| 🌐 Application | [`app-portal`](https://github.com/codevantaos/app-portal) | User-facing portal and frontend application |
| 🎨 UI System | [`app-ui`](https://github.com/codevantaos/app-ui) | Shared UI components, design tokens, themes, and interaction patterns |
| 🧩 Modules | [`mod-suite`](https://github.com/codevantaos/mod-suite) | Platform module suite — quantum, cognitive, and multimodal capabilities |
| 📊 Observability | [`ops-observability`](https://github.com/codevantaos/ops-observability) | Metrics, logging, alerting, tracing, and SLA/SLO tracking |
| 🏯 Control Plane | [`ops-center`](https://github.com/codevantaos/ops-center) | Cross-repository orchestration, scheduling, governance, and release coordination |

## Governance

All repositories follow the **CodeVantaOS Governance Framework**:

- **Layered Architecture**: `governance → infra → core → app → mod → ops`
- **Reusable Workflows**: Shared CI/CD pipelines via `.github` with version pinning (`@v1`)
- **Supply Chain Security**: SBOM generation, provenance, and verification
- **Self-Healing**: Automated vulnerability detection and remediation
- **Directory Contracts**: `.governance/` for policy and ownership enforcement
- **Control Plane**: Centralized orchestration via `ops-center`

## Repository Naming Principles

- Repository names describe **domain responsibility**, not deployment target or vendor
- Naming follows the `layer-function` pattern for consistency
- Stable product/domain terminology is preferred over temporary implementation details
- Organization-wide shared workflows and templates live in `.github`

## Quick Links

- [📋 Governance Framework](https://github.com/codevantaos/.github)
- [🔄 Reusable Workflows](https://github.com/codevantaos/.github/tree/main/.github/workflows)
- [🛡️ Security Policy](https://github.com/codevantaos/.github/blob/main/SECURITY.md)
- [🏯 Control Plane](https://github.com/codevantaos/ops-center)
