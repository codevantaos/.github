# CodeVantaOS

**Unified AI-Native Platform — Infrastructure, Core, Modules, Observability**

---

## Architecture

| Layer | Repository | Description |
|---|---|---|
| 🏗️ **Infrastructure** | [`infra-base`](https://github.com/codevantaos/infra-base) | Unified platform infrastructure — IaC, DevSecOps, ecosystem integrations |
| ⚙️ **Core** | [`core-main`](https://github.com/codevantaos/core-main) | Core platform — frontend, control plane, enterprise services, system kernel |
| 🔧 **Core CI/CD** | [`core-kernel`](https://github.com/codevantaos/core-kernel) | CI/CD workflows core — runner management, smoke tests, reusable pipelines |
| 🌐 **Web Portal** | [`app-vercel`](https://github.com/codevantaos/app-vercel) | Web portal — Vercel-deployed frontend application |
| 🧩 **Modules** | [`mod-platform`](https://github.com/codevantaos/mod-platform) | Platform modules — quantum computing, cognitive engine, multimodal processing |
| 📊 **Observability** | [`ops-observability`](https://github.com/codevantaos/ops-observability) | Observability — metrics, alerting, logging, SLA/SLO tracking |

## Governance

All repositories follow the **CodeVantaOS Governance Framework**:

- **Layered Architecture**: `infra` → `core` → `app` → `mod` → `ops`
- **Reusable Workflows**: Shared CI/CD pipelines via `.github` organization repository
- **Supply Chain Security**: SBOM generation, SLSA L3+ provenance, VEX statements
- **Self-Healing**: Automated vulnerability detection and remediation
- **Directory Contracts**: `.governance/` for policy, `.agent_hooks/` for automation

## Quick Links

- 📋 [Governance Framework](https://github.com/codevantaos/.github/blob/main/GOVERNANCE.md)
- 🔄 [Reusable Workflows](https://github.com/codevantaos/.github/tree/main/workflow-templates)
- 🛡️ [Security Policy](https://github.com/codevantaos/.github/blob/main/SECURITY.md)