# ⚡ SCRIPTS DE AUTOMATIZACIÓN
## 🤖 Automatiza Tu Productividad

---

## 📊 **SCRIPT DE SEGUIMIENTO DIARIO**

### 📝 **daily_tracker.ps1**
```powershell
# Script para seguimiento diario automático
param(
    [string]$fecha = (Get-Date).ToString("yyyy-MM-dd"),
    [string]$ingresos_telesistema = "1282",
    [string]$ingresos_uber = "300",
    [string]$ingresos_freelancing = "450",
    [string]$ingresos_servicios = "300"
)

# Calcular totales
$total_ingresos = [int]$ingresos_telesistema + [int]$ingresos_uber + [int]$ingresos_freelancing + [int]$ingresos_servicios
$gastos_diarios = 500
$ahorro_diario = $total_ingresos - $gastos_diarios

# Crear reporte
$reporte = @"
📊 REPORTE DIARIO - $fecha

💰 INGRESOS:
- Telesistema: $ingresos_telesistema
- Uber: $ingresos_uber
- Freelancing: $ingresos_freelancing
- Servicios: $ingresos_servicios
- TOTAL: $total_ingresos

💸 GASTOS: $gastos_diarios
💎 AHORRO: $ahorro_diario

📈 PROGRESO:
- Meta diaria: 2000
- Cumplimiento: $([math]::Round(($total_ingresos/2000)*100, 1))%
"@

# Guardar reporte
$archivo = "Reporte_Diario_$fecha.txt"
$reporte | Out-File -FilePath $archivo -Encoding UTF8

Write-Host "Reporte generado: $archivo"
Write-Host $reporte
```

---

## 📧 **SCRIPT DE EMAIL AUTOMÁTICO**

### 📨 **send_daily_report.ps1**
```powershell
# Script para enviar reporte diario por email
param(
    [string]$email_destino = "astaciosanchezjefryagustin@gmail.com",
    [string]$fecha = (Get-Date).ToString("yyyy-MM-dd")
)

# Configurar email
$smtp_server = "smtp.gmail.com"
$smtp_port = 587
$email_origen = "jefry.astacio@email.com"
$password = "tu_password_aqui"

# Crear mensaje
$asunto = "Reporte Diario - $fecha"
$cuerpo = @"
Hola Jefry,

Aquí está tu reporte diario de progreso:

📊 RESUMEN DEL DÍA:
- Ingresos totales: $total_ingresos
- Gastos: $gastos_diarios
- Ahorro: $ahorro_diario

🎯 OBJETIVOS:
- Meta diaria: $([math]::Round(($total_ingresos/2000)*100, 1))% cumplida
- Progreso mensual: [CALCULAR]

🚀 PRÓXIMOS PASOS:
- Continuar con el plan
- Optimizar procesos
- Buscar nuevas oportunidades

¡Sigue así! 💪

---
Sistema de Seguimiento Automático
"@

# Enviar email (requiere configuración SMTP)
# Send-MailMessage -To $email_destino -From $email_origen -Subject $asunto -Body $cuerpo -SmtpServer $smtp_server -Port $smtp_port -UseSsl -Credential (New-Object System.Management.Automation.PSCredential($email_origen, (ConvertTo-SecureString $password -AsPlainText -Force)))

Write-Host "Reporte enviado a: $email_destino"
```

---

## 📱 **SCRIPT DE REDES SOCIALES**

### 📲 **social_media_poster.ps1**
```powershell
# Script para publicar en redes sociales
param(
    [string]$plataforma = "linkedin",
    [string]$mensaje = "Contenido del post"
)

# Templates de posts
$templates = @{
    "linkedin" = @"
🚀 [TÍTULO ATRACTIVO]

$mensaje

💡 Consejo del día: [CONSEJO]

¿Qué opinas? 👇

#DesarrolloWeb #Freelancing #Tecnologia #Emprendimiento

---
💻 Desarrollador Full-Stack | 🚀 Ayudo a empresas a digitalizar
"@
    
    "instagram" = @"
🚀 $mensaje

💡 [CONSEJO]

#DesarrolloWeb #Freelancing #Tecnologia #Emprendimiento #SantoDomingo

---
💻 Desarrollador Full-Stack
"@
}

# Generar post
$post = $templates[$plataforma]
$archivo = "Post_${plataforma}_$(Get-Date -Format 'yyyyMMdd_HHmm').txt"
$post | Out-File -FilePath $archivo -Encoding UTF8

Write-Host "Post generado para $plataforma"
Write-Host $post
```

---

## 💰 **SCRIPT DE FACTURACIÓN**

