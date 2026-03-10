# CodeVantaOS Governance Framework

## Layered Architecture

```
┌─────────────────────────────────────────────────────┐
│  ops-observability    Observability & Monitoring     │
├─────────────────────────────────────────────────────┤
│  mod-platform         Quantum / Cognitive / Multi    │
├─────────────────────────────────────────────────────┤
│  app-vercel           Web Portal (Vercel)            │
├─────────────────────────────────────────────────────┤
│  core-main            Platform Core + Control Plane  │
│  core-kernel          CI/CD Workflows Engine         │
├─────────────────────────────────────────────────────┤
│  infra-base           Infrastructure Foundation      │
├─────────────────────────────────────────────────────┤
│  .github              Shared Workflows & Governance  │
│  .github-private      Profile Statistics             │
└─────────────────────────────────────────────────────┘
```

## Repository Naming Convention

All repositories follow the `{layer}-{function}` pattern:

| Layer | Prefix | Purpose |
|---|---|---|
| Infrastructure | `infra-` | IaC, DevSecOps, cloud-native platform |
| Core | `core-` | Platform core, CI/CD, control plane |
| Application | `app-` | User-facing applications |
| Module | `mod-` | Domain-specific modules |
| Operations | `ops-` | Observability, monitoring |

## Directory Contracts

Every business repository MUST contain:

```
repo/
├── .governance/
│   ├── policy.yaml          # Repository-level policy
│   ├── ownership.yaml       # CODEOWNERS mapping
│   ├── compliance.yaml      # Compliance requirements
│   └── audit-log.yaml       # Governance event log
├── .agent_hooks/
│   ├── pre-commit.yaml      # Pre-commit automation
│   ├── post-deploy.yaml     # Post-deploy verification
│   └── on-alert.yaml        # Alert response automation
├── repo.automation.yaml     # Config-driven automation
├── METADATA.yaml            # Repository metadata
├── URN                      # Unique Resource Name
└── SECURITY.md              # Security policy
```

## Reusable Workflows

Shared workflows are defined in `.github/workflow-templates/`:

| Workflow | Purpose | Trigger |
|---|---|---|
| `reusable-ci.yml` | Governance validation, lint, test | `push`, `pull_request` |
| `reusable-security-scan.yml` | Trivy + CodeQL scanning | `push`, `pull_request` |
| `reusable-supply-chain.yml` | SBOM, SLSA, VEX generation | `push` |
| `reusable-self-healing.yml` | Auto-remediation on vulnerability | `push`, `schedule` |
| `reusable-dependabot-rescuer.yml` | Dependabot PR dispatch | `pull_request` |

### Usage Example

```yaml
# In any repo's .github/workflows/ci.yml
name: CI
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  ci:
    uses: codevantaos/.github/.github/workflows/reusable-ci.yml@main
    with:
      run_lint: true
      run_test: true

  security:
    uses: codevantaos/.github/.github/workflows/reusable-security-scan.yml@main
    with:
      severity: 'CRITICAL,HIGH'
      enable_codeql: true

  supply-chain:
    uses: codevantaos/.github/.github/workflows/reusable-supply-chain.yml@main
    with:
      commit_artifacts: false
```

## Governance Events

All governance-significant events are tracked:

1. **Policy Violations** → Issue created automatically
2. **Security Findings** → Self-healing triggered
3. **Compliance Drift** → Alert + remediation workflow
4. **URN Mismatch** → CI failure + notification
5. **Supply Chain Anomaly** → SBOM diff + VEX update