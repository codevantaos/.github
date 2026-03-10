# .github

> CodeVantaOS 組織層級共享設定、workflows、templates 與治理入口

## Structure

```
.github/
├── .github/
│   └── workflows/
│       ├── reusable-ci.yml
│       ├── reusable-security-scan.yml
│       ├── reusable-supply-chain.yml
│       ├── reusable-self-healing.yml
│       ├── reusable-dependabot-rescuer.yml
│       └── reusable-governance-check.yml
├── workflow-templates/
├── .governance/
│   ├── schemas/
│   └── contracts/
├── scripts/
├── profile/
│   └── README.md
├── GOVERNANCE.md
├── SECURITY.md
└── README.md
```

## Reusable Workflows (v1)

| Workflow | Purpose | Mode |
|---|---|---|
| `reusable-ci.yml` | CI pipeline with preflight detection | Graceful (skip when no config) |
| `reusable-security-scan.yml` | Trivy + secret scanning | Advisory (exit-code 0) |
| `reusable-supply-chain.yml` | SBOM + dependency detection | Graceful (detect before generate) |
| `reusable-self-healing.yml` | Auto vulnerability remediation | Advisory only |
| `reusable-dependabot-rescuer.yml` | Dependabot PR auto-merge | Actor-gated |
| `reusable-governance-check.yml` | Governance compliance | Non-strict warnings |

## Consumer Repositories (10)

| Repository | Layer | Wrapper Type |
|---|---|---|
| `infra-base` | infra | governance-check only |
| `infra-gitops-agent` | infra | governance-check only |
| `core-main` | core | 5 wrappers + 7 legacy |
| `core-kernel` | core | governance-check only |
| `app-portal` | app | 5 full wrappers |
| `app-ui` | app | governance-check |
| `mod-suite` | mod | 5 full wrappers |
| `ops-observability` | ops | 5 full wrappers |
| `ops-center` | ops | governance-check |

## Version Pinning

All consumer repos reference shared workflows via `@v1` tag.
Current v1 tag SHA: `ceeca358efed`