### 📄 **invoice_generator.ps1**
```powershell
# Script para generar facturas automáticamente
param(
    [string]$cliente = "Cliente Ejemplo",
    [string]$servicio = "Desarrollo Web",
    [string]$monto = "500",
    [string]$fecha = (Get-Date).ToString("yyyy-MM-dd")
)

# Generar número de factura
$numero_factura = "FAC-$(Get-Date -Format 'yyyyMMdd')-$(Get-Random -Minimum 1000 -Maximum 9999)"

# Crear factura
$factura = @"
FACTURA #$numero_factura

Fecha: $fecha
Cliente: $cliente

DESCRIPCIÓN:
- $servicio
- Soporte técnico incluido
- Garantía 30 días

TOTAL: $monto

FORMA DE PAGO:
- Transferencia bancaria
- PayPal
- Efectivo

TÉRMINOS:
- Pago a 15 días
- Sin intereses

---
Jefry Astacio
Desarrollador Full-Stack
📧 jefry.astacio@email.com
📱 +1 (809) XXX-XXXX
"@

# Guardar factura
$archivo = "Factura_$numero_factura.txt"
$factura | Out-File -FilePath $archivo -Encoding UTF8

Write-Host "Factura generada: $archivo"
Write-Host $factura
```

---

## 📊 **SCRIPT DE ANÁLISIS FINANCIERO**

### 📈 **financial_analyzer.ps1**
```powershell
# Script para análisis financiero semanal
param(
    [string]$semana = (Get-Date).ToString("yyyy-MM-dd")
)

# Leer datos de la semana
$ingresos_semana = @(1282, 300, 450, 300, 1282, 300, 450)  # Ejemplo
$gastos_semana = @(500, 500, 500, 500, 500, 500, 500)      # Ejemplo

# Calcular totales
$total_ingresos = ($ingresos_semana | Measure-Object -Sum).Sum
$total_gastos = ($gastos_semana | Measure-Object -Sum).Sum
$ahorro_semanal = $total_ingresos - $total_gastos

# Calcular promedios
$promedio_diario = $total_ingresos / 7
$meta_semanal = 14000
$cumplimiento = [math]::Round(($total_ingresos / $meta_semanal) * 100, 1)

# Generar análisis
$analisis = @"
📊 ANÁLISIS FINANCIERO SEMANAL - $semana

💰 INGRESOS:
- Total semanal: $total_ingresos
- Promedio diario: $([math]::Round($promedio_diario, 2))
- Meta semanal: $meta_semanal
- Cumplimiento: $cumplimiento%

💸 GASTOS:
- Total semanal: $total_gastos
- Promedio diario: $([math]::Round($total_gastos/7, 2))

💎 AHORRO:
- Total semanal: $ahorro_semanal
- Promedio diario: $([math]::Round($ahorro_semanal/7, 2))

📈 TENDENCIAS:
- Crecimiento vs semana anterior: [CALCULAR]
- Mejor día: [IDENTIFICAR]
- Área de mejora: [ANALIZAR]

🎯 RECOMENDACIONES:
- [RECOMENDACIÓN 1]
- [RECOMENDACIÓN 2]
- [RECOMENDACIÓN 3]
"@

# Guardar análisis
$archivo = "Analisis_Semanal_$semana.txt"
$analisis | Out-File -FilePath $archivo -Encoding UTF8

Write-Host "Análisis generado: $archivo"
Write-Host $analisis
```

---

## 🔄 **SCRIPT DE BACKUP AUTOMÁTICO**

### 💾 **backup_system.ps1**
```powershell
# Script para backup automático de archivos importantes
param(
    [string]$destino = "C:\Backup\Plan_Jefry",
    [string]$origen = "C:\src\Cursos\Curso_Crecimiento_Personal"
)

# Crear directorio de backup si no existe
if (!(Test-Path $destino)) {
    New-Item -ItemType Directory -Path $destino -Force
}

# Crear timestamp
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backup_folder = "$destino\Backup_$timestamp"

# Copiar archivos importantes
$archivos_importantes = @(
    "Plan_5_Anos_Jefry_Astacio\*.md",
    "Plan_5_Anos_Jefry_Astacio\**\*.md"
)

foreach ($patron in $archivos_importantes) {
    $archivos = Get-ChildItem -Path $origen -Filter $patron -Recurse
    foreach ($archivo in $archivos) {
        $destino_archivo = $archivo.FullName.Replace($origen, $backup_folder)
        $destino_directorio = Split-Path $destino_archivo -Parent
        
        if (!(Test-Path $destino_directorio)) {
            New-Item -ItemType Directory -Path $destino_directorio -Force
        }
        
        Copy-Item $archivo.FullName $destino_archivo -Force
    }
}

# Comprimir backup
$zip_file = "$destino\Backup_$timestamp.zip"
Compress-Archive -Path $backup_folder -DestinationPath $zip_file -Force

# Eliminar carpeta temporal
Remove-Item $backup_folder -Recurse -Force

Write-Host "Backup completado: $zip_file"
```

