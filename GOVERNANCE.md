# Organization Governance Framework

## Layered Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  ops-observability    Observability & Monitoring             │
├─────────────────────────────────────────────────────────────┤
│  mod-platform         Quantum / Cognitive / Multimodal      │
├─────────────────────────────────────────────────────────────┤
│  app-vercel           Web Portal (Vercel)                   │
├─────────────────────────────────────────────────────────────┤
│  core-main            Platform Core + Control Plane         │
│  core-kernel          CI/CD Workflows Engine                │
├─────────────────────────────────────────────────────────────┤
│  infra-base           Infrastructure Foundation             │
├─────────────────────────────────────────────────────────────┤
│  .github              Shared Workflows & Governance         │
└─────────────────────────────────────────────────────────────┘
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

Shared workflows in `.github/workflows/` — **always pin to `@v1`**:

| Workflow | Purpose | Trigger |
|---|---|---|
| `reusable-ci.yml` | Governance validation, lint, test | `workflow_call` |
| `reusable-security-scan.yml` | Trivy + CodeQL scanning | `workflow_call` |
| `reusable-supply-chain.yml` | SBOM, SLSA, VEX generation | `workflow_call` |
| `reusable-self-healing.yml` | Auto-remediation on vulnerability | `workflow_call` |
| `reusable-dependabot-rescuer.yml` | Dependabot PR dispatch | `workflow_call` |
| `reusable-governance-check.yml` | Governance contract validation | `workflow_call` |

### Usage Example

```yaml
jobs:
  ci:
    uses: codevantaos/.github/.github/workflows/reusable-ci.yml@v1
    with:
      run_lint: true
      run_test: true

  security:
    uses: codevantaos/.github/.github/workflows/reusable-security-scan.yml@v1
    with:
      severity: "CRITICAL,HIGH"

  governance:
    uses: codevantaos/.github/.github/workflows/reusable-governance-check.yml@v1
    with:
      strict: false
```

## Version Policy

- All shared workflows MUST be referenced with version tags (`@v1`)
- Breaking changes require a new major version (`@v2`)
- `@main` references are **prohibited** in production repos
- New versions are canary-tested on 1-2 repos before org-wide rollout

## Governance Events

1. **Policy Violations** → Issue created automatically
2. **Security Findings** → Self-healing triggered
3. **Compliance Drift** → Alert + remediation workflow
4. **URN Mismatch** → CI failure + notification
5. **Supply Chain Anomaly** → SBOM diff + VEX update
