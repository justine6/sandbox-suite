# Sandbox Suite Workspace 🚀
## Operational Status: Engineering Lab Active

This workspace is part of the **Justine Longla T-Lane LLC** ecosystem, governed by the Engineering Mesh Three-Plane Architecture.

### 📚 Knowledge Plane (Governance & Docs)
*Note: Access requires authorization via JTL-Lane LLC Microsoft 365.*
- [Founder Platform Handbook](https://onedrive.live.com/your-specific-link-to-handbook)
- [Sandbox Suite Docker Run-Book](https://onedrive.live.com/your-specific-link-to-runbook)

### 🏗️ Execution Plane (Infrastructure)
This lab uses a non-default port strategy to ensure 0% conflict with host services.
- **Postgres:** 55432
- **Redis:** 56379
- **API:** 3001

### ⚡ Quick Start (The Lock-In)
To initialize the environment and clear port conflicts:
1. Open PowerShell as Administrator.
2. Navigate to project root.
3. Run: `.\Scripts\Start-Sandbox.ps1`

### 🛠️ Troubleshooting (From Appendix)
- **Docker engine not found:** Start Docker Desktop.
- **Port Conflict:** Run the script above; it automatically kills processes on 55432 and 56379.
- **Wipe Data:** Run `docker compose down -v`.