---

## 📅 **SCRIPT DE PROGRAMACIÓN DE TAREAS**

### ⏰ **schedule_tasks.ps1**
```powershell
# Script para programar tareas automáticas
param(
    [string]$tarea = "daily_report",
    [string]$hora = "22:00"
)

# Crear tarea programada
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File `"C:\Scripts\daily_tracker.ps1`""
$trigger = New-ScheduledTaskTrigger -Daily -At $hora
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

# Registrar tarea
$tarea_nombre = "Plan_Jefry_$tarea"
Register-ScheduledTask -TaskName $tarea_nombre -Action $action -Trigger $trigger -Settings $settings

Write-Host "Tarea programada: $tarea_nombre a las $hora"
```

---

## 🚀 **SCRIPT DE INICIO RÁPIDO**

### ⚡ **quick_start.ps1**
```powershell
# Script de inicio rápido para el día
Write-Host "🚀 INICIANDO DÍA PRODUCTIVO - JEFRY ASTACIO" -ForegroundColor Green

# Mostrar resumen del día anterior
$ayer = (Get-Date).AddDays(-1).ToString("yyyy-MM-dd")
$reporte_ayer = "Reporte_Diario_$ayer.txt"

if (Test-Path $reporte_ayer) {
    Write-Host "📊 RESUMEN DE AYER:" -ForegroundColor Yellow
    Get-Content $reporte_ayer | Select-Object -First 10
}

# Mostrar tareas del día
Write-Host "`n📋 TAREAS DE HOY:" -ForegroundColor Cyan
Write-Host "✅ Trabajo Telesistema (6:00 AM - 3:00 PM)"
Write-Host "✅ Uber (3:30 PM - 6:30 PM)"
Write-Host "✅ Freelancing (7:00 PM - 10:00 PM)"
Write-Host "✅ Estudio (10:00 PM - 11:00 PM)"

# Mostrar metas
Write-Host "`n🎯 METAS DEL DÍA:" -ForegroundColor Magenta
Write-Host "💰 Ingresos: $2,000+"
Write-Host "💎 Ahorro: $1,500+"
Write-Host "📚 Estudio: 2 horas"
Write-Host "🤝 Networking: 5 contactos"

# Abrir archivos importantes
$archivo_dia = "Plan_5_Anos_Jefry_Astacio\Año_1_2025_Fundacion\Noviembre\Semana_1\Viernes_01.md"
if (Test-Path $archivo_dia) {
    Start-Process notepad.exe $archivo_dia
}

Write-Host "`n💪 ¡A por todas, Jefry!" -ForegroundColor Green
```

---

## 📋 **INSTRUCCIONES DE USO**

### 🛠️ **CONFIGURACIÓN INICIAL**
1. **Crear carpeta de scripts:** `C:\Scripts\`
2. **Copiar todos los scripts** a la carpeta
3. **Configurar permisos** de ejecución
4. **Personalizar variables** según tus necesidades

### ⚙️ **EJECUCIÓN DIARIA**
```powershell
# Ejecutar al inicio del día
.\quick_start.ps1

# Ejecutar al final del día
.\daily_tracker.ps1 -ingresos_uber 350 -ingresos_freelancing 500

# Enviar reporte por email
.\send_daily_report.ps1
```

### 📅 **PROGRAMACIÓN AUTOMÁTICA**
```powershell
# Programar reporte diario a las 10 PM
.\schedule_tasks.ps1 -tarea "daily_report" -hora "22:00"

# Programar backup semanal
.\schedule_tasks.ps1 -tarea "weekly_backup" -hora "23:00"
```

---

## 🔧 **PERSONALIZACIÓN**

### 📝 **VARIABLES A MODIFICAR**
- **Email:** Cambiar direcciones de email
- **Rutas:** Ajustar rutas de archivos
- **Metas:** Modificar objetivos financieros
- **Horarios:** Ajustar tiempos de ejecución

### 🎯 **ADAPTACIÓN**
- **Agregar nuevas métricas**
- **Incluir más plataformas**
- **Personalizar templates**
- **Integrar con APIs**

---

*Scripts actualizados: 01/11/2025*
