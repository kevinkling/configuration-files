# Script para restaurar archivos de configuración desde el repositorio a sus ubicaciones originales
# Uso: .\restore-configs.ps1
# ADVERTENCIA: Este script sobreescribirá los archivos existentes

$ErrorActionPreference = "Continue"
$RepoRoot = $PSScriptRoot

Write-Host "=== Restauración de archivos de configuración ===" -ForegroundColor Cyan
Write-Host "Repositorio: $RepoRoot`n" -ForegroundColor Gray

# Mapeo de archivos: Archivo en repo -> Destino original
$ConfigFiles = @{
    "windows\Microsoft.PowerShell_profile.ps1" = "$PROFILE"
    "windows\PowerShell\settings.json" = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}

$Restored = 0
$NotFound = 0

foreach ($Source in $ConfigFiles.Keys) {
    $SourcePath = Join-Path $RepoRoot $Source
    $Destination = $ConfigFiles[$Source]
    
    if (Test-Path $SourcePath) {
        # Crear directorio destino si no existe
        $DestDir = Split-Path $Destination -Parent
        if ($DestDir -and !(Test-Path $DestDir)) {
            New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
        }
        
        Copy-Item -Path $SourcePath -Destination $Destination -Force
        Write-Host "[✓] Restaurado: $Source" -ForegroundColor Green
        Write-Host "    -> $Destination" -ForegroundColor Gray
        $Restored++
    }
    else {
        Write-Host "[✗] No encontrado en repo: $Source" -ForegroundColor Yellow
        $NotFound++
    }
}

Write-Host "`n=== Resumen ===" -ForegroundColor Cyan
Write-Host "Archivos restaurados: $Restored" -ForegroundColor Green
Write-Host "Archivos no encontrados: $NotFound" -ForegroundColor Yellow
Write-Host "`nRestauración completada." -ForegroundColor Cyan
