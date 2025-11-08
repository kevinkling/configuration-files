# Script para copiar archivos de configuración desde sus ubicaciones originales al repositorio
# Uso: .\backup-configs.ps1

$ErrorActionPreference = "Continue"
$RepoRoot = $PSScriptRoot

Write-Host "=== Backup de archivos de configuración ===" -ForegroundColor Cyan
Write-Host "Repositorio: $RepoRoot`n" -ForegroundColor Gray

# Mapeo de archivos: Origen -> Destino en el repo
$ConfigFiles = @{
    # PowerShell Profile
    "$PROFILE" = "windows\Microsoft.PowerShell_profile.ps1"
    
    # Windows Terminal
    "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" = "windows\PowerShell\settings.json"
}

$BackedUp = 0
$NotFound = 0

foreach ($Source in $ConfigFiles.Keys) {
    $Destination = Join-Path $RepoRoot $ConfigFiles[$Source]
    
    if (Test-Path $Source) {
        # Crear directorio destino si no existe
        $DestDir = Split-Path $Destination -Parent
        if ($DestDir -and !(Test-Path $DestDir)) {
            New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
        }
        
        Copy-Item -Path $Source -Destination $Destination -Force
        Write-Host "[✓] Copiado: $Source" -ForegroundColor Green
        Write-Host "    -> $Destination" -ForegroundColor Gray
        $BackedUp++
    }
    else {
        Write-Host "[✗] No encontrado: $Source" -ForegroundColor Yellow
        $NotFound++
    }
}

Write-Host "`n=== Resumen ===" -ForegroundColor Cyan
Write-Host "Archivos respaldados: $BackedUp" -ForegroundColor Green
Write-Host "Archivos no encontrados: $NotFound" -ForegroundColor Yellow
Write-Host "`nBackup completado." -ForegroundColor Cyan
