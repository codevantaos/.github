# CodeVantaOS

Unified AI-Native Platform for infrastructure, core services, applications, modules, observability, and cross-repository operations.

## Repository Landscape

| Layer | Repository | Responsibility |
|---|---|---|
| Governance | `.github` | Organization-wide shared workflows, templates, profile, and governance entrypoint |
| Infrastructure | `infra-base` | Foundational infrastructure, IaC, DevSecOps, and external platform integrations |
| Infrastructure | `infra-gitops-agent` | GitOps automation agent for deployment reconciliation, credential flow, and environment convergence |
| Core | `core-main` | Core platform services, control-plane capabilities, and primary system logic |
| Core | `core-kernel` | CI/CD kernel, runner management, smoke tests, and reusable pipeline capabilities |
| Application | `app-portal` | User-facing portal application, routes, product workflows, and service integration |
| Application | `app-ui` | Shared UI system, design tokens, themes, components, icons, and interaction patterns |
| Modules | `mod-suite` | Expandable platform module suite, including quantum, cognitive, and multimodal capabilities |
| Operations | `ops-observability` | Metrics, logging, alerting, tracing, and SLA/SLO observability |
| Operations | `ops-center` | Cross-repository control plane for orchestration, scheduling, governance, health checks, and release coordination |

## Architecture Principles

- Repository names describe **domain responsibility**, not vendor or hosting platform.
- Naming follows a **layer-function** pattern for consistency and long-term maintainability.
- Shared organizational standards live in `.github`.
- Cross-repository orchestration and operational control live in `ops-center`.
- User-facing application logic lives in `app-portal`.
- Shared presentation and design-system assets live in `app-ui`.
- Platform-specific capabilities are grouped in `mod-suite`.
- Runtime visibility and operational telemetry live in `ops-observability`.

## Boundary Rules

### `.github`
Owns:
- Organization profile
- Shared workflow templates
- Reusable GitHub workflows
- Issue templates
- Pull request templates
- Security and contribution policy entrypoints

Does not own:
- Fleet registry
- Operational dashboards
- Cross-repo runtime state
- Release coordination metadata

### `ops-center`
Owns:
- Cross-repository orchestration
- Repository registry and dependency metadata
- Scheduled operational automation
- Health-check aggregation
- Incident routing
- Release-train coordination
- Operational dashboards and status views

Does not own:
- Organization community profile
- Generic issue / PR templates
- General-purpose shared template catalog
- Core product implementation

## Application Split

### `app-portal`
Owns:
- User journeys
- Routing and page composition
- Product features
- API integration
- Session and state flow
- Portal experience

### `app-ui`
Owns:
- Design tokens
- Themes
- Shared components
- Icons
- Storybook
- Interaction standards
- Presentation primitives

Rule:

```text
app-portal may depend on app-ui
app-ui must not depend on app-portal
```

## Suggested Rollout Order

1. Rename repositories to the finalized naming set
2. Create `app-ui`
3. Create `ops-center`
4. Move organization-level templates and shared workflows into `.github`
5. Move orchestration-specific assets into `ops-center`
6. Update internal documentation and references to the new names

## Final Repository Set

```text
.github
infra-base
infra-gitops-agent
core-main
core-kernel
app-portal
app-ui
mod-suite
ops-observability
ops-center
```

## Governance Direction

CodeVantaOS follows a layered governance model:

```text
governance -> infrastructure -> core -> application -> modules -> operations
```

Supporting practices:
- reusable workflows
- supply-chain verification
- policy-driven automation
- observability-first operations
- controlled release coordination
- explicit repository boundaries

## Quick Links

- Governance and templates: `.github`
- UI system: `app-ui`
- User-facing application: `app-portal`
- Control plane: `ops-center`
- Observability stack: `ops-observability`
