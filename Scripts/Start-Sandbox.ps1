# Start-Sandbox.ps1 - Automated Execution Plane Setup
# Strategy: Governance-aligned environment initialization

Write-Host "--- JTL Engineering: Sandbox Suite Lock-In ---" -ForegroundColor Cyan

# 1. Check if Docker Desktop is running
if (!(Get-Process "Docker Desktop" -ErrorAction SilentlyContinue)) {
    Write-Host "[!] Docker Desktop is not running. Launching..." -ForegroundColor Yellow
    Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    Write-Host "Waiting for Docker engine to stabilize..."
    Start-Sleep -Seconds 15
}

# 2. Port Conflict Rescue (from Runbook Appendix)
$ports = @(55432, 56379, 3001)
foreach ($port in $ports) {
    $proc = Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue
    if ($proc) {
        Write-Host "[!] Conflict found on port $port. Clearing process ID: $($proc.OwningProcess)" -ForegroundColor Red
        Stop-Process -Id $proc.OwningProcess -Force
    }
}

# 3. Spin up Infrastructure
Write-Host "[+] Launching Docker Infrastructure..." -ForegroundColor Green
docker-compose up -d

# 4. Final Status
docker compose ps
Write-Host "--- Environment Stable. Ready for Engineering. ---" -ForegroundColor Cyan
