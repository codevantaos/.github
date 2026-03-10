# Security Policy — CodeVantaOS

## Supported Versions

| Repository | Version | Supported |
|---|---|---|
| infra-base | main | ✅ |
| core-main | main | ✅ |
| core-kernel | main | ✅ |
| app-vercel | main | ✅ |
| mod-platform | main | ✅ |
| ops-observability | main | ✅ |

## Reporting a Vulnerability

1. **DO NOT** open a public issue for security vulnerabilities
2. Email: security@codevantaos.com
3. Include: repository name, description, reproduction steps, impact assessment
4. Expected response time: 48 hours

## Security Measures

### Automated Scanning
- **Trivy**: Filesystem vulnerability scanning on every push/PR
- **CodeQL**: Static analysis for code quality and security
- **Grype**: Container image scanning
- **SBOM**: Software Bill of Materials generated per release

### Supply Chain Security
- **SLSA L3+**: Provenance verification for all builds
- **VEX**: Vulnerability Exploitability eXchange statements
- **Sigstore**: Artifact signing and verification
- **Dependabot**: Automated dependency updates with rescue workflow

### Branch Protection
- Required status checks (CodeQL, Trivy, Grype, Code Quality Gate)
- Required pull request reviews
- No direct pushes to `main`

### Secret Management
- Organization-level secrets via GitHub Secrets
- PAT expiry monitoring (`pat-expiry-check.yml`)
- Secret rotation automation (`secret-rotation-service`)