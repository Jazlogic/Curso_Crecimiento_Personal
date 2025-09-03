# Script para corregir horarios de despertar en todos los archivos
$files = Get-ChildItem -Path "Plan_5_Anos_Jefry_Astacio/Año_1_2025_Fundacion" -Recurse -Filter "*.md" | Where-Object { $_.Name -match "\.md$" }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Reemplazar horarios de despertar de 4:00 AM a 5:00 AM
    $content = $content -replace "### 🌅 MADRUGADA \(4:00 AM - 6:00 AM\)", "### 🌅 MADRUGADA (5:00 AM - 6:00 AM)"
    $content = $content -replace "\| 4:00 AM - 4:30 AM \| Despertar y preparar desayuno", "| 5:00 AM - 5:30 AM | Despertar y preparar desayuno"
    $content = $content -replace "\| 4:30 AM - 5:00 AM \| Desayuno familiar", "| 5:30 AM - 6:00 AM | Desayuno familiar y preparación"
    $content = $content -replace "\| 5:00 AM - 5:30 AM \| Preparación personal", ""
    $content = $content -replace "\| 5:30 AM - 6:00 AM \| Transporte al trabajo", ""
    
    # Reemplazar horarios de sueño
    $content = $content -replace "\| 11:00 PM - 4:00 AM \| Descanso/Sueño \| 5 horas", "| 11:00 PM - 5:00 AM | Descanso/Sueño | 6 horas"
    
    # Limpiar líneas vacías extra
    $content = $content -replace "\|\s*\|\s*\|\s*\|\s*\|\s*\|", ""
    
    Set-Content $file.FullName -Value $content -Encoding UTF8
    Write-Host "Corregido: $($file.FullName)"
}

Write-Host "Corrección completada en todos los archivos."
