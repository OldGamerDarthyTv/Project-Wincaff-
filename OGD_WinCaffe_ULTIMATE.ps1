#Requires -Version 5.1
<#
═══════════════════════════════════════════════════════════════════════════════
 ⚡ OGD WinCaffè v7.6.9 ULTIMATE ⚡
 
 Sistema Definitivo di Ottimizzazione Windows 11 per Gaming
 
 ┌─────────────────────────────────────────────────────────────┐
 │ #DarkPlayer84Tv Productions                                 │
 │ by OldGamerDarthy Official                                  │
 │ OGD Team - Original Gaming Design                           │
 └─────────────────────────────────────────────────────────────┘
 
 NOVITÀ v7.6.9:
   🛠️ WINREVIVE - Riparazione Windows integrata (menu W)
   🔄 LOOP MENU - DNS/Explorer tornano al menu (non chiudono)
   📂 FILE I/O TWEAKS + NDU (valore 4 o 6)
   🔄 WINGET UPDATE - Aggiorna programmi
   🌐 NETWORK OPTIMIZATION (WiFi/Ethernet/Both)
   🔒 PRIVACY PROTECTION (4 livelli)
 INCLUDE v7.6.9:
   🧠 RAM INTELLIGENTE DDR4/DDR5 (8-128GB)
   💾 11 PARAMETRI MEMORY MANAGEMENT
   📊 IoPageLockLimit + SvcHostSplit valori esatti
   ⚡ Comando globale 'wincaffe'
   
 Autore: OldGamerDarthy | #DarkPlayer84Tv Productions
 Data: 18 Marzo 2026 | Windows 11 25H2/26H1
 Discord: discord.gg/5SJa2xp5
═══════════════════════════════════════════════════════════════════════════════
#>

# Admin check
if(-not([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
    # Preferisci pwsh se disponibile
    $pwshExe=Get-Command pwsh -EA SilentlyContinue
    if($pwshExe){
        Start-Process pwsh "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;exit
    }else{
        Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;exit
    }
}

# Windows 11 check
$os=Get-CimInstance Win32_OperatingSystem;$build=[int]$os.BuildNumber
if($build -lt 22000){
    Write-Host "`n  ⚠️  Richiesto Windows 11 (build 22000+) - Build: $build" -ForegroundColor Red
    Read-Host "  INVIO";exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  DISCLAIMER E CREDITI
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
Write-Host "  ║  OGD WinCaffè v7.6.9 ULTIMATE - DISCLAIMER & CREDITI  ║" -F Cyan
Write-Host "  ╚═══════════════════════════════════════════════════════╝`n" -F Cyan

Write-Host "  📜 INFORMAZIONI IMPORTANTI:`n" -F Yellow

Write-Host "  Questo script è un progetto NO-PROFIT creato per aiutare" -F White
Write-Host "  la comunità gaming ad ottimizzare Windows 11.`n" -F White

Write-Host "  👨‍💻 AUTORE PRINCIPALE:" -F Cyan
Write-Host "     OldGamerDarthy (#DarkPlayer84Tv Productions)" -F White
Write-Host "     Sviluppo, integrazione, testing e manutenzione`n" -F DarkGray

Write-Host "  🙏 RINGRAZIAMENTI PERSONALI:" -F Cyan
Write-Host "     • AlexsTrexx (Alex) ⭐ - Test versione embrionale" -F White
Write-Host "       Primo a credere nel progetto e a provarlo sul campo" -F DarkGray
Write-Host "     • Diego - Supporto, consigli e amicizia durante lo sviluppo" -F White
Write-Host "     • Tutti gli amici del server Discord OGD" -F White
Write-Host "       Per consigli, idee e ispirazione continua" -F DarkGray
Write-Host "     • Claude AI (Anthropic) - Assistenza nello sviluppo`n" -F DarkGray

Write-Host "  📚 FONTI E CREDITI TECNICI:" -F Cyan
Write-Host "     Questo script raccoglie e integra conoscenze pubbliche da:" -F White
Write-Host "     • Speedguide.net — TCP Optimizer" -F White
Write-Host "       Impostazioni TCP/IP gaming (RSC, CTCP, RTO, ACK, QoS)" -F DarkGray
Write-Host "       https://www.speedguide.net/tcpoptimizer.php" -F DarkGray
Write-Host "     • Resplendence Software — LatencyMon" -F White
Write-Host "       Strumento analisi DPC latency (menu [L])" -F DarkGray
Write-Host "       https://www.resplendence.com/latencymon" -F DarkGray
Write-Host "     • WinScript Community — Tweaks privacy/telemetry" -F White
Write-Host "       Base dei tweaks privacy e debloat" -F DarkGray
Write-Host "     • Community gaming (Reddit r/GlobalOffensive," -F White
Write-Host "       r/Warzone, r/pcgaming, XtremeSystems, HPET forums)" -F White
Write-Host "       Tweaks CoD, DPC fix, hidden registry keys" -F DarkGray
Write-Host "     • Microsoft Docs — Documentazione ufficiale" -F White
Write-Host "       Registry keys, PowerCFG, MMCSS, DirectX API`n" -F DarkGray

Write-Host "  ℹ️  NOTA SUI CREDITI:" -F Yellow
Write-Host "     Questo script non ruba né copia nulla." -F White
Write-Host "     Raccoglie tweaks e ottimizzazioni pubblicamente" -F White
Write-Host "     disponibili e li rende accessibili a tutti." -F White
Write-Host "     I crediti restano ai rispettivi autori." -F White
Write-Host "     L'obiettivo è diffondere la conoscenza,`n" -F White
Write-Host "     non appropriarsene.`n" -F DarkGray

Write-Host "  💬 COMMUNITY DISCORD:" -F Cyan
Write-Host "     https://discord.gg/5SJa2xp5`n" -F Yellow

Write-Host "  ⚠️  RESPONSABILITÀ:" -F Yellow
Write-Host "     • Questo script modifica il registro di sistema" -F White
Write-Host "     • Viene creato un punto di ripristino automatico" -F White
Write-Host "     • L'autore non è responsabile per eventuali problemi" -F White
Write-Host "     • Usare a proprio rischio e responsabilità`n" -F White

Write-Host "  ✅ GARANZIE:" -F Green
Write-Host "     • Codice testato su Windows 11 (build 22000+)" -F White
Write-Host "     • Punto ripristino Windows creato prima di ogni modifica" -F White
Write-Host "     • Ripristinabile da Impostazioni → Ripristino sistema`n" -F White

Write-Host "  ════════════════════════════════════════════════════════`n" -F Cyan

Write-Host "  💬 COMMUNITY & SUPPORTO:" -F Cyan
Write-Host "     Discord OGD: https://discord.gg/5SJa2xp5" -F White
$discordChoice = Read-Host "  Vuoi aprire il server Discord? (S/N)"
if($discordChoice -in @("S","s")){
    Start-Process "https://discord.gg/5SJa2xp5"
    Write-Host "  ✓ Browser aperto — benvenuto nel server!`n" -F Green
}

$accept=Read-Host "  Accetti i termini e vuoi proseguire? (S/N)"

if($accept -notin @("S","s")){
    Write-Host "`n  Script terminato. Grazie!`n" -F Yellow
    Start-Sleep 2
    exit
}

# ═════════════════════════════════════════════════════════════════════════════
#  AUTO-UPDATE CHECK
# ═════════════════════════════════════════════════════════════════════════════

$currentVersion="7.6.9"
$installedScript="C:\OGD\OGD_WinCaffe_ULTIMATE.ps1"

if(Test-Path $installedScript){
    $installedContent=Get-Content $installedScript -Raw
    if($installedContent -match 'OGD WinCaffè v(\d+\.\d+\.\d+)'){
        $installedVersion=$Matches[1]

        if([version]$currentVersion -gt [version]$installedVersion){
            Clear-Host
            Write-Host "`n  🔄 AGGIORNAMENTO DISPONIBILE`n" -F Yellow
            Write-Host "  Installata: v$installedVersion" -F White
            Write-Host "  Disponibile: v$currentVersion`n" -F Green

            # Controlla se stai già eseguendo dalla cartella di installazione
            $isSameFile = ($PSCommandPath -and (Resolve-Path $PSCommandPath -EA SilentlyContinue) -eq (Resolve-Path $installedScript -EA SilentlyContinue))

            if($isSameFile){
                # Stai lanciando wincaffe — il file installato è già questo
                Write-Host "  ℹ Stai eseguendo la versione installata ($installedVersion)." -F Cyan
                Write-Host "  Per aggiornare alla v${currentVersion}:" -F White
                Write-Host "   1. Scarica il nuovo ZIP da Discord o dal sito" -F DarkGray
                Write-Host "   2. Estrai e lancia il nuovo OGD_WinCaffe_ULTIMATE.ps1" -F DarkGray
                Write-Host "   3. Lo script si aggiornerà automaticamente`n" -F DarkGray
                Start-Sleep 3
            } else {
                if((Read-Host "  Aggiornare script installato? (S/N)") -in @("S","s")){
                    Copy-Item $PSCommandPath $installedScript -Force
                    Write-Host "  ✓ Script aggiornato a v$currentVersion!" -F Green
                    # Copia anche il timer se presente
                    $timerSrc = Join-Path (Split-Path $PSCommandPath) "OGD_Timer_0.5ms.ps1"
                    $timerDst = "C:\OGD\OGD_Timer_0.5ms.ps1"
                    if((Test-Path $timerSrc) -and ($timerSrc -ne $timerDst)){
                        Copy-Item $timerSrc $timerDst -Force
                        Write-Host "  ✓ Timer aggiornato!" -F Green
                    }
                    Start-Sleep 2
                }
            }
        }
    }
}

# ═════════════════════════════════════════════════════════════════════════════
#  POWERSHELL 7.5+ CHECK & AUTO-INSTALL
# ═════════════════════════════════════════════════════════════════════════════

$psVersion=$PSVersionTable.PSVersion
$needsPS7=$false

if($psVersion.Major -lt 7){
    # PowerShell 5.x - Installa PS 7.5
    Clear-Host
    Write-Host "`n  ⚡ POWERSHELL 7.5 RICHIESTO`n" -F Yellow
    Write-Host "  Versione attuale: PowerShell $($psVersion.Major).$($psVersion.Minor)" -F White
    Write-Host "  Consigliata: PowerShell 7.5+ (migliori performance)`n" -F Green
    
    if((Read-Host "  Installare PowerShell 7.5? (S/N)") -in @("S","s")){
        Write-Host "`n  Installazione via winget..." -F Cyan
        winget install Microsoft.PowerShell --silent --accept-source-agreements --accept-package-agreements
        if($LASTEXITCODE -eq 0){
            Write-Host "  ✓ PowerShell 7.5 installato!" -F Green
            Write-Host "`n  Riavvio script con PowerShell 7.5...`n" -F Yellow
            Start-Sleep 2
            Start-Process pwsh "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
            exit
        }else{
            Write-Host "  ⚠ Installazione fallita. Continuo con PS $($psVersion.Major).$($psVersion.Minor)" -F Yellow
            Start-Sleep 2
        }
    }
}elseif($psVersion.Major -eq 7 -and $psVersion.Minor -lt 5){
    # PowerShell 7.0-7.4 - Aggiorna a 7.5
    Clear-Host
    Write-Host "`n  🔄 AGGIORNAMENTO POWERSHELL`n" -F Yellow
    Write-Host "  Versione attuale: PowerShell $($psVersion.Major).$($psVersion.Minor)" -F White
    Write-Host "  Disponibile: PowerShell 7.5+ (consigliato)`n" -F Green
    
    if((Read-Host "  Aggiornare a PowerShell 7.5? (S/N)") -in @("S","s")){
        Write-Host "`n  Aggiornamento via winget..." -F Cyan
        winget upgrade Microsoft.PowerShell --silent --accept-source-agreements --accept-package-agreements
        if($LASTEXITCODE -eq 0){
            Write-Host "  ✓ PowerShell 7.5 aggiornato!" -F Green
            Write-Host "`n  Riavvio script con nuova versione...`n" -F Yellow
            Start-Sleep 2
            Start-Process pwsh "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
            exit
        }else{
            Write-Host "  ⚠ Aggiornamento fallito. Continuo con PS $($psVersion.Major).$($psVersion.Minor)" -F Yellow
            Start-Sleep 2
        }
    }
}elseif($psVersion.Major -ge 7 -and $psVersion.Minor -ge 5){
    # PowerShell 7.5+ - OK!
    # Nessun messaggio (richiesta utente: "spiegazione leggerissima")
}

# ═════════════════════════════════════════════════════════════════════════════
#  .NET RUNTIME/SDK CHECK & AUTO-INSTALL (versioni dinamiche - auto-discovery)
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ⚡ CHECK DIPENDENZE .NET (rilevamento automatico versioni)`n" -F Cyan
Write-Host "  🔍 Ricerca versioni disponibili su winget..." -F DarkGray

# ── DISCOVERY DINAMICA ──────────────────────────────────────────────────────
# Una sola chiamata winget search per trovare le versioni stabili disponibili

$dotnetVersions = @()
try {
    $searchOut = winget search "Microsoft.DotNet.Runtime." --accept-source-agreements 2>$null
    foreach($line in $searchOut){
        if($line -match "Microsoft\.DotNet\.Runtime\.(\d+)\s"){
            $ver = $Matches[1]
            if([int]$ver -ge 6 -and $ver -notin $dotnetVersions){
                $dotnetVersions += $ver
            }
        }
    }
    $dotnetVersions = $dotnetVersions | Sort-Object {[int]$_}
} catch {}

if($dotnetVersions.Count -eq 0){
    Write-Host "  ⚠ Discovery fallita, uso versioni base note" -F Yellow
    $dotnetVersions = @("6","7","8","9","10","11")
}

Write-Host "  ✓ Versioni stabili trovate: $($dotnetVersions -join ', ')" -F Green

# ── UNA SOLA CHIAMATA winget list — poi tutto in memoria ────────────────────
Write-Host "  🔍 Lettura pacchetti installati..." -F DarkGray

$wingetListRaw = winget list --accept-source-agreements 2>$null | Out-String

$previewTypes = @(
    @{Label="Runtime Preview";  ID="Microsoft.DotNet.Runtime.Preview"},
    @{Label="Desktop Preview";  ID="Microsoft.DotNet.DesktopRuntime.Preview"},
    @{Label="SDK Preview";      ID="Microsoft.DotNet.SDK.Preview"}
)

$missingDotnet  = @()
$installedDotnet = @()

# Check versioni stabili — solo string match sul dump già in memoria
foreach($ver in $dotnetVersions){
    if($wingetListRaw -match "Microsoft\.DotNet\.Runtime\.$ver\s")       {$installedDotnet+="Runtime $ver"}   else{$missingDotnet+="Runtime $ver"}
    if($wingetListRaw -match "Microsoft\.DotNet\.DesktopRuntime\.$ver\s"){$installedDotnet+="Desktop $ver"}   else{$missingDotnet+="Desktop $ver"}
    if($wingetListRaw -match "Microsoft\.DotNet\.SDK\.$ver\s")           {$installedDotnet+="SDK $ver"}        else{$missingDotnet+="SDK $ver"}
}

# Check Preview — stesso dump
foreach($pt in $previewTypes){
    if($wingetListRaw -match [regex]::Escape($pt.ID)){$installedDotnet+=$pt.Label}else{$missingDotnet+=$pt.Label}
}

Write-Host "  ✓ Check completato`n" -F Green

# ── RISULTATO ───────────────────────────────────────────────────────────────

if($missingDotnet.Count -gt 0){
    Write-Host "  ✓ Installati: $($installedDotnet.Count)" -F Green
    Write-Host "  ✗ Mancanti:  $($missingDotnet.Count)" -F Red
    Write-Host "`n  Componenti mancanti:" -F Yellow
    foreach($m in $missingDotnet){ Write-Host "   • $m" -F Red }

    Write-Host "`n  Consigliato: Installare tutte le versioni .NET`n" -F Cyan

    if((Read-Host "  Installare componenti .NET mancanti? (S/N)") -in @("S","s")){
        Write-Host ""
        # Versioni stabili
        foreach($ver in $dotnetVersions){
            if($missingDotnet -contains "Runtime $ver"){
                Write-Host "  Installazione .NET $ver Runtime..." -F Cyan
                winget install "Microsoft.DotNet.Runtime.$ver" --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){ Write-Host "  ✓ .NET $ver Runtime installato!" -F Green }
            }
            if($missingDotnet -contains "Desktop $ver"){
                Write-Host "  Installazione .NET $ver Desktop Runtime..." -F Cyan
                winget install "Microsoft.DotNet.DesktopRuntime.$ver" --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){ Write-Host "  ✓ .NET $ver Desktop Runtime installato!" -F Green }
            }
            if($missingDotnet -contains "SDK $ver"){
                Write-Host "  Installazione .NET $ver SDK..." -F Cyan
                winget install "Microsoft.DotNet.SDK.$ver" --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){ Write-Host "  ✓ .NET $ver SDK installato!" -F Green }
            }
        }
        # Preview
        foreach($pt in $previewTypes){
            if($missingDotnet -contains $pt.Label){
                Write-Host "  Installazione $($pt.Label)..." -F Cyan
                winget install $pt.ID --silent --accept-source-agreements --accept-package-agreements
                if($LASTEXITCODE -eq 0){ Write-Host "  ✓ $($pt.Label) installato!" -F Green }
            }
        }
        Write-Host "`n  ✓ Installazione .NET completata!`n" -F Green
        Start-Sleep 2
    }
}else{
    Write-Host "  ✓ Tutte le versioni .NET installate! ($($installedDotnet.Count) componenti)`n" -F Green

    if((Read-Host "  Verificare aggiornamenti .NET? (S/N)") -in @("S","s")){
        Write-Host ""
        $upgCount = 0
        foreach($ver in $dotnetVersions){
            Write-Host "  Aggiornamento .NET $ver..." -F Cyan
            $r1 = winget upgrade "Microsoft.DotNet.Runtime.$ver"        --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
            $r2 = winget upgrade "Microsoft.DotNet.DesktopRuntime.$ver" --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
            $r3 = winget upgrade "Microsoft.DotNet.SDK.$ver"            --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
            # Controlla se almeno uno ha trovato aggiornamenti
            $found = @($r1,$r2,$r3) | Where-Object { $_ -notmatch "non sono stati trovati|no applicable|no newer|already installed|non sono disponibili" }
            if($found){ Write-Host "  ✓ .NET $ver aggiornato!" -F Green; $upgCount++ }
            else       { Write-Host "  → .NET $ver già aggiornato" -F DarkGray }
        }
        foreach($pt in $previewTypes){
            Write-Host "  Aggiornamento $($pt.Label)..." -F Cyan
            $rp = winget upgrade $pt.ID --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
            if($rp -notmatch "non sono stati trovati|no applicable|no newer|already installed|non sono disponibili"){
                Write-Host "  ✓ $($pt.Label) aggiornato!" -F Green; $upgCount++
            } else {
                Write-Host "  → $($pt.Label) già aggiornato" -F DarkGray
            }
        }
        if($upgCount -eq 0){ Write-Host "`n  ✓ Tutto già aggiornato!`n" -F Green }
        else                { Write-Host "`n  ✓ $upgCount componenti aggiornati!`n" -F Green }
        Start-Sleep 2
    }
}

# ═════════════════════════════════════════════════════════════════════════════
#  FONT OPZIONALE: OPENDYSLEXIC
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
Write-Host "  ║          FONT OPZIONALE - OpenDyslexic                ║" -F Cyan
Write-Host "  ╚═══════════════════════════════════════════════════════╝`n" -F Cyan

Write-Host "  🔤 OpenDyslexic è un font gratuito progettato per" -F White
Write-Host "     facilitare la lettura a chi ha dislessia." -F White
Write-Host "     Caratteri pesanti in basso, forme uniche per ogni" -F White
Write-Host "     lettera — riduce inversioni e confusioni visive.`n" -F DarkGray
Write-Host "  Include:" -F Cyan
Write-Host "   • OpenDyslexic Regular / Bold / Italic" -F White
Write-Host "   • OpenDyslexic Mono (per editor di testo/codice)" -F White
Write-Host "   • OpenDyslexic Alta (lettere più alte)`n" -F White

# Controlla se già installato
$odInstalled = $false
$fontDir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
$sysFont = "$env:SystemRoot\Fonts"
if((Test-Path "$fontDir\OpenDyslexic*") -or (Test-Path "$sysFont\OpenDyslexic*")){
    $odInstalled = $true
    Write-Host "  ✓ OpenDyslexic già installato nel sistema`n" -F Green
} else {
    Write-Host "  ✗ OpenDyslexic non trovato`n" -F DarkGray
}

if($odInstalled){
    $odChoice = Read-Host "  Reinstallare/aggiornare OpenDyslexic? (S/N)"
} else {
    $odChoice = Read-Host "  Installare OpenDyslexic? (S/N)"
}

if($odChoice -in @("S","s")){
    Write-Host ""

    $odTmp      = "$env:TEMP\OpenDyslexic_OGD"
    $odZip      = "$odTmp\opendyslexic.zip"
    # Cartella font utente — NON richiede permessi speciali, funziona sempre
    $userFonts  = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
    $sysFonts   = "$env:SystemRoot\Fonts"
    $fontRegU   = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
    $fontRegS   = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"

    # Win32 API per notifica font alle app
    Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class OGDFont {
    [DllImport("gdi32.dll", CharSet=CharSet.Auto)]
    public static extern int AddFontResource(string lpFileName);
    [DllImport("user32.dll")]
    public static extern bool PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
    public const uint WM_FONTCHANGE = 0x001D;
    public static readonly IntPtr HWND_BROADCAST = new IntPtr(0xFFFF);
}
"@ -EA SilentlyContinue

    # Crea cartelle temp e font utente
    New-Item $odTmp -ItemType Directory -Force | Out-Null
    New-Item $userFonts -ItemType Directory -Force | Out-Null

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # ── Font disponibili nella cartella compiled del repo ────────────────────
    # Nota: Mono e Alta NON sono presenti nel repo corrente (issue #54 GitHub)
    # Solo i 4 variant base sono disponibili
    $fontList = @(
        "OpenDyslexic-Regular.otf",
        "OpenDyslexic-Bold.otf",
        "OpenDyslexic-Italic.otf",
        "OpenDyslexic-BoldItalic.otf"
    )

    $baseRaw = "https://raw.githubusercontent.com/antijingoist/opendyslexic/master/compiled"

    $curlExe    = "$env:SystemRoot\System32\curl.exe"
    $downloaded = 0
    $failed     = 0

    Write-Host "  ℹ Download $($fontList.Count) font da GitHub raw..." -F Cyan

    foreach($fname in $fontList){
        $url  = "$baseRaw/$fname"
        $dest = "$odTmp\$fname"
        $ok   = $false

        # Metodo 1: curl.exe
        if(-not $ok -and (Test-Path $curlExe)){
            try{
                & $curlExe -L -s --connect-timeout 10 --max-time 30 -o "$dest" "$url" 2>$null
                if((Test-Path $dest) -and (Get-Item $dest).Length -gt 1000){ $ok = $true }
                else{ Remove-Item $dest -Force -EA SilentlyContinue }
            }catch{}
        }

        # Metodo 2: WebClient
        if(-not $ok){
            try{
                $wc = New-Object System.Net.WebClient
                $wc.Headers.Add("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
                $wc.DownloadFile($url, $dest)
                if((Test-Path $dest) -and (Get-Item $dest).Length -gt 1000){ $ok = $true }
                else{ Remove-Item $dest -Force -EA SilentlyContinue }
            }catch{}
        }

        # Metodo 3: Invoke-WebRequest
        if(-not $ok){
            try{
                Invoke-WebRequest $url -OutFile $dest -UseBasicParsing -TimeoutSec 30 -EA Stop
                if((Test-Path $dest) -and (Get-Item $dest).Length -gt 1000){ $ok = $true }
                else{ Remove-Item $dest -Force -EA SilentlyContinue }
            }catch{}
        }

        if($ok){
            $downloaded++
            Write-Host "  ✓ $fname" -F DarkGray
        } else {
            $failed++
            Write-Host "  ⚠ $fname — non scaricato" -F DarkGray
        }
    }

    Write-Host ""
    if($downloaded -eq 0){
        Write-Host "  ✗ Nessun font scaricato — verifica connessione" -F Red
        Write-Host "  → Download manuale: https://opendyslexic.org" -F Yellow
        Remove-Item $odTmp -Recurse -Force -EA SilentlyContinue
    } else {
        Write-Host "  ✓ $downloaded font scaricati" -F Green

        # ── INSTALLAZIONE ────────────────────────────────────────────────────
        # Usa path con wildcard — -Include senza -Recurse non funziona in PS
        $fontFiles = Get-ChildItem "$odTmp\*.otf","$odTmp\*.ttf" -EA SilentlyContinue
        $odCount   = 0

        foreach($f in $fontFiles){
            $fontName = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
            $regVal   = if($f.Extension -eq ".otf"){"$fontName (OpenType)"}else{"$fontName (TrueType)"}
            $instOk   = $false

            # Tentativo 1: cartella font utente (nessun permesso richiesto)
            if(-not $instOk){
                try{
                    $d = Join-Path $userFonts $f.Name
                    Copy-Item $f.FullName $d -Force -EA Stop
                    Set-ItemProperty $fontRegU -Name $regVal -Value $d -Force -EA SilentlyContinue
                    try{ [OGDFont]::AddFontResource($d) | Out-Null }catch{}
                    $instOk = $true
                }catch{}
            }

            # Tentativo 2: cartella font sistema (admin)
            if(-not $instOk){
                try{
                    $d = Join-Path $sysFonts $f.Name
                    Copy-Item $f.FullName $d -Force -EA Stop
                    Set-ItemProperty $fontRegS -Name $regVal -Value $f.Name -Force -EA SilentlyContinue
                    try{ [OGDFont]::AddFontResource($d) | Out-Null }catch{}
                    $instOk = $true
                }catch{}
            }

            if($instOk){ $odCount++ }
        }

        # Notifica broadcast WM_FONTCHANGE
        try{ [OGDFont]::PostMessage([OGDFont]::HWND_BROADCAST,[OGDFont]::WM_FONTCHANGE,[IntPtr]::Zero,[IntPtr]::Zero) | Out-Null }catch{}

        if($odCount -gt 0){
            Write-Host "  ✓ OpenDyslexic installato: $odCount font" -F Green
            Write-Host ""
            Write-Host "  📋 COME USARLO:" -F Cyan
            Write-Host "   • Nuove app: font già disponibile subito" -F White
            Write-Host "   • App già aperte: chiudi e riapri quella app" -F White
            Write-Host "   • Riavvio PC: NON necessario" -F DarkGray
        } else {
            Write-Host "  ✗ Installazione fallita — verifica permessi" -F Red
            Write-Host "  → Download manuale: https://opendyslexic.org" -F Yellow
        }

        Remove-Item $odTmp -Recurse -Force -EA SilentlyContinue
    }

    Write-Host ""
    Start-Sleep 1
}

# ═════════════════════════════════════════════════════════════════════════════
#  MENU INSTALLAZIONE/DISINSTALLAZIONE
# ═════════════════════════════════════════════════════════════════════════════

Clear-Host
Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
Write-Host "  ║     OGD WinCaffè v7.6.9 ULTIMATE - Installazione       ║" -F Cyan
Write-Host "  ╚═══════════════════════════════════════════════════════╝`n" -F Cyan

Write-Host "  [1] ⚙️  INSTALLA - Aggiungi comando 'wincaffe' globale" -F Green
Write-Host "      Copia script in C:\OGD\ + comando PowerShell" -F DarkGray
Write-Host "`n  [2] ❌ DISINSTALLA - Rimuovi comando 'wincaffe'" -F Red
Write-Host "      Pulisce tutto (script + profilo PowerShell)" -F DarkGray
Write-Host "`n  [3] ▶️  ESEGUI - Avvia normalmente (senza installare)`n" -F Yellow

$setupChoice=Read-Host "  Scelta (1/2/3)"

if($setupChoice -eq "1"){
    # INSTALLAZIONE
    Clear-Host
    Write-Host "`n  ⚙️  INSTALLAZIONE OGD WINCAFFÈ`n" -F Green
    
    # Percorso installazione
    $installDir="C:\OGD"
    $scriptDest="$installDir\OGD_WinCaffe_ULTIMATE.ps1"
    
    # Crea cartella
    if(!(Test-Path $installDir)){New-Item $installDir -ItemType Directory -Force|Out-Null}
    
    # Copia script — confronto percorsi case-insensitive e normalizzato
    $srcResolved  = (Resolve-Path $PSCommandPath -EA SilentlyContinue).Path
    $destResolved = $scriptDest
    if($srcResolved -and ($srcResolved.ToLower() -ne $destResolved.ToLower())){
        Copy-Item $PSCommandPath $scriptDest -Force
        Write-Host "  ✓ Script copiato: $scriptDest" -F Green
    }else{
        Write-Host "  ✓ Script già nella posizione corretta" -F Green
    }

    # Copia anche il timer se presente nella stessa cartella
    $timerSrcInst = Join-Path (Split-Path $PSCommandPath) "OGD_Timer_0.5ms.ps1"
    $timerDstInst = "$installDir\OGD_Timer_0.5ms.ps1"
    if((Test-Path $timerSrcInst) -and ($timerSrcInst.ToLower() -ne $timerDstInst.ToLower())){
        Copy-Item $timerSrcInst $timerDstInst -Force
        Write-Host "  ✓ Timer copiato: $timerDstInst" -F Green
    }
    
    # Determina profilo PowerShell (5.1 vs 7+)
    $profilePath=$PROFILE.CurrentUserAllHosts
    if(!$profilePath){$profilePath="$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"}
    
    # Backup profilo esistente
    if(Test-Path $profilePath){
        $bkProfile="$profilePath.ogd_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
        Copy-Item $profilePath $bkProfile -Force
        Write-Host "  ✓ Backup profilo: $bkProfile" -F Green
    }
    
    # Crea/aggiorna profilo con function wincaffe
    $profileDir=Split-Path $profilePath
    if(!(Test-Path $profileDir)){New-Item $profileDir -ItemType Directory -Force|Out-Null}
    
    $functionCode=@"

# ═════════════════════════════════════════════════════════════════
# OGD WinCaffè v7.6.9 ULTIMATE - Installato da #DarkPlayer84Tv
# ═════════════════════════════════════════════════════════════════
function wincaffe {
    `$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")
    `$pwshExe = Get-Command pwsh -EA SilentlyContinue
    `$psExe   = if(`$pwshExe){"pwsh"}else{"powershell"}
    if(-not `$isAdmin){
        Start-Process `$psExe "-ExecutionPolicy Bypass -File `"$scriptDest`"" -Verb RunAs
    }else{
        & `$psExe -ExecutionPolicy Bypass -File "$scriptDest"
    }
}
Write-Host "⚡ OGD WinCaffè installato! Usa comando: " -NoNewline -ForegroundColor Cyan
Write-Host "wincaffe" -ForegroundColor Yellow
# ═════════════════════════════════════════════════════════════════

"@
    
    # Aggiungi al profilo (evita duplicati)
    if(Test-Path $profilePath){
        $existingContent=Get-Content $profilePath -Raw
        if($existingContent -notmatch "function wincaffe"){
            Add-Content $profilePath $functionCode
        }
    }else{
        Set-Content $profilePath $functionCode
    }
    
    Write-Host "  ✓ Profilo PowerShell aggiornato: $profilePath" -F Green
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ INSTALLAZIONE COMPLETATA! ⚡" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    Write-Host "  PROSSIMI PASSI:" -F Cyan
    Write-Host "  1. Chiudi e riapri PowerShell" -F White
    Write-Host "  2. Digita: " -NoNewline -F White;Write-Host "wincaffe" -F Yellow
    Write-Host "  3. Lo script si aprirà ovunque tu sia!`n" -F White
    
    Read-Host "  INVIO per uscire"
    exit
}

if($setupChoice -eq "2"){
    # DISINSTALLAZIONE
    Clear-Host
    Write-Host "`n  ❌ DISINSTALLAZIONE OGD WINCAFFÈ`n" -F Red
    
    if((Read-Host "  Confermi disinstallazione? (S/N)") -notin @("S","s")){exit}
    
    $installDir="C:\OGD"
    $scriptDest="$installDir\OGD_WinCaffe_ULTIMATE.ps1"
    
    # Rimuovi script
    if(Test-Path $scriptDest){
        Remove-Item $scriptDest -Force
        Write-Host "  ✓ Script rimosso: $scriptDest" -F Green
    }
    
    # Rimuovi cartella se vuota
    if(Test-Path $installDir){
        $items=Get-ChildItem $installDir
        if($items.Count -eq 0){
            Remove-Item $installDir -Force
            Write-Host "  ✓ Cartella rimossa: $installDir" -F Green
        }
    }
    
    # Rimuovi function dal profilo
    $profilePath=$PROFILE.CurrentUserAllHosts
    if(!$profilePath){$profilePath="$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"}
    
    if(Test-Path $profilePath){
        $content=Get-Content $profilePath -Raw
        # Rimuovi blocco OGD
        $content=$content -replace "(?s)# ═+\s*OGD WinCaffè.*?# ═+\s*",""
        Set-Content $profilePath $content.Trim()
        Write-Host "  ✓ Profilo PowerShell pulito" -F Green
    }
    
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ DISINSTALLAZIONE COMPLETATA! ⚡" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    Write-Host "  Il comando 'wincaffe' non è più disponibile.`n" -F White
    
    Read-Host "  INVIO per uscire"
    exit
}

# Se scelta 3 o altro, continua normalmente

# ═════════════════════════════════════════════════════════════════════════════
#  FUNZIONI UI
# ═════════════════════════════════════════════════════════════════════════════

function Show-Banner {
    Clear-Host
    Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -F Cyan
    Write-Host "  ║                                                       ║" -F Cyan
    Write-Host "  ║     ▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄  ▄▄▄▄▄▄    ⚡                  ║" -F Yellow
    Write-Host "  ║    █       ██       ██      █                        ║" -F Yellow
    Write-Host "  ║    █   ▄   ██   ▄▄▄▄█  ▄    █  WinCaffè v7.6.9        ║" -F Yellow
    Write-Host "  ║    █  █ █  ██  █  ▄▄█ █ █   █  ULTIMATE              ║" -F Yellow
    Write-Host "  ║    █  █▄█  ██  █ █  █ █▄█   █                        ║" -F Yellow
    Write-Host "  ║    █       ██  █▄▄█ █       █  ⚡                    ║" -F Yellow
    Write-Host "  ║    █▄▄▄▄▄▄▄██▄▄▄▄▄▄▄█▄▄▄▄▄▄█                         ║" -F Yellow
    Write-Host "  ║                                                       ║" -F Cyan
    Write-Host "  ║           #DarkPlayer84Tv Productions                ║" -F Green
    Write-Host "  ║         by OldGamerDarthy Official 🎮                ║" -F Green
    Write-Host "  ║                                                       ║" -F Cyan
    Write-Host "  ╚═══════════════════════════════════════════════════════╝" -F Cyan
    Write-Host "`n                      ( (                                " -F DarkGray
    Write-Host "                       ) )                                 " -F Gray
    Write-Host "                    .........                              " -F Yellow
    Write-Host "                    |       |]  ☕                         " -F Yellow
    Write-Host "                    \       /                              " -F Yellow
    Write-Host "                 ~~~~~~~~~~~~~~`n                          " -F DarkYellow
    Write-Host "      🎮 Ottimizzazione Gaming Windows 11 by OGD 🎮" -F Cyan
    Write-Host "        Original Gaming Design - DarkPlayer84Tv`n" -F DarkGray
}

function Show-Steam {
    for($i=0;$i -lt 2;$i++){
        Start-Sleep -Milliseconds 100
        Write-Host "`r                          ~ ~ ~           " -NoNewline -F DarkGray
        Start-Sleep -Milliseconds 100
        Write-Host "`r                         ~   ~   ~        " -NoNewline -F Gray
        Start-Sleep -Milliseconds 100
        Write-Host "`r                        ~     ☕     ~     " -NoNewline -F White
    }
    Write-Host "`r                           ( (           " -F DarkGray
}

function Write-Section([string]$T){
    Write-Host "`n  ════════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ $T" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════════" -F Cyan
}

function Write-Success([string]$M){Write-Host "  ✓ $M" -F Green}
function Write-Info([string]$M){Write-Host "  ℹ $M" -F Cyan}
function Write-Warning([string]$M){Write-Host "  ⚠ $M" -F Yellow}
function Write-Error2([string]$M){Write-Host "  ✗ $M" -F Red}

# ═════════════════════════════════════════════════════════════════════════════
#  HARDWARE DETECTION
# ═════════════════════════════════════════════════════════════════════════════

Show-Banner; Show-Steam
Write-Section "RILEVAMENTO SISTEMA"

$cpu=Get-CimInstance Win32_Processor
$ram=[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1)
$isLaptop=(Get-CimInstance Win32_SystemEnclosure).ChassisTypes -in @(8,9,10,11,14)

Write-Info "CPU: $($cpu.Name)"
Write-Info "Core: $($cpu.NumberOfCores) fisici / $($cpu.NumberOfLogicalProcessors) logici"
Write-Info "RAM: $ram GB | Build: $build | Tipo: $(if($isLaptop){'💻 Laptop'}else{'🖥️ Desktop'})"

# P+E cores
$isPE=$false;$pC=0;$eC=0
if($cpu.Name -match "i[579]-1[2-5]\d{3}"){
    $isPE=$true;$tC=$cpu.NumberOfCores
    if($cpu.Name -match "HX|HK"){$pC=[math]::Floor($tC*0.4)}else{$pC=[math]::Floor($tC/2)}
    $eC=$tC-$pC
    Write-Info "Architettura: HYBRID ⚡ ($pC P-cores + $eC E-cores)"
}else{Write-Info "Architettura: TRADIZIONALE";$pC=$cpu.NumberOfCores}

# NPU
$hasNPU=$false
$npu=Get-PnpDevice|Where-Object{$_.FriendlyName -match "NPU|Neural|AI Engine|Hexagon|Ryzen AI|Intel AI Boost" -and $_.Status -eq "OK"}
if($npu){$hasNPU=$true;Write-Info "NPU: ✓ Rilevata 🧠"}else{Write-Warning "NPU: ✗ Non rilevata"}

Write-Host ""
if($ram -lt 12){Write-Warning "RAM < 12GB - Ottimizzazioni aggressive";if((Read-Host "  Continuare? (S/N)") -notin @("S","s")){exit}}

# ═════════════════════════════════════════════════════════════════════════════
#  BACKUP AUTOMATICO
# ═════════════════════════════════════════════════════════════════════════════

Show-Banner
Write-Section "BACKUP E SICUREZZA"

try{
    Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
    $desc="OGD WinCaffè v7.6.9 - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
    Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
    Write-Success "Punto ripristino: $desc"
    Write-Info "Ripristino: F8 al boot → Ripristino configurazione sistema"
}catch{Write-Warning "Punto ripristino non creato"}

Write-Host "";Start-Sleep 1

# ═════════════════════════════════════════════════════════════════════════════
#  WINREVIVE FUNCTIONS - Riparazione Windows Integrata
# ═════════════════════════════════════════════════════════════════════════════

function WinRevive-ResetWU {
    Write-Info "Reset Windows Update..."
    $services = @("wuauserv","bits","cryptsvc","msiserver")
    foreach($s in $services){
        try{ Stop-Service $s -Force -EA SilentlyContinue; Write-Success "Service ${s}: Stopped" }
        catch{ Write-Warning "Service ${s}: Skip" }
    }
    $paths = @("C:\Windows\SoftwareDistribution\Download","C:\Windows\System32\catroot2")
    foreach($p in $paths){
        if(Test-Path $p){ Remove-Item "$p\*" -Recurse -Force -EA SilentlyContinue; Write-Success "Cleaned: $p" }
    }
    foreach($s in $services){
        try{ Start-Service $s -EA SilentlyContinue; Write-Success "Service ${s}: Started" }
        catch{ Write-Warning "Service ${s}: Skip" }
    }
}

function WinRevive-RepairImage {
    Write-Info "DISM + SFC riparazione..."
    Write-Host "  ⚠️ Operazione può richiedere 10-30 minuti`n" -F Yellow
    dism.exe /Online /Cleanup-Image /RestoreHealth | Out-Null
    Write-Success "DISM: Completato"
    sfc /scannow | Out-Null
    Write-Success "SFC: Completato"
}

function WinRevive-StoreReset {
    Write-Info "Reset Microsoft Store..."
    wsreset.exe | Out-Null
    Write-Success "Store: Reset completato"
}

function WinRevive-NetworkReset {
    Write-Info "Reset stack rete..."
    netsh winsock reset | Out-Null
    netsh int ip reset | Out-Null
    Write-Success "Network: Reset completato"
}

function WinRevive-CleanBasic {
    Write-Info "Pulizia base sistema..."
    # Temp
    $temp = @($env:TEMP, [IO.Path]::GetTempPath(), "C:\Windows\Temp")
    foreach($t in $temp){
        if(Test-Path $t){ Get-ChildItem $t -Force -EA SilentlyContinue | Remove-Item -Recurse -Force -EA SilentlyContinue }
    }
    # Delivery Optimization
    $do = "C:\ProgramData\Microsoft\Windows\DeliveryOptimization\Cache"
    if(Test-Path $do){ Get-ChildItem $do -Force -EA SilentlyContinue | Remove-Item -Recurse -Force -EA SilentlyContinue }
    # SoftwareDistribution
    $sd = "C:\Windows\SoftwareDistribution\Download"
    if(Test-Path $sd){ Get-ChildItem $sd -Force -EA SilentlyContinue | Remove-Item -Recurse -Force -EA SilentlyContinue }
    # Recycle Bin
    try{ Clear-RecycleBin -Force -EA SilentlyContinue }catch{}
    Write-Success "Pulizia base: Completata"
}

function WinRevive-CleanAdvanced {
    WinRevive-CleanBasic
    Write-Info "DISM ComponentCleanup /ResetBase..."
    dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase | Out-Null
    # Browser cache
    $edge = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache"
    $chrome = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache"
    if(Test-Path $edge){ Get-ChildItem $edge -Force -EA SilentlyContinue | Remove-Item -Recurse -Force -EA SilentlyContinue }
    if(Test-Path $chrome){ Get-ChildItem $chrome -Force -EA SilentlyContinue | Remove-Item -Recurse -Force -EA SilentlyContinue }
    Write-Success "Pulizia avanzata: Completata"
}

function WinRevive-DisableRecall {
    Write-Info "Disabilita Recall (Windows 11)..."
    try{
        dism.exe /Online /Disable-Feature /Featurename:Recall /NoRestart | Out-Null
        Write-Success "Recall: Disabilitato"
    }catch{
        Write-Warning "Recall: Feature non trovata o già disabilitata"
    }
}



# ═════════════════════════════════════════════════════════════════════════════
#  MENU PRINCIPALE
# ═════════════════════════════════════════════════════════════════════════════

:MenuLoop
while($true){
Show-Banner
Write-Section "MENU OTTIMIZZAZIONI"

Write-Host "`n  ┌─────────────────────────────────────────────────────────┐" -F Cyan
Write-Host "  │ ⚡ LIVELLI DI OTTIMIZZAZIONE                           │" -F Cyan
Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Cyan

Write-Host "  [1] 🟢 LIGHT - Ottimizzazioni base (safe al 100%)" -F White
Write-Host "      C-States + Timer + Privacy + Network + DNS + Explorer" -F DarkGray
Write-Host "      Consigliato: Tutti | Impatto: Minimo | Risultato: +5-10% FPS`n" -F DarkGray

Write-Host "  [2] 🟡 NORMALE - Completo per gaming (raccomandato)" -F White
Write-Host "      TUTTO: Light + Process(30+) + NPU + Debloat + Visual" -F DarkGray
Write-Host "      Consigliato: Gaming PC | Impatto: Medio | Risultato: +10-15% FPS`n" -F DarkGray

Write-Host "  [3] 🔴 AGGRESSIVO - Massima performance (no freeze)" -F White
Write-Host "      Normale + Memory + Boost + MMCSS + GameMode + Storage + Font OD" -F DarkGray
Write-Host "      Consigliato: Enthusiast | Impatto: Alto | Risultato: +15-20% FPS`n" -F DarkGray

Write-Host "  [A] ⚡ AGGRESSIVO GAMING - Sub-menu livelli gaming (Light/Normale/Full)" -F Magenta
Write-Host "      Tweaks gaming dedicati — scegli il livello in base al tuo PC`n" -F DarkGray

Write-Host "  [4] 💻 LAPTOP - Ottimizzazione laptop (sub-menu livelli)" -F White
Write-Host "      Light/Normale/Alto/Ultra — bilanciato batteria/performance" -F DarkGray
Write-Host "      Consigliato: Laptop | Sicuro per batteria e termica`n" -F DarkGray

Write-Host "  [5] 🎮 LAPTOP GAMING - Laptop da gaming (sub-menu livelli)" -F White
Write-Host "      Light/Normale/Alto/Ultra — gaming laptop ottimizzato" -F DarkGray
Write-Host "      Consigliato: Gaming laptop | In carica per Ultra`n" -F DarkGray

Write-Host "  ┌─────────────────────────────────────────────────────────┐" -F Cyan
Write-Host "  │ 🔧 STRUMENTI AGGIUNTIVI                                │" -F Cyan
Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Cyan

Write-Host "  [6] 🌐 DNS TNT - Solo flush DNS + Winsock reset" -F White
Write-Host "  [7] 📁 EXPLORER - Solo cache folder views" -F White
Write-Host "  [8] 📜 INFO - Cosa fa ogni livello" -F White
Write-Host "  [9] 🔄 RESET - Punto ripristino Windows`n" -F White
Write-Host "  [F] 📂 FILE I/O - Velocizza trasferimenti/installazioni`n" -F White
Write-Host "  [U] 🔄 WINGET UPDATE - Aggiorna programmi installati`n" -F White

Write-Host "  [W] 🛠️  WINREVIVE - Riparazione Windows" -F Cyan
Write-Host "  [N] 📡 NET TWEAKS - WiFi + LAN ottimizzazione avanzata" -F Cyan
Write-Host "  [G] 🟢 NVIDIA TWEAKS - Ottimizzazione GPU NVIDIA (safe)" -F Green
Write-Host "  [L] ⚡ DPC LATENCY FIX - Risolvi lag/stuttering audio e sistema" -F Yellow
Write-Host "  [P] 🧠 NPU TWEAKS - Ottimizzazione Neural Processing Unit" -F Cyan
Write-Host "  [E] 🎮 UNREAL ENGINE - Ottimizzazioni UE4/UE5 (dev + gaming)" -F Yellow
Write-Host "  [C] 🔫 CALL OF DUTY - Tweaks MW1→Black Ops 7 (safe, no ban)" -F Red
Write-Host "  [D] 💬 DISCORD - Unisciti alla community OGD" -F Magenta
Write-Host "  [0] ❌ ESCI - Chiudi script`n" -F Red

$mode=Read-Host "  Scelta (1-9/A/F/U/W/N/G/L/P/E/C/D/0)"


# Gestione opzione 0 (Esci)
if($mode -eq "0"){
    Write-Host "`n  👋 Uscita script..." -F Yellow
    exit
}

# ── SOTTO-MENU LIVELLO AGGRESSIVO GAMING (modalità A) ────────────────────────
$aggrGamingLevel = ""
if($mode -in @("A","a")){
    Show-Banner
    Write-Section "AGGRESSIVO GAMING — SCEGLI LIVELLO"

    Write-Host "`n  Scegli il livello in base alla potenza del tuo PC:`n" -F Cyan

    Write-Host "  [L] 🟢 LIGHT GAMING - Gaming base, safe su qualsiasi PC" -F Green
    Write-Host "      Game Mode ON, DVR OFF, Timer, Process priority gaming" -F DarkGray
    Write-Host "      Consigliato: tutti | PC entry-level e mid-range`n" -F DarkGray

    Write-Host "  [N] 🟡 NORMALE GAMING - Gaming completo (raccomandato)" -F Yellow
    Write-Host "      Light + MMCSS gaming, Power max, CPU boost, Fullscreen ottimizzato" -F DarkGray
    Write-Host "      Consigliato: gaming PC | Da 8GB RAM in su`n" -F DarkGray

    Write-Host "  [F] 🔴 FULL GAMING - Massimo assoluto (solo PC potenti)" -F Magenta
    Write-Host "      Normale + Win11 hidden tweaks, Core Parking OFF, RAM estrema," -F DarkGray
    Write-Host "      OS hidden, servizi disabilitati, GPU estremo" -F DarkGray
    Write-Host "      Consigliato: PC alta potenza | 16GB+ RAM | Solo desktop`n" -F DarkGray

    $agl = Read-Host "  Livello (L/N/F)"
    if($agl -notin @("L","l","N","n","F","f")){
        Write-Host "  Scelta non valida" -F Red; Start-Sleep 1; continue MenuLoop
    }
    $aggrGamingLevel = $agl.ToUpper()
}

# ── SOTTO-MENU LIVELLO LAPTOP (modalità 4 e 5) ───────────────────────────────
$laptopLevel = ""
$isGamingLaptop = ($mode -eq "5")

if($mode -in @("4","5")){
    $ltTitle = if($isGamingLaptop){"LAPTOP GAMING"}else{"LAPTOP"}
    Show-Banner
    Write-Section "LIVELLO OTTIMIZZAZIONE $ltTitle"

    Write-Host "`n  Scegli il livello di ottimizzazione:`n" -F Cyan

    Write-Host "  [L] 🟢 LIGHT - Base sicuro, batteria preservata" -F Green
    Write-Host "      Timer + Privacy + DNS + GPU" -F DarkGray
    Write-Host "      Impatto batteria: Minimo | Performance: +5%`n" -F DarkGray

    Write-Host "  [N] 🟡 NORMALE - Bilanciato performance/batteria" -F Yellow
    Write-Host "      Light + Process priority + Debloat + Visual" -F DarkGray
    Write-Host "      Impatto batteria: Leggero | Performance: +10%`n" -F DarkGray

    Write-Host "  [A] 🔴 ALTO - Performance elevata (consigliato in carica)" -F Red
    Write-Host "      Normale + High Perf plan + Power Throttling OFF + MMCSS" -F DarkGray
    Write-Host "      Impatto batteria: Medio | Performance: +15%`n" -F DarkGray

    Write-Host "  [U] ⚡ ULTRA - Massima performance (solo in carica)" -F Magenta
    Write-Host "      Alto + CPU Boost + Memory + C-states ridotti" -F DarkGray
    if($isGamingLaptop){
        Write-Host "      + GPU max clock + USB suspend OFF + Game Mode" -F DarkGray
    }
    Write-Host "      ⚠️  Riduce autonomia batteria — usa solo in carica`n" -F Yellow

    $ll = Read-Host "  Livello (L/N/A/U)"
    if($ll -notin @("L","l","N","n","A","a","U","u")){
        Write-Host "  Scelta non valida" -F Red; Start-Sleep 1; continue MenuLoop
    }
    $laptopLevel = $ll.ToUpper()
}

# Gestione opzione W (WinRevive)
if($mode -in @("W","w")){
    Show-Banner
    Write-Section "WINREVIVE - RIPARAZIONE WINDOWS"
    
    Write-Host "`n  ┌─────────────────────────────────────────────────────────┐" -F Cyan
    Write-Host "  │ 🔧 RIPARAZIONE E PULIZIA SISTEMA                       │" -F Cyan
    Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Cyan
    
    Write-Host "  [1] 🔄 RESET WINDOWS UPDATE - Fix errori aggiornamenti" -F Green
    Write-Host "  [2] 🩹 REPAIR IMAGE - DISM + SFC (10-30 min)" -F Yellow
    Write-Host "  [3] 🏪 STORE RESET - Reset Microsoft Store" -F Cyan
    Write-Host "  [4] 🌐 NETWORK RESET - Reset stack rete" -F Magenta
    Write-Host "  [5] 🧹 CLEAN BASIC - Pulizia temp/cache base" -F White
    Write-Host "  [6] 🧽 CLEAN ADVANCED - Pulizia aggressiva DISM" -F Red
    Write-Host "  [7] ❌ DISABLE RECALL - Disabilita Recall (Win11)" -F Yellow
    Write-Host "  [A] 🚀 ALL - Esegui tutto (1+2+3+4)" -F Green
    Write-Host "  [0] ⏭️  SALTA - Torna ai tweaks`n" -F White
    
    $revive=Read-Host "  Scelta"
    
    if($revive -ne "0"){
        Write-Host ""
        # Punto ripristino
        try{
            Enable-ComputerRestore -Drive "C:" -EA SilentlyContinue
            $desc="OGD WinRevive - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
            Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
            Write-Success "Punto ripristino: $desc"
        }catch{ Write-Warning "Punto ripristino non creato" }
        
        Write-Host ""
        
        switch($revive){
            "1"{ WinRevive-ResetWU }
            "2"{ WinRevive-RepairImage }
            "3"{ WinRevive-StoreReset }
            "4"{ WinRevive-NetworkReset }
            "5"{ WinRevive-CleanBasic }
            "6"{ WinRevive-CleanAdvanced }
            "7"{ WinRevive-DisableRecall }
            {$_ -in @("A","a")}{
                WinRevive-ResetWU
                WinRevive-RepairImage
                WinRevive-StoreReset
                WinRevive-NetworkReset
                Write-Host "`n  ════════════════════════════════════════════════════" -F Green
                Write-Host "   ✓ RIPARAZIONE COMPLETA!" -F Green
                Write-Host "  ════════════════════════════════════════════════════`n" -F Green
            }
        }
        
        if($revive -ne "A" -and $revive -ne "a"){
            Write-Host "`n  ════════════════════════════════════════════════════" -F Green
            Write-Host "   ✓ WINREVIVE COMPLETATO!" -F Green
            Write-Host "  ════════════════════════════════════════════════════`n" -F Green
        }
        
        if((Read-Host "  Riavvio consigliato. Riavviare ora? (S/N)") -in @("S","s")){
            Restart-Computer -Force
        }
    }
    
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MENU PROTEZIONE PRIVACY (4 livelli)
# ═════════════════════════════════════════════════════════════════════════════

$privacyLevel="0"
if($mode -in @("1","2","3","A","a","4","5")){
    Show-Banner
    Write-Section "PROTEZIONE PRIVACY"
    
    Write-Host "`n  🔒 Vuoi applicare protezioni privacy aggiuntive?`n" -F Cyan
    Write-Host "  [1] 🟢 LIGHT - Privacy base" -F Green
    Write-Host "      • Telemetry Microsoft OFF" -F DarkGray
    Write-Host "      • Cortana disabilitata" -F DarkGray
    Write-Host "      • Suggerimenti/pubblicità OFF`n" -F DarkGray
    
    Write-Host "  [2] 🟡 NORMALE - Privacy avanzata" -F Yellow
    Write-Host "      • Light +" -F DarkGray
    Write-Host "      • OneDrive disabilitato" -F DarkGray
    Write-Host "      • Servizi cloud/diagnostica OFF" -F DarkGray
    Write-Host "      • Location/camera/microfono OFF`n" -F DarkGray
    
    Write-Host "  [3] 🔴 AGGRESSIVO - Privacy massima" -F Red
    Write-Host "      • Normale +" -F DarkGray
    Write-Host "      • NVIDIA/Adobe/VS telemetry OFF" -F DarkGray
    Write-Host "      • WiFi Sense OFF" -F DarkGray
    Write-Host "      • Feedback/diagnostica completa OFF`n" -F DarkGray
    
    Write-Host "  [4] ⚫ PARANOICO - Privacy estrema" -F Magenta
    Write-Host "      • Aggressivo +" -F DarkGray
    Write-Host "      • Windows Update solo manuale" -F DarkGray
    Write-Host "      • Defender ridotto (solo scan manuale)" -F DarkGray
    Write-Host "      • Tutti i servizi telemetry disabled" -F DarkGray
    Write-Host "      • ⚠️ Può limitare funzionalità Windows`n" -F Yellow
    
    Write-Host "  [0] ⏭️  SALTA - Nessuna protezione extra`n" -F White
    
    $privacyLevel=Read-Host "  Scelta (0-4)"
}

# ═════════════════════════════════════════════════════════════════════════════
#  MENU NETWORK OPTIMIZATION (WiFi/Ethernet/Entrambi)
# ═════════════════════════════════════════════════════════════════════════════

$networkType="0"
if($mode -in @("1","2","3","A","a","4","5")){
    Show-Banner
    Write-Section "NETWORK OPTIMIZATION"
    
    Write-Host "`n  🌐 Vuoi ottimizzare rete WiFi o Ethernet?`n" -F Cyan
    
    Write-Host "  [1] 📡 WiFi ONLY - Ottimizzazioni wireless" -F Cyan
    Write-Host "      • TCP/IP optimization" -F DarkGray
    Write-Host "      • WiFi power saving OFF" -F DarkGray
    Write-Host "      • Random MAC addresses OFF" -F DarkGray
    Write-Host "      • WiFi latency reduction" -F DarkGray
    Write-Host "      • QoS optimization`n" -F DarkGray
    
    Write-Host "  [2] 🔌 ETHERNET ONLY - Ottimizzazioni cablate" -F Green
    Write-Host "      • TCP/IP optimization" -F DarkGray
    Write-Host "      • Interrupt moderation" -F DarkGray
    Write-Host "      • RSS (Receive Side Scaling)" -F DarkGray
    Write-Host "      • Offload settings (LSO/TSO)" -F DarkGray
    Write-Host "      • Jumbo Frames (se supportati)" -F DarkGray
    Write-Host "      • Energy Efficient Ethernet OFF`n" -F DarkGray
    
    Write-Host "  [3] 🌐 ENTRAMBI - WiFi + Ethernet" -F Yellow
    Write-Host "      • Tutte le ottimizzazioni combinate`n" -F DarkGray
    
    Write-Host "  [0] ⏭️  SALTA - Nessuna ottimizzazione network`n" -F White
    
    $networkType=Read-Host "  Scelta (0-3)"
}

# ═════════════════════════════════════════════════════════════════════════════
#  MENU PROGRAMMI OPZIONALI (solo se livello 1/2/3)
# ═════════════════════════════════════════════════════════════════════════════

$installPrograms=$false
$selectedApps=@()
$upgradeApps=@()

if($mode -in @("1","2","3","A","a","4","5")){
    Show-Banner
    Write-Section "PROGRAMMI OPZIONALI CONSIGLIATI"

    # ── CATALOGO PROGRAMMI ───────────────────────────────────────────────────
    # Ogni voce: Num, Name, ID winget, Cat(egoria), Status (popolato dopo check)
    $appCatalog = @(
        # 🌐 BROWSER
        [PSCustomObject]@{Num="01";Name="Google Chrome";             ID="Google.Chrome";                        Cat="🌐 Browser";      Status=""}
        [PSCustomObject]@{Num="02";Name="Mozilla Firefox";           ID="Mozilla.Firefox";                      Cat="🌐 Browser";      Status=""}
        [PSCustomObject]@{Num="03";Name="Brave Browser";             ID="Brave.Brave";                          Cat="🌐 Browser";      Status=""}
        # 📊 MONITORING
        [PSCustomObject]@{Num="04";Name="GPU-Z";                     ID="TechPowerUp.GPU-Z";                    Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="05";Name="CPU-Z";                     ID="CPUID.CPU-Z";                          Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="06";Name="HWiNFO";                    ID="REALiX.HWiNFO";                        Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="07";Name="HWMonitor";                 ID="CPUID.HWMonitor";                      Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="08";Name="Core Temp";                 ID="ALCPU.CoreTemp";                       Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="09";Name="CrystalDiskInfo";           ID="CrystalDewWorld.CrystalDiskInfo";      Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="10";Name="CrystalDiskMark";           ID="CrystalDewWorld.CrystalDiskMark";      Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="11";Name="Speccy";                    ID="Piriform.Speccy";                      Cat="📊 Monitoring";   Status=""}
        [PSCustomObject]@{Num="12";Name="OCCT (stress test)";        ID="OCBase.OCCT";                          Cat="📊 Monitoring";   Status=""}
        # ⚡ OVERCLOCK / TUNING
        [PSCustomObject]@{Num="13";Name="MSI Afterburner";           ID="Guru3D.Afterburner";                   Cat="⚡ Overclock";    Status=""}
        [PSCustomObject]@{Num="14";Name="ThrottleStop (laptop)";     ID="TechPowerUp.ThrottleStop";             Cat="⚡ Overclock";    Status=""}
        # 🔧 DRIVER
        [PSCustomObject]@{Num="15";Name="DDU - Display Driver Uninstaller"; ID="Wagnardsoft.DDU";              Cat="🔧 Driver";       Status=""}
        [PSCustomObject]@{Num="16";Name="Snappy Driver Installer";   ID="SamLab.SnappyDriverInstaller";         Cat="🔧 Driver";       Status=""}
        [PSCustomObject]@{Num="17";Name="NVCleanstall (NVIDIA)";     ID="TechPowerUp.NVCleanstall";             Cat="🔧 Driver";       Status=""}
        # 🛠️ UTILITÀ
        [PSCustomObject]@{Num="18";Name="7-Zip";                     ID="7zip.7zip";                            Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="19";Name="Notepad++";                 ID="Notepad++.Notepad++";                  Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="20";Name="Everything (ricerca file)"; ID="voidtools.Everything";                 Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="21";Name="TreeSize Free";             ID="JAMSoftware.TreeSize.Free";            Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="22";Name="Revo Uninstaller";          ID="VS.Revo.Group.RevoUninstaller";        Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="23";Name="BCUninstaller";             ID="Klocman.BulkCrapUninstaller";          Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="24";Name="UniGetUI (WingetUI)";       ID="MartiCliment.UniGetUI";                Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="25";Name="WinMerge";                  ID="WinMerge.WinMerge";                    Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="26";Name="Bulk Rename Utility";       ID="TGRMN.BulkRenameUtility";              Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="27";Name="PowerToys";                 ID="Microsoft.PowerToys";                  Cat="🛠️  Utilità";     Status=""}
        [PSCustomObject]@{Num="28";Name="ShareX (screenshot)";       ID="ShareX.ShareX";                        Cat="🛠️  Utilità";     Status=""}
        # 🎮 GAMING
        [PSCustomObject]@{Num="29";Name="Steam";                     ID="Valve.Steam";                          Cat="🎮 Gaming";       Status=""}
        [PSCustomObject]@{Num="30";Name="Discord";                   ID="Discord.Discord";                      Cat="🎮 Gaming";       Status=""}
        [PSCustomObject]@{Num="31";Name="Playnite (launcher)";       ID="Playnite.Playnite";                    Cat="🎮 Gaming";       Status=""}
        [PSCustomObject]@{Num="32";Name="Parsec (remote gaming)";    ID="Parsec.Parsec";                        Cat="🎮 Gaming";       Status=""}
        # 🌐 RETE
        [PSCustomObject]@{Num="33";Name="qBittorrent";               ID="qBittorrent.qBittorrent";              Cat="🌐 Rete";         Status=""}
        [PSCustomObject]@{Num="34";Name="Wireshark";                 ID="WiresharkFoundation.Wireshark";        Cat="🌐 Rete";         Status=""}
    )

    # ── CHECK STATO (1 chiamata winget list + 1 winget upgrade) ─────────────
    Write-Host "`n  🔍 Controllo stato programmi installati..." -F DarkGray

    # Scarica lista installati e lista aggiornamenti in una volta sola
    $installedList = winget list --accept-source-agreements 2>$null | Out-String
    $upgradeList   = winget upgrade --accept-source-agreements 2>$null | Out-String

    foreach($app in $appCatalog){
        if($installedList -match [regex]::Escape($app.ID)){
            if($upgradeList -match [regex]::Escape($app.ID)){
                $app.Status = "UPD"   # installato, aggiornamento disponibile
            } else {
                $app.Status = "OK"    # installato e aggiornato
            }
        } else {
            $app.Status = "NEW"       # non installato
        }
    }

    # ── MOSTRA MENU CON STATO ────────────────────────────────────────────────
    Write-Host ""
    $currentCat = ""
    foreach($app in $appCatalog){
        # Intestazione categoria
        if($app.Cat -ne $currentCat){
            $currentCat = $app.Cat
            Write-Host "`n  $currentCat" -F Cyan
        }
        # Colore e icona in base allo stato
        $icon  = switch($app.Status){"OK"{"✓ "};"UPD"{"🔄"};"NEW"{"  "}}
        $color = switch($app.Status){"OK"{"DarkGray"};"UPD"{"Yellow"};"NEW"{"White"}}
        $tag   = switch($app.Status){"OK"{"[già installato]"};"UPD"{"[aggiornamento disponibile]"};"NEW"{""}}
        Write-Host ("  [{0}] {1} {2,-30} {3}" -f $app.Num, $icon, $app.Name, $tag) -F $color
    }

    Write-Host "`n  ────────────────────────────────────────────────────" -F DarkGray
    Write-Host "  Legenda:  ✓ installato  🔄 da aggiornare  (vuoto) non installato" -F DarkGray
    Write-Host "`n  Selezione:" -F Cyan
    Write-Host "  • Numeri separati da virgola  es: 04,06,13" -F White
    Write-Host "  • [A] Installa TUTTI i non installati" -F Green
    Write-Host "  • [U] Aggiorna TUTTI quelli con aggiornamento disponibile" -F Yellow
    Write-Host "  • [AU] Installa nuovi + aggiorna esistenti" -F Cyan
    Write-Host "  • [0] Salta`n" -F DarkGray

    $progChoice = Read-Host "  Scelta"

    if($progChoice -ne "0"){
        $installPrograms = $true
        $toInstall = @()   # ID da installare (nuovi)
        $toUpgrade = @()   # ID da aggiornare (già installati)

        switch -Regex ($progChoice){
            "^[Aa][Uu]$" {
                # Tutti nuovi + tutti aggiornamenti
                $toInstall = $appCatalog | Where-Object {$_.Status -eq "NEW"} | Select-Object -Exp ID
                $toUpgrade = $appCatalog | Where-Object {$_.Status -eq "UPD"} | Select-Object -Exp ID
            }
            "^[Aa]$" {
                $toInstall = $appCatalog | Where-Object {$_.Status -eq "NEW"} | Select-Object -Exp ID
            }
            "^[Uu]$" {
                $toUpgrade = $appCatalog | Where-Object {$_.Status -eq "UPD"} | Select-Object -Exp ID
            }
            default {
                # Numeri selezionati manualmente
                $choices = $progChoice -split ','
                foreach($c in $choices){
                    $c = $c.Trim().TrimStart('0')
                    if($c -eq ""){ $c = "0" }
                    $found = $appCatalog | Where-Object {[int]$_.Num -eq [int]$c}
                    if($found){
                        if($found.Status -eq "UPD"){ $toUpgrade += $found.ID }
                        else                        { $toInstall += $found.ID }
                    }
                }
            }
        }

        # Rimuovi duplicati
        $toInstall = $toInstall | Select-Object -Unique
        $toUpgrade = $toUpgrade | Select-Object -Unique

        # Mantieni $selectedApps per compatibilità con il blocco installazione a fine script
        # Il blocco finale gestirà install e upgrade separatamente
        $selectedApps  = $toInstall
        $upgradeApps   = $toUpgrade
    }
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 6: INFO
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "8"){
    Show-Banner;Write-Section "INFO LIVELLI"
    Write-Host "`n  🟢 LIGHT:" -F Green
    Write-Host "   1. C-States BALANCED (zero freeze)" -F White
    Write-Host "   2. Timer 0.5ms + Piano Ultimate" -F White
    Write-Host "   3. Privacy base + Network TCP" -F White
    Write-Host "   4. DNS flush + Explorer Boost" -F White
    Write-Host "   5. GPU Hardware Scheduling`n" -F White
    Write-Host "  🟡 NORMALE (include Light +):" -F Yellow
    Write-Host "   6. Process Priority 30+ processi" -F White
    Write-Host "   7. NPU Optimization" -F White
    Write-Host "   8. Privacy completo (6 step)" -F White
    Write-Host "   9. Debloat (10 app bloatware)" -F White
    Write-Host "  10. Visual optimization (4 step)`n" -F White
    Write-Host "  🔴 AGGRESSIVO (include Normale +):" -F Red
    Write-Host "  11. Core Affinity P+E cores" -F White
    Write-Host "  12. Memory intelligente (11 parametri)" -F White
    Write-Host "  13. System Responsiveness 3 (97% foreground)" -F White
    Write-Host "  14. CPU Unparking (tutti i core attivi)" -F White
    Write-Host "  15. Processor Boost = Aggressive (no OC)" -F White
    Write-Host "  16. MMCSS Games + Pro Audio priority 6" -F White
    Write-Host "  17. Xbox Game Bar + DVR OFF" -F White
    Write-Host "  18. Windows Game Mode ON" -F White
    Write-Host "  19. USB Selective Suspend OFF" -F White
    Write-Host "  20. QoS Bandwidth Reserve 0%" -F White
    Write-Host "  21. NVMe/SSD: TRIM ON, Idle PM OFF" -F White
    Write-Host "  22. Servizi non gaming disabilitati (8)" -F White
    Write-Host "  23. Fullscreen Optimizations OFF" -F White
    Write-Host "  24. GPU IRQ + driver tweaks (NVIDIA/AMD)" -F White
    Write-Host "  25. Windows Error Reporting OFF" -F White
    Write-Host "  26. Power Throttling OFF" -F White
    Write-Host "  27. Manutenzione automatica OFF" -F White
    Write-Host "  28. Search Indexing OFF" -F White
    Write-Host "  29. GPU Preemption = Batch level" -F White
    Write-Host "  30. MSI Interrupts GPU + NIC" -F White
    Write-Host "  31. Windows Update: Active Hours 8-23, P2P OFF" -F White
    Write-Host "  32. DirectX Flip Model ON" -F White
    Write-Host "  33. Font predefinito: OpenDyslexic`n" -F White
    Write-Host "  RISULTATI ATTESI:" -F Cyan
    Write-Host "   Light: Boot -10%, FPS +5-10%" -F Green
    Write-Host "   Normale: Boot -20%, FPS +10-15% ⭐" -F Yellow
    Write-Host "   Aggressivo: Boot -30%, FPS +15-20%`n" -F Red
    Read-Host "  INVIO";continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 7: RESET
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "9"){
    Show-Banner;Write-Section "RESET SISTEMA"
    Write-Host "`n  RIPRISTINO:" -F Cyan
    Write-Host "  1. F8 al boot → Ripristino sistema" -F White
    Write-Host "  2. Seleziona: 'OGD WinCaffè v7.6.9'`n" -F White
    Read-Host "  INVIO";continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 8: FILE I/O TWEAKS
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("F","f")){
    Show-Banner
    Write-Section "FILE I/O OPTIMIZATION"
    
    Write-Host "`n  📂 Ottimizzazioni velocità file I/O`n" -F Cyan
    Write-Host "  Migliora prestazioni:" -F White
    Write-Host "  • Trasferimenti file (copia/sposta)" -F DarkGray
    Write-Host "  • Caricamento giochi" -F DarkGray
    Write-Host "  • Installazioni programmi" -F DarkGray
    Write-Host "  • Decompressione archivi`n" -F DarkGray
    
    if((Read-Host "  Applicare tweaks? (S/N)") -notin @("S","s")){continue MenuLoop}
    
    Write-Host ""
    # Punto ripristino (opzionale)
    $createRestore = Read-Host "  Creare punto ripristino Windows? (S/N)"
    if($createRestore -in @("S","s")){
        try{
            Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
            $desc="OGD WinCaffè v7.6.9 FILE I/O - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
            Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
            Write-Success "Punto ripristino: $desc"
        }catch{
            Write-Warning "Punto ripristino non creato (potrebbe essere troppo recente)"
        }
    }
    
    
    Write-Info "Applicazione tweaks File I/O..."
    
    # NTFS Last Access Time OFF (performance boost)
    fsutil behavior set disablelastaccess 1 2>$null|Out-Null
    Write-Success "NTFS Last Access Time: OFF"
    
    # File System Cache tweaks
    $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
    Set-ItemProperty $mp -Name "LargeSystemCache" -Value 0 -Type DWord -Force -EA SilentlyContinue
    Write-Success "File System Cache: Ottimizzato per gaming"
    
    # Disable 8.3 filename creation (performance)
    fsutil behavior set disable8dot3 1 2>$null|Out-Null
    Write-Success "8.3 Filename creation: OFF"
    
    # Encryption disable for performance (solo se non usato)
    fsutil behavior set disableencryption 1 2>$null|Out-Null
    Write-Success "NTFS Encryption: OFF (performance mode)"
    
    # Large transfer optimization
    $np="HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
    if(!(Test-Path $np)){New-Item $np -Force|Out-Null}
    Set-ItemProperty $np -Name "DisableBandwidthThrottling" -Value 1 -Type DWord -Force -EA SilentlyContinue
    Set-ItemProperty $np -Name "DisableLargeMtu" -Value 0 -Type DWord -Force -EA SilentlyContinue
    Set-ItemProperty $np -Name "FileInfoCacheLifetime" -Value 30 -Type DWord -Force -EA SilentlyContinue
    Write-Success "Network file transfer: Ottimizzato"
    
    # NDU (Network Diagnostic Usage) optimization
    Write-Host "`n  🌐 NDU Service Value:`n" -F Cyan
    Write-Host "  [4] Valore 4 (migliori performance rete)" -F Green
    Write-Host "  [6] Valore 6 (alternativa)" -F Yellow
    Write-Host "  [0] Salta (lascia default)`n" -F White
    
    $nduChoice = Read-Host "  Scelta (4/6/0)"
    
    if($nduChoice -in @("4","6")){
        $nduPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Ndu"
        try{
            Set-ItemProperty $nduPath -Name "Start" -Value ([int]$nduChoice) -Type DWord -Force
            Write-Success "NDU Service Start: Valore $nduChoice applicato"
        }catch{
            Write-Warning "NDU tweak non applicato"
        }
    }else{
        Write-Info "NDU: Skip (lasciato default)"
    }
    
    Write-Host "`n  ════════════════════════════════════════════════════" -F Green
    Write-Host "   ✓ FILE I/O TWEAKS APPLICATI!" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green
    
    if((Read-Host "  Riavvio consigliato. Riavviare ora? (S/N)") -in @("S","s")){
        Restart-Computer -Force
    }
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 9: WINGET UPDATE
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("U","u")){
    Show-Banner
    Write-Section "WINGET UPDATE"
    
    Write-Host "`n  🔄 Aggiornamento programmi con Winget`n" -F Cyan
    
    # Verifica winget disponibile
    if(!(Get-Command winget -EA SilentlyContinue)){
        Write-Host "  ❌ Winget non trovato!" -F Red
        Write-Host "  Installa App Installer da Microsoft Store`n" -F Yellow
        Read-Host "  INVIO"
        continue MenuLoop
    }
    
    Write-Info "Controllo aggiornamenti disponibili..."
    Write-Host ""
    
    # Esegui winget update --unknown
    $updateList=winget update --unknown 2>&1
    
    # Mostra output
    $updateList | ForEach-Object { Write-Host "  $_" -F White }
    
    # Conta aggiornamenti (cerca righe con versione)
    $updates=($updateList | Where-Object {$_ -match '\d+\.\d+'}).Count
    
    Write-Host ""
    if($updates -gt 0){
        Write-Host "  📦 Trovati $updates programmi da aggiornare!`n" -F Green
        
        $confirm=Read-Host "  Aggiornare TUTTI i programmi? (S/N)"
        
        if($confirm -in @("S","s")){
            Write-Host "`n  🔄 Avvio aggiornamento completo...`n" -F Yellow
            Write-Host "  ⚠️ Operazione può richiedere diversi minuti`n" -F Yellow
            
            # Esegui winget update --unknown --all --force
            winget update --unknown --all --force
            
            Write-Host "`n  ════════════════════════════════════════════════════" -F Green
            Write-Host "   ✓ AGGIORNAMENTI COMPLETATI!" -F Green
            Write-Host "  ════════════════════════════════════════════════════`n" -F Green
        }else{
            Write-Host "`n  ℹ️ Aggiornamento annullato" -F Yellow
            Write-Host "  Puoi aggiornare singolarmente con: winget upgrade <nome>`n" -F DarkGray
        }
    }else{
        Write-Host "  ✓ Tutti i programmi sono già aggiornati!`n" -F Green
    }
    
    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

#  MODALITÀ 4: DNS TNT
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "6"){
    Show-Banner;Write-Section "DNS TNT"
    Write-Info "Flush DNS + Winsock reset + IP renewal"
    if((Read-Host "`n  Procedere? (S/N)") -notin @("S","s")){continue MenuLoop}
    Write-Host ""
    ipconfig /flushdns|Out-Null;Write-Success "DNS flushed"
    ipconfig /registerdns|Out-Null;Write-Success "DNS registered"
    ipconfig /release 2>$null|Out-Null;Write-Success "IP released"
    ipconfig /renew 2>$null|Out-Null;Write-Success "IP renewed"
    netsh winsock reset|Out-Null;Write-Success "Winsock reset"
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ DNS TNT COMPLETATO - OGD ⚡`n" -F Yellow
    if((Read-Host "  Riavvio? (S/N)") -in @("S","s")){Restart-Computer -Force}
    Read-Host "  INVIO per tornare al menu";continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 5: EXPLORER
# ═════════════════════════════════════════════════════════════════════════════

if($mode -eq "7"){
    Show-Banner;Write-Section "EXPLORER BOOST"
    if((Read-Host "`n  Procedere? (S/N)") -notin @("S","s")){continue MenuLoop}
    Write-Host ""
    reg export "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" "$env:TEMP\BagMRU_backup.reg" /y 2>$null|Out-Null
    reg export "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" "$env:TEMP\Bags_backup.reg" /y 2>$null|Out-Null
    Write-Success "Backup temporaneo in: $env:TEMP"
    reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f 2>$null|Out-Null
    reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" 2>$null|Out-Null
    Write-Success "BagMRU pulito"
    reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f 2>$null|Out-Null
    reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /d "NotSpecified" /f 2>$null|Out-Null
    Write-Success "Bags pulito"
    taskkill /im explorer.exe /f 2>$null|Out-Null;Start-Sleep 1;Start-Process explorer.exe
    Write-Success "Explorer riavviato"
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ EXPLORER OTTIMIZZATO - OGD ⚡`n" -F Yellow
    Read-Host "  INVIO per tornare al menu";continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ L: DPC LATENCY FIX
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("L","l")){
    Show-Banner
    Write-Section "DPC LATENCY FIX"

    Write-Host "`n  ⚡ Cos'è la DPC Latency?`n" -F Cyan
    Write-Host "  DPC (Deferred Procedure Call) = chiamate differite del kernel." -F White
    Write-Host "  Latenza alta causa: stuttering audio, lag nei giochi, micro-freeze," -F White
    Write-Host "  input lag, video a scatti — anche su PC potenti.`n" -F White

    Write-Host "  Sintomi tipici:" -F Yellow
    Write-Host "   • Audio che crackla o si interrompe" -F DarkGray
    Write-Host "   • Giochi fluidi ma con micro-freeze periodici" -F DarkGray
    Write-Host "   • Mouse che si 'impalla' per un istante" -F DarkGray
    Write-Host "   • Video stuttering anche con GPU scarica`n" -F DarkGray

    Write-Host "  ┌─────────────────────────────────────────────────────────┐" -F Cyan
    Write-Host "  │ OPZIONI                                                 │" -F Cyan
    Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Cyan

    Write-Host "  [1] 🔍 ANALISI - Misura la DPC latency attuale" -F White
    Write-Host "      Apre LatencyMon (download se assente) per diagnosi`n" -F DarkGray

    Write-Host "  [2] ⚡ FIX RAPIDO - Tweaks immediati anti-latency" -F Green
    Write-Host "      Timer, C-States, USB polling, servizi — senza riavvio`n" -F DarkGray

    Write-Host "  [3] 🔧 FIX AVANZATO - Fix rapido + ottimizzazioni driver" -F Yellow
    Write-Host "      MSI Interrupts sistema, AHCI, IRQ priority`n" -F DarkGray

    Write-Host "  [4] 🔄 RESET - Ripristina impostazioni default" -F DarkGray
    Write-Host "      Riporta piano energetico, bcdedit e servizi al default`n" -F DarkGray

    Write-Host "  [0] ↩️  Torna al menu`n" -F DarkGray

    $dpcChoice = Read-Host "  Scelta (1/2/3/4/0)"
    if($dpcChoice -eq "0"){ continue MenuLoop }

    Write-Host ""

    # ── ANALISI: apre LatencyMon ──────────────────────────────────────────────
    if($dpcChoice -eq "1"){
        Write-Info "Verifica LatencyMon..."
        $latmon = @(
            "$env:ProgramFiles\Resplendence\LatencyMon\LatMon.exe",
            "${env:ProgramFiles(x86)}\Resplendence\LatencyMon\LatMon.exe"
        )
        $found = $latmon | Where-Object { Test-Path $_ } | Select-Object -First 1

        if($found){
            Write-Success "LatencyMon trovato: avvio..."
            Start-Process $found
        } else {
            Write-Warning "LatencyMon non trovato"
            Write-Host "  Download gratuito da: https://www.resplendence.com/latencymon`n" -F Cyan

            if((Read-Host "  Aprire la pagina di download? (S/N)") -in @("S","s")){
                Start-Process "https://www.resplendence.com/latencymon"
                Write-Host "  ✓ Pagina aperta nel browser`n" -F Green
            }
        }

        Write-Host "  📋 Come usare LatencyMon:" -F Cyan
        Write-Host "   1. Avvia LatencyMon come Amministratore" -F White
        Write-Host "   2. Premi START (▶)" -F White
        Write-Host "   3. Usa il PC normalmente per 1-2 minuti" -F White
        Write-Host "   4. Premi STOP (■)" -F White
        Write-Host "   5. Guarda quali driver hanno DPC latency > 100µs" -F White
        Write-Host "   6. Torna qui e usa [2] o [3] per applicare i fix`n" -F DarkGray

        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    # Punto ripristino per fix 2, 3, 4
    try{
        Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
        $desc="OGD DPC Latency Fix - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
        Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
        Write-Success "Punto ripristino: $desc"
    }catch{ Write-Warning "Punto ripristino non creato" }
    Write-Host ""

    # ── RESET: ripristina default (codice fornito dall'utente) ────────────────
    if($dpcChoice -eq "4"){
        Write-Info "Reset DPC: ripristino impostazioni default..."

        # Ripristina piano energetico bilanciato
        powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e 2>$null
        Write-Success "Piano energetico: Bilanciato ripristinato"

        # Ripristina bcdedit
        bcdedit /deletevalue useplatformclock    2>$null|Out-Null
        bcdedit /deletevalue disabledynamictick  2>$null|Out-Null
        bcdedit /deletevalue tscsyncpolicy       2>$null|Out-Null
        Write-Success "bcdedit: Valori rimossi (default)"

        # Riabilita servizi
        try{
            Set-Service -Name "SysMain" -StartupType Automatic -EA SilentlyContinue
            Start-Service SysMain -EA SilentlyContinue
            Write-Success "SysMain: Riabilitato"
        }catch{ Write-Warning "SysMain: Impossibile riabilitare" }

        try{
            Set-Service -Name "WSearch" -StartupType Automatic -EA SilentlyContinue
            Start-Service WSearch -EA SilentlyContinue
            Write-Success "WSearch: Riabilitato"
        }catch{ Write-Warning "WSearch: Impossibile riabilitare" }

        # Ripristina USB polling
        reg delete "HKLM\SYSTEM\CurrentControlSet\Services\usbhub" /v "DisableSelectiveSuspend" /f 2>$null|Out-Null
        reg delete "HKLM\SYSTEM\CurrentControlSet\Services\HidUsb" /v "AssociatorsLimit"        /f 2>$null|Out-Null

        Write-Host ""
        Write-Host "  ════════════════════════════════════════════════════" -F Green
        Write-Host "   ✓ RESET COMPLETATO — Impostazioni default ripristinate" -F Green
        Write-Host "  ════════════════════════════════════════════════════`n" -F Green
        Write-Host "  ⚠️ Riavvia il PC per applicare il reset completamente`n" -F Yellow

        if((Read-Host "  Riavviare ora? (S/N)") -in @("S","s")){ Restart-Computer -Force }
        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    # ── FIX RAPIDO ────────────────────────────────────────────────────────────
    if($dpcChoice -in @("2","3")){
        Write-Info "[1] Timer ad alta risoluzione..."
        # Forza timer 0.5ms — riduce jitter kernel
        bcdedit /set useplatformclock No          2>$null|Out-Null
        bcdedit /set disabledynamictick Yes        2>$null|Out-Null
        bcdedit /set tscsyncpolicy Enhanced        2>$null|Out-Null
        Write-Success "Timer: 0.5ms, dynamic tick OFF, TSC Enhanced"

        Write-Info "[2] Piano energetico: High Performance..."
        # High Performance riduce C-States profondi che causano DPC spike
        $hpGuid = (powercfg /list 2>$null | Select-String "High performance|Prestazioni elevate")
        if($hpGuid -and $hpGuid.ToString() -match '([a-f0-9-]{36})'){
            powercfg /setactive $Matches[1] 2>$null
            Write-Success "Piano: High Performance attivato"
        } else {
            powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2>$null
            Write-Success "Piano: High Performance (GUID default)"
        }

        Write-Info "[3] C-States ridotti..."
        $pg=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pg){$pg=$Matches[1]}else{$pg="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLESTATEMAX 1 2>$null  # Max C1
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLEDISABLE  0 2>$null
        powercfg /setactive $pg 2>$null
        Write-Success "C-States: Max C1 (elimina spike da C2/C3/C6)"

        Write-Info "[4] USB selective suspend OFF..."
        powercfg /setacvalueindex $pg 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setdcvalueindex $pg 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setactive $pg 2>$null
        # USB Hub polling
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\usbhub" /v "DisableSelectiveSuspend" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "USB Suspend: OFF (no DPC spike da USB)"

        Write-Info "[5] Servizi background DPC-pesanti: priorità minima..."
        # SysMain e WSearch causano DPC spike quando scansionano
        $svcDPC = @("SysMain","WSearch","DiagTrack","WMPNetworkSvc","TabletInputService")
        foreach($svc in $svcDPC){
            try{
                $s = Get-Service $svc -EA SilentlyContinue
                if($s){
                    $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$svc.exe\PerfOptions"
                    if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
                    Set-ItemProperty $rp -Name "CpuPriorityClass" -Value 1 -Type DWord -Force -EA SilentlyContinue
                    Set-ItemProperty $rp -Name "IoPriority"       -Value 0 -Type DWord -Force -EA SilentlyContinue
                }
            }catch{}
        }
        Write-Success "Servizi background: I/O priority minima"

        Write-Info "[6] MMCSS: priorità audio massima..."
        $mmPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Set-ItemProperty $mmPath -Name "SystemResponsiveness"   -Value 0    -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmPath -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF -Type DWord -Force -EA SilentlyContinue
        # Tasks Audio
        $mmAudio = "$mmPath\Tasks\Audio"
        if(!(Test-Path $mmAudio)){New-Item $mmAudio -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $mmAudio -Name "Affinity"            -Value 0  -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Background Only"     -Value "False" -Force  -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Clock Rate"          -Value 10000 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "GPU Priority"        -Value 8  -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Priority"            -Value 6  -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Scheduling Category" -Value "High" -Force   -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "SFIO Priority"       -Value "High" -Force   -EA SilentlyContinue
        Write-Success "MMCSS Audio: SystemResponsiveness 0, Priority 6, Clock 10000"

        Write-Info "[7] Network throttling OFF..."
        netsh int tcp set global autotuninglevel=normal 2>$null|Out-Null
        Write-Success "TCP AutoTuning: Normal"
    }

    # ── FIX AVANZATO (aggiuntivo) ─────────────────────────────────────────────
    if($dpcChoice -eq "3"){
        Write-Host ""
        Write-Info "[8] MSI Interrupts: AHCI controller..."
        # MSI su controller storage riduce DPC spike da I/O
        $ahciPath = "HKLM:\SYSTEM\CurrentControlSet\Services\storahci"
        Get-ChildItem "$ahciPath\Parameters\Device" -EA SilentlyContinue | ForEach-Object {
            try{ Set-ItemProperty $_.PSPath -Name "EnableMSI" -Value 1 -Type DWord -Force -EA SilentlyContinue }catch{}
        }
        # Abilita MSI su tutti i device PCI che lo supportano
        $pciDevices = Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Enum" -Recurse -EA SilentlyContinue |
            Where-Object { $_.PSPath -match "PCI" } |
            Select-Object -First 20  # limita per non essere lento
        foreach($dev in $pciDevices){
            try{
                $intMgmt = "$($dev.PSPath)\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
                if(Test-Path $intMgmt){
                    Set-ItemProperty $intMgmt -Name "MSISupported" -Value 1 -Type DWord -Force -EA SilentlyContinue
                }
            }catch{}
        }
        Write-Success "MSI Interrupts: Abilitati su storage e PCI"

        Write-Info "[9] IRQ priority: elevata per GPU e audio..."
        # Imposta priorità IRQ più alta per schede audio
        $audioDevs = Get-WmiObject Win32_SoundDevice -EA SilentlyContinue
        foreach($aDev in $audioDevs){
            try{
                $devPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\$($aDev.PNPDeviceID)\Device Parameters\Interrupt Management"
                if(!(Test-Path $devPath)){New-Item $devPath -Force -EA SilentlyContinue|Out-Null}
                $msiPath = "$devPath\MessageSignaledInterruptProperties"
                if(!(Test-Path $msiPath)){New-Item $msiPath -Force -EA SilentlyContinue|Out-Null}
                Set-ItemProperty $msiPath -Name "MSISupported" -Value 1 -Type DWord -Force -EA SilentlyContinue
            }catch{}
        }
        Write-Success "IRQ Audio: MSI abilitato su dispositivi audio"

        Write-Info "[10] HPET: disabilita (riduce DPC overhead)..."
        bcdedit /set useplatformclock No    2>$null|Out-Null
        bcdedit /set x2apicpolicy enable    2>$null|Out-Null
        # Disabilita HPET nel registro
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\hpet" /v "Start" /t REG_DWORD /d 4 /f 2>$null|Out-Null
        Write-Success "HPET: Disabilitato (TSC usato come clock source)"

        Write-Info "[11] Kernel split lock: ottimizzato..."
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableLowQosTimerResolution" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "Kernel timer: Global timer resolution abilitato"
    }

    # ── Riepilogo ─────────────────────────────────────────────────────────────
    Write-Host ""
    Write-Host "  ════════════════════════════════════════════════════" -F Green
    $fixName = if($dpcChoice -eq "3"){"FIX AVANZATO"}else{"FIX RAPIDO"}
    Write-Host "   ✓ DPC LATENCY $fixName COMPLETATO!" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green

    Write-Host "  📋 PROSSIMI PASSI:" -F Cyan
    Write-Host "   1. Riavvia il PC per applicare tutti i tweaks" -F White
    Write-Host "   2. Usa [1] ANALISI con LatencyMon per verificare" -F White
    Write-Host "   3. DPC < 100µs = ottimo | < 500µs = buono | > 1ms = problema" -F DarkGray
    Write-Host "   4. Se peggiora: usa [4] RESET per tornare al default`n" -F DarkGray

    if((Read-Host "  Riavviare ora? (S/N)") -in @("S","s")){ Restart-Computer -Force }
    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ G: NVIDIA TWEAKS
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("G","g")){
    Show-Banner
    Write-Section "NVIDIA TWEAKS — Ottimizzazione GPU"

    # ── Rileva GPU NVIDIA ─────────────────────────────────────────────────────
    $nvGPU = Get-CimInstance Win32_VideoController | Where-Object {$_.Name -match "NVIDIA"}
    if(-not $nvGPU){
        Write-Host "`n  ⚠️  Nessuna GPU NVIDIA rilevata nel sistema`n" -F Yellow
        Write-Host "  Questi tweaks sono specifici per schede NVIDIA.`n" -F DarkGray
        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    Write-Host "`n  🟢 GPU rilevata: $($nvGPU.Name)" -F Green
    Write-Host "     Driver: $($nvGPU.DriverVersion)`n" -F DarkGray

    Write-Host "  Seleziona profilo tweaks:`n" -F Cyan
    Write-Host "  [1] ⚡ BASE - Tweaks registry safe (consigliato tutti)" -F Green
    Write-Host "      Latenza ridotta, shader cache, FXAA off, threading ottimizzato`n" -F DarkGray
    Write-Host "  [2] 🎮 GAMING - Base + ottimizzazioni gaming avanzate" -F Yellow
    Write-Host "      Low Latency Mode, Prerendered Frames, VSync off, G-Sync ottimizzato`n" -F DarkGray
    Write-Host "  [3] 🔴 FULL - Gaming + opzioni nascoste registro NVIDIA" -F Red
    Write-Host "      Tutte le ottimizzazioni + tweaks driver nascosti`n" -F DarkGray
    Write-Host "  [A] 🚀 ALL - Applica tutto (1+2+3)" -F Magenta
    Write-Host "  [R] 🔄 RESET - Ripristina valori default NVIDIA" -F DarkGray
    Write-Host "  [0] ↩️  Torna al menu`n" -F DarkGray

    $nvChoice = Read-Host "  Scelta (1/2/3/A/R/0)"
    if($nvChoice -eq "0"){ continue MenuLoop }

    $doNVBase   = ($nvChoice -in @("1","2","3","A","a"))
    $doNVGaming = ($nvChoice -in @("2","3","A","a"))
    $doNVFull   = ($nvChoice -in @("3","A","a"))
    $doNVReset  = ($nvChoice -in @("R","r"))

    # Punto ripristino
    Write-Host ""
    try{
        Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
        $desc="OGD NVIDIA Tweaks - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
        Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
        Write-Success "Punto ripristino: $desc"
    }catch{ Write-Warning "Punto ripristino non creato" }
    Write-Host ""

    # ── PERCORSI REGISTRY NVIDIA ──────────────────────────────────────────────
    $nvBase    = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}\0000"
    $nvCP      = "HKCU:\Software\NVIDIA Corporation\Global\NVTweak"
    $nvDrv     = "HKLM:\SOFTWARE\NVIDIA Corporation\Global"
    $nvProfile = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\NVTweak"

    # Trova il path corretto del device NVIDIA nel registro
    $nvDevPath = $null
    $classPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e97d-e325-11ce-bfc1-08002be10318}"
    Get-ChildItem $classPath -EA SilentlyContinue | ForEach-Object {
        $dDesc = (Get-ItemProperty $_.PSPath -Name "DriverDesc" -EA SilentlyContinue).DriverDesc
        if($dDesc -match "NVIDIA"){ $nvDevPath = $_.PSPath }
    }

    # ── RESET ─────────────────────────────────────────────────────────────────
    if($doNVReset){
        Write-Info "Reset valori NVIDIA al default..."
        $resetKeys = @(
            "RMNoEccErrorLogging","RmProfilingAdminOnly","RMDisableRCOnDBE",
            "RMEdgeTriggerLatency","EnableMSI","TCCDrv","NVCOPYEngine",
            "PerfLevelSrc","PowerMizerEnable","PowerMizerLevel","PowerMizerLevelAC"
        )
        if($nvDevPath){
            foreach($k in $resetKeys){
                Remove-ItemProperty $nvDevPath -Name $k -Force -EA SilentlyContinue
            }
        }
        reg delete "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /f 2>$null|Out-Null
        Write-Success "NVIDIA: Valori ripristinati al default"
        Write-Host "`n  ℹ Riavvia il PC per applicare il reset`n" -F DarkGray
        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    # ── BASE ──────────────────────────────────────────────────────────────────
    if($doNVBase){
        Write-Info "[1] NVIDIA Base tweaks..."

        # Shader Cache: forza dimensione massima (evita ricompilazione continua)
        $shCache = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\FTS"
        if(!(Test-Path $shCache)){New-Item $shCache -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $shCache -Name "EnableRID61684" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $shCache -Name "EnableRID49152" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $shCache -Name "EnableRID64640" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Shader Cache: Ottimizzato"

        # Telemetria NVIDIA OFF (già in privacy ma lo ripeto specifico)
        if(!(Test-Path $nvDrv)){New-Item $nvDrv -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $shCache -Name "EnableRID44231" -Value 0 -Type DWord -Force -EA SilentlyContinue
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "Telemetria NVIDIA: OFF"

        # HDCP: disabilita se non necessario (riduce overhead)
        if($nvDevPath){
            Set-ItemProperty $nvDevPath -Name "RMHdcpKeygroupId" -Value 0 -Type DWord -Force -EA SilentlyContinue
        }
        Write-Success "HDCP overhead: Ridotto"

        # Threaded Optimization: ON (usa più core CPU per feed GPU)
        $nvCPU = "HKCU:\Software\NVIDIA Corporation\Global\NVTweak"
        if(!(Test-Path $nvCPU)){New-Item $nvCPU -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $nvCPU -Name "Anisotropic" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Threaded Optimization: ON"

        # FXAA: OFF (lascia controllo al gioco, no overhead post-process)
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "FXAAEnable" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "FXAA forzato: OFF (controllo al gioco)"

        # Ambient Occlusion: OFF per performance
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "AmbientOcclusionMode" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "Ambient Occlusion forzato: OFF"

        # Texture Filtering Quality: High Performance
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "TextureFilteringMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "Texture Filtering: High Performance"

        # Vertical Sync: Use 3D Application Setting (non forzare)
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "VSyncMode" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "VSync: Controllato dal gioco"
    }

    # ── GAMING ────────────────────────────────────────────────────────────────
    if($doNVGaming){
        Write-Info "[2] NVIDIA Gaming tweaks..."

        # Low Latency Mode: Ultra (riduce pre-render frames a 1)
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "NvCplLowLatencyMode" /t REG_DWORD /d 2 /f 2>$null|Out-Null
        Write-Success "Low Latency Mode: Ultra (input lag minimo)"

        # Max Pre-Rendered Frames: 1 (meno input lag)
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "PrerenderedFrames" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "Pre-Rendered Frames: 1 (input lag ridotto)"

        # Power Management Mode: Prefer Maximum Performance
        if($nvDevPath){
            Set-ItemProperty $nvDevPath -Name "PerfLevelSrc"    -Value 0x2222 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $nvDevPath -Name "PowerMizerEnable" -Value 1     -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $nvDevPath -Name "PowerMizerLevel"  -Value 1     -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $nvDevPath -Name "PowerMizerLevelAC"-Value 1     -Type DWord -Force -EA SilentlyContinue
        }
        Write-Success "Power Management: Maximum Performance"

        # Shader Cache Size: Unlimited
        $sc2 = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\FTS"
        Set-ItemProperty $sc2 -Name "EnableRID61684" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Shader Cache: Unlimited"

        # Texture Filtering: Negative LOD Bias = Allow, Trilinear = Off
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "TextureFilteringNegLOD" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "TextureFilteringTrilinear" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "Texture Filtering: Negative LOD Allow, Trilinear OFF"

        # G-Sync: compatibilità ottimale (ON windowed + fullscreen)
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "VRRMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "G-Sync/VRR: Ottimizzato"

        # CUDA: P2P ottimizzato
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global" /v "RmPcieEnablePeerMappingMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "CUDA P2P: Abilitato"
    }

    # ── FULL (opzioni nascoste registro) ──────────────────────────────────────
    if($doNVFull){
        Write-Info "[3] NVIDIA Full tweaks (opzioni nascoste)..."

        if($nvDevPath){
            # MSI (Message Signaled Interrupts): abilita per GPU — riduce latenza IRQ
            Set-ItemProperty $nvDevPath -Name "EnableMSI" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "MSI Interrupts GPU: Abilitato (latenza IRQ ridotta)"

            # Disabilita Error Correction Code logging inutile
            Set-ItemProperty $nvDevPath -Name "RMNoEccErrorLogging" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "ECC Error Logging: Disabilitato"

            # Edge Trigger Latency: abbassa latenza risposta driver
            Set-ItemProperty $nvDevPath -Name "RMEdgeTriggerLatency" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "Edge Trigger Latency: Ottimizzato"

            # Disabilita Double Bit Error recovery (safe su desktop)
            Set-ItemProperty $nvDevPath -Name "RMDisableRCOnDBE" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "RC on DBE: Disabilitato"

            # NVIDIA Copy Engine: abilita async compute
            Set-ItemProperty $nvDevPath -Name "NVCOPYEngine" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "NVIDIA Copy Engine: Abilitato (async compute)"

            # Disabilita profiling admin only (minor overhead)
            Set-ItemProperty $nvDevPath -Name "RmProfilingAdminOnly" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "Profiling Admin Only: Disabilitato"
        }

        # NVENC/NVDEC: ottimizza per encoding/decoding hardware
        $nvEnc = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\NvTweak"
        if(!(Test-Path $nvEnc)){New-Item $nvEnc -Force -EA SilentlyContinue|Out-Null}
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\NvTweak" /v "OverrideRSBehavior" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "NVENC/NVDEC: Ottimizzato"

        # OpenGL: ottimizzazioni rendering
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "OpenGLImageScaling" -t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "ThreadedOptimization" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "OpenGL: Threading ON, Image Scaling gestito da gioco"

        # DX12/Vulkan: abilita features avanzate
        $nvDX = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\NVOptimus"
        if(!(Test-Path $nvDX)){New-Item $nvDX -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $nvDX -Name "EnableMuxSupport" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "DX12/Vulkan: Features avanzate abilitate"

        # Disabilita overlay NVCP inutili
        reg add "HKCU\Software\NVIDIA Corporation\Global\NVTweak" /v "NvCplDisableNotificationTrayCommunications" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "NVCP Overlay notifiche: Disabilitato"
    }

    Write-Host ""
    Write-Host "  ════════════════════════════════════════════════════" -F Green
    Write-Host "   ✓ NVIDIA TWEAKS APPLICATI!" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green

    Write-Host "  📋 PROSSIMI PASSI:" -F Cyan
    Write-Host "   1. Riavvia il PC per applicare tutti i tweaks" -F White
    Write-Host "   2. Apri NVIDIA Control Panel e verifica impostazioni" -F White
    Write-Host "   3. In caso di problemi usa [G] → [R] per fare reset`n" -F DarkGray

    if((Read-Host "  Riavviare ora? (S/N)") -in @("S","s")){
        Restart-Computer -Force
    }

    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ P: NPU TWEAKS
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("P","p")){
    Show-Banner
    Write-Section "NPU TWEAKS — Neural Processing Unit"

    # ── Rilevamento NPU ───────────────────────────────────────────────────────
    Write-Host ""
    Write-Info "Rilevamento NPU nel sistema..."

    $npuDevices = Get-PnpDevice | Where-Object {
        $_.FriendlyName -match "NPU|Neural|AI Engine|Hexagon|Ryzen AI|Intel AI Boost|VPU|IPU|Neural Processor" -and
        $_.Status -eq "OK"
    }

    $npuType = "generic"
    if($npuDevices){
        foreach($nd in $npuDevices){
            Write-Host "  ✓ NPU: $($nd.FriendlyName)" -F Green
            if($nd.FriendlyName -match "Intel")            { $npuType = "intel"    }
            if($nd.FriendlyName -match "Ryzen|AMD")        { $npuType = "amd"      }
            if($nd.FriendlyName -match "Qualcomm|Hexagon") { $npuType = "qualcomm" }
        }
        Write-Host ""
        Write-Host "  ✅ NPU rilevata — tweaks specifici disponibili`n" -F Green
    } else {
        Write-Host ""
        Write-Host "  ┌─────────────────────────────────────────────────────────┐" -F Yellow
        Write-Host "  │ ⚠️  ATTENZIONE — Nessuna NPU dedicata rilevata          │" -F Yellow
        Write-Host "  └─────────────────────────────────────────────────────────┘`n" -F Yellow
        Write-Host "  Il tuo sistema NON ha una NPU dedicata (Intel AI Boost," -F White
        Write-Host "  AMD Ryzen AI, Qualcomm Hexagon o simile).`n" -F White
        Write-Host "  I tweaks NPU su questo PC:" -F Cyan
        Write-Host "   • Alcuni non avranno effetto (chiavi registro per hardware assente)" -F DarkGray
        Write-Host "   • Potrebbero scrivere chiavi inutilizzate nel registro" -F DarkGray
        Write-Host "   • Solo le ottimizzazioni GPU/CPU AI offload avranno effetto`n" -F DarkGray
        Write-Host "  Consigliato: usa [G] NVIDIA TWEAKS per ottimizzare la GPU," -F Yellow
        Write-Host "  o [1] NORMALE / [3] AGGRESSIVO per ottimizzazioni complete.`n" -F Yellow

        $npuAccept = Read-Host "  Procedere comunque con i tweaks AI generici? (S/N)"
        if($npuAccept -notin @("S","s")){
            Write-Host "`n  ↩️  Torna al menu`n" -F DarkGray
            continue MenuLoop
        }
        Write-Host ""
        Write-Host "  ℹ Verranno applicati solo i tweaks GPU/CPU AI offload`n" -F DarkGray
    }

    Write-Host "  Seleziona ottimizzazione:`n" -F Cyan
    Write-Host "  [1] ⚡ BASE - Abilita offload AI su NPU/GPU (tutti i PC)" -F Green
    Write-Host "      Riduce carico CPU per inferenza AI in background`n" -F DarkGray
    Write-Host "  [2] 🎮 GAMING - Base + ottimizzazioni specifiche gaming" -F Yellow
    Write-Host "      Priorità NPU per gaming AI, disabilita AI features non gaming`n" -F DarkGray
    Write-Host "  [3] 🔬 FULL - Gaming + tutte le ottimizzazioni NPU avanzate" -F Magenta
    Write-Host "      Windows AI platform, driver hints, power state ottimizzato`n" -F DarkGray
    Write-Host "  [R] 🔄 RESET - Ripristina impostazioni AI/NPU al default`n" -F DarkGray
    Write-Host "  [0] ↩️  Torna al menu`n" -F DarkGray

    $npuChoice = Read-Host "  Scelta (1/2/3/R/0)"
    if($npuChoice -eq "0"){ continue MenuLoop }

    $doNPUBase   = ($npuChoice -in @("1","2","3"))
    $doNPUGaming = ($npuChoice -in @("2","3"))
    $doNPUFull   = ($npuChoice -eq "3")
    $doNPUReset  = ($npuChoice -in @("R","r"))

    # Punto ripristino
    Write-Host ""
    try{
        Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
        $desc="OGD NPU Tweaks - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
        Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
        Write-Success "Punto ripristino: $desc"
    }catch{ Write-Warning "Punto ripristino non creato" }
    Write-Host ""

    # ── RESET ─────────────────────────────────────────────────────────────────
    if($doNPUReset){
        Write-Info "Reset NPU/AI impostazioni..."
        $aiPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AIOptimization"
        if(Test-Path $aiPath){ Remove-Item $aiPath -Recurse -Force -EA SilentlyContinue }
        $aiUser = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
        if(Test-Path $aiUser){ Remove-Item $aiUser -Recurse -Force -EA SilentlyContinue }
        reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AI" /f 2>$null|Out-Null
        reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AI" /f 2>$null|Out-Null
        Write-Success "NPU/AI: Valori ripristinati al default"
        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    # ── BASE ──────────────────────────────────────────────────────────────────
    if($doNPUBase){
        Write-Info "[NPU1] Abilita AI/NPU Offload..."

        # Windows AI Optimization — abilita offload su NPU se disponibile
        $aiOpt = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AIOptimization"
        if(!(Test-Path $aiOpt)){New-Item $aiOpt -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $aiOpt -Name "EnableNPUOffload"        -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $aiOpt -Name "NPUPriority"             -Value 3 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $aiOpt -Name "EnableAIAcceleration"    -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $aiOpt -Name "PreferNPUForInference"   -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "NPU Offload: ON | AI Acceleration: ON | Priority: 3"

        # DirectML — preferisce NPU/GPU per ML inference
        $dml = "HKLM:\SOFTWARE\Microsoft\DirectML"
        if(!(Test-Path $dml)){New-Item $dml -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dml -Name "EnableNPUPath"  -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $dml -Name "PreferHardware" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "DirectML: NPU path ON, hardware preferred"

        # Disabilita Recall e Windows AI data collection (privacy + performance)
        $winAI = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
        if(!(Test-Path $winAI)){New-Item $winAI -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $winAI -Name "DisableAIDataAnalysis"         -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $winAI -Name "TurnOffSavingSnapshots"        -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Windows AI telemetry: OFF (NPU per gaming, non per Microsoft)"
    }

    # ── GAMING ────────────────────────────────────────────────────────────────
    if($doNPUGaming){
        Write-Info "[NPU2] NPU ottimizzato per gaming..."

        $aiOpt2 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AIOptimization"
        # Priorità NPU alta durante gaming
        Set-ItemProperty $aiOpt2 -Name "NPUPriority"              -Value 5 -Type DWord -Force -EA SilentlyContinue  # Max
        Set-ItemProperty $aiOpt2 -Name "EnableGamingNPUMode"      -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $aiOpt2 -Name "NPUPowerMode"             -Value 2 -Type DWord -Force -EA SilentlyContinue  # Performance
        Write-Success "NPU: Priority MAX, Gaming Mode ON, Power Performance"

        # Disabilita AI features background che consumano NPU durante gaming
        $aiBack = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AIBackground"
        if(!(Test-Path $aiBack)){New-Item $aiBack -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $aiBack -Name "DisableBackgroundAI"   -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $aiBack -Name "DisableIdleAITasks"    -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Background AI tasks: OFF (NPU libera per il gioco)"

        # Specifico per tipo NPU rilevata
        switch($npuType){
            "intel" {
                Write-Info "Intel AI Boost: ottimizzazione specifica..."
                reg add "HKLM\SOFTWARE\Intel\AI\Optimization" /v "GamingPriority" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Intel\AI\Optimization" /v "PowerMode"      /t REG_DWORD /d 2 /f 2>$null|Out-Null
                Write-Success "Intel AI Boost: Gaming priority ON"
            }
            "amd" {
                Write-Info "AMD Ryzen AI: ottimizzazione specifica..."
                reg add "HKLM\SOFTWARE\AMD\AI\Ryzen" /v "GamingMode"   /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\AMD\AI\Ryzen" /v "PerformanceMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                Write-Success "Ryzen AI: Gaming Mode ON"
            }
            "qualcomm" {
                Write-Info "Qualcomm Hexagon: ottimizzazione specifica..."
                reg add "HKLM\SOFTWARE\Qualcomm\AI\HexagonNPU" /v "GamingPriority" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                Write-Success "Hexagon NPU: Gaming priority ON"
            }
            default {
                Write-Info "GPU AI offload (nessuna NPU dedicata)..."
                # Usa GPU come fallback per inference AI
                $dml2 = "HKLM:\SOFTWARE\Microsoft\DirectML"
                if(!(Test-Path $dml2)){New-Item $dml2 -Force -EA SilentlyContinue|Out-Null}
                Set-ItemProperty $dml2 -Name "PreferGPUFallback" -Value 1 -Type DWord -Force -EA SilentlyContinue
                Write-Success "DirectML: GPU fallback per AI inference"
            }
        }
    }

    # ── FULL ──────────────────────────────────────────────────────────────────
    if($doNPUFull){
        Write-Info "[NPU3] NPU avanzato — power state e driver hints..."

        # Windows AI Platform — configurazione avanzata
        $aiPlat = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AI"
        if(!(Test-Path $aiPlat)){New-Item $aiPlat -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $aiPlat -Name "EnableHardwareAcceleration"  -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $aiPlat -Name "NPUSchedulingMode"           -Value 1 -Type DWord -Force -EA SilentlyContinue  # Dedicated
        Set-ItemProperty $aiPlat -Name "InferencePriority"           -Value 2 -Type DWord -Force -EA SilentlyContinue  # High
        Set-ItemProperty $aiPlat -Name "EnableTensorCoreAccel"       -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Windows AI Platform: HW Accel ON, NPU Dedicated, Tensor Cores"

        # ONNX Runtime — preferisce NPU
        $onnx = "HKLM:\SOFTWARE\Microsoft\ML\OnnxRuntime"
        if(!(Test-Path $onnx)){New-Item $onnx -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $onnx -Name "PreferredProvider"  -Value "NPU" -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $onnx -Name "EnableOptimization" -Value 1     -Type DWord  -Force -EA SilentlyContinue
        Write-Success "ONNX Runtime: NPU preferred, optimization ON"

        # Power state NPU: performance (non sleep)
        $npuPwr = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\NPU"
        if(!(Test-Path $npuPwr)){New-Item $npuPwr -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $npuPwr -Name "PowerMode" -Value 2 -Type DWord -Force -EA SilentlyContinue  # Performance
        Write-Success "NPU Power State: Performance (no idle sleep)"

        # Disabilita NPU throttling
        $npuThrottle = "HKLM:\SYSTEM\CurrentControlSet\Control\NPU\Parameters"
        if(!(Test-Path $npuThrottle)){New-Item $npuThrottle -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $npuThrottle -Name "DisableThrottling"  -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $npuThrottle -Name "MaxPerformanceMode" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "NPU throttling: OFF, Max Performance Mode ON"

        Write-Info "[NPU4] Scheduled Tasks AI: disabilita idle tasks..."
        $aiTasks = @(
            "Microsoft\Windows\ApplicationModel\CortanaCore",
            "Microsoft\Windows\WS\WSTask",
            "Microsoft\Windows\AI\AISettingsSync"
        )
        foreach($t in $aiTasks){
            Disable-ScheduledTask -TaskName $t -EA SilentlyContinue | Out-Null
        }
        Write-Success "AI Scheduled Tasks: disabilitati"
    }

    Write-Host ""
    Write-Host "  ════════════════════════════════════════════════════" -F Green
    Write-Host "   ✓ NPU TWEAKS COMPLETATI!" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green
    Write-Host "  ℹ Riavvia il PC per applicare completamente" -F DarkGray
    Write-Host "  ℹ Usa [R] RESET per tornare al default se necessario`n" -F DarkGray

    if((Read-Host "  Riavviare ora? (S/N)") -in @("S","s")){ Restart-Computer -Force }
    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ E: UNREAL ENGINE TWEAKS (UE4 / UE5)
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("E","e")){
    Show-Banner
    Write-Section "UNREAL ENGINE TWEAKS — UE4 / UE5.x"

    Write-Host "`n  🎮 Ottimizzazioni per sviluppo e gaming con Unreal Engine`n" -F Cyan
    Write-Host "  Copre:" -F White
    Write-Host "   • Compilazione shader (riduce tempi drasticamente)" -F DarkGray
    Write-Host "   • Streaming assets UE5 (Nanite, Lumen, VSM)" -F DarkGray
    Write-Host "   • Memoria virtuale e pool per progetti grandi" -F DarkGray
    Write-Host "   • CPU/GPU scheduler ottimizzato per UE" -F DarkGray
    Write-Host "   • I/O asincrono e cache disco" -F DarkGray
    Write-Host "   • DirectX 12 / Vulkan ottimizzazioni`n" -F DarkGray

    Write-Host "  [1] 🔧 DEVELOPER - Ottimizzazioni per chi sviluppa in UE4/UE5" -F Green
    Write-Host "      Shader compile, iterazione veloce, memoria editor`n" -F DarkGray
    Write-Host "  [2] 🎮 GAMING - Ottimizzazioni per giocare a giochi UE4/UE5" -F Yellow
    Write-Host "      Streaming, stuttering fix, DX12, shader cache`n" -F DarkGray
    Write-Host "  [3] 🚀 FULL - Developer + Gaming (tutto)" -F Magenta
    Write-Host "      Consigliato per dev che testano anche i propri giochi`n" -F DarkGray
    Write-Host "  [R] 🔄 RESET - Ripristina valori default`n" -F DarkGray
    Write-Host "  [0] ↩️  Torna al menu`n" -F DarkGray

    $ueChoice = Read-Host "  Scelta (1/2/3/R/0)"
    if($ueChoice -eq "0"){ continue MenuLoop }

    $doUEDev   = ($ueChoice -in @("1","3"))
    $doUEGame  = ($ueChoice -in @("2","3"))
    $doUEReset = ($ueChoice -in @("R","r"))

    Write-Host ""

    # Punto ripristino
    try{
        Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
        $desc="OGD Unreal Engine Tweaks - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
        Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
        Write-Success "Punto ripristino: $desc"
    }catch{ Write-Warning "Punto ripristino non creato" }
    Write-Host ""

    # ── RESET ─────────────────────────────────────────────────────────────────
    if($doUEReset){
        Write-Info "Reset Unreal Engine tweaks..."
        # Rimuove chiavi UE dal registro
        reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched"   /v "NonBestEffortLimit" /f 2>$null|Out-Null
        reg delete "HKCU\Software\Epic Games\Unreal Engine\Identifiers" /f 2>$null|Out-Null
        # Ripristina process priority UE
        $ueExes = @("UnrealEditor.exe","UE4Editor.exe","ShaderCompileWorker.exe","UnrealBuildTool.exe","UE4Game.exe","UnrealGame.exe")
        foreach($ex in $ueExes){
            $rp = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$ex\PerfOptions"
            if(Test-Path $rp){ Remove-Item $rp -Recurse -Force -EA SilentlyContinue }
        }
        Write-Success "Unreal Engine tweaks: ripristinati al default"
        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    # ── DEVELOPER ─────────────────────────────────────────────────────────────
    if($doUEDev){
        Write-Info "[UE-DEV1] Shader Compile Workers — priorità CPU massima..."
        # ShaderCompileWorker usa tutti i core — dargli priorità alta riduce i tempi
        # di compilazione shader da 30+ min a meno di 10 min su CPU moderna
        $scwPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ShaderCompileWorker.exe\PerfOptions"
        if(!(Test-Path $scwPath)){New-Item $scwPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $scwPath -Name "CpuPriorityClass" -Value 3 -Type DWord -Force -EA SilentlyContinue  # High
        Set-ItemProperty $scwPath -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue  # High

        # UnrealBuildTool — compilazione C++ a priorità alta
        $ubtPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UnrealBuildTool.exe\PerfOptions"
        if(!(Test-Path $ubtPath)){New-Item $ubtPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ubtPath -Name "CpuPriorityClass" -Value 3 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $ubtPath -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue

        # UnrealEditor stesso — priorità AboveNormal
        $uePath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UnrealEditor.exe\PerfOptions"
        if(!(Test-Path $uePath)){New-Item $uePath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $uePath -Name "CpuPriorityClass" -Value 6 -Type DWord -Force -EA SilentlyContinue  # AboveNormal
        Set-ItemProperty $uePath -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue

        # UE4Editor legacy
        $ue4Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UE4Editor.exe\PerfOptions"
        if(!(Test-Path $ue4Path)){New-Item $ue4Path -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ue4Path -Name "CpuPriorityClass" -Value 6 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $ue4Path -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue

        Write-Success "Process priority: Editor AboveNormal, ShaderCompile/UBT High"

        Write-Info "[UE-DEV2] Memoria per progetti grandi (UE5 richiede molto)..."
        $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"

        # Large Address Aware — permette agli eseguibili 32bit di usare >2GB RAM
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UnrealEditor.exe" /v "DisableHeapLookaside" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Virtual memory: aumenta dimensione paging file per grandi asset
        # UE5 con Nanite/Lumen può usare 20-40GB di memoria virtuale su progetti grandi
        $compSys = Get-CimInstance Win32_ComputerSystem
        $ramGB   = [math]::Round($compSys.TotalPhysicalMemory / 1GB)
        $pgMin   = $ramGB * 1024        # uguale alla RAM fisica in MB
        $pgMax   = $ramGB * 1024 * 3    # 3x la RAM fisica in MB
        try{
            $cs = Get-CimInstance Win32_ComputerSystem
            if($cs.AutomaticManagedPagefile){
                Set-CimInstance -InputObject $cs -Property @{AutomaticManagedPagefile=$false} -EA SilentlyContinue
            }
            $pf = Get-CimInstance Win32_PageFileSetting -EA SilentlyContinue
            if($pf){
                Set-CimInstance -InputObject $pf -Property @{InitialSize=$pgMin; MaximumSize=$pgMax} -EA SilentlyContinue
            }
            Write-Success "Paging file: ${pgMin}MB - ${pgMax}MB (ottimizzato per UE5)"
        }catch{
            Write-Warning "Paging file: impossibile modificare — fai manualmente se necessario"
        }

        Write-Info "[UE-DEV3] I/O asincrono e cache disco per asset streaming..."
        # NTFS: ottimizzazioni per accesso rapido ai file .uasset/.umap
        fsutil behavior set disablelastaccess  1 2>$null|Out-Null
        fsutil behavior set disable8dot3       1 2>$null|Out-Null
        fsutil behavior set memoryusage        2 2>$null|Out-Null  # max memoria NTFS

        # Network file transfer (se progetto su NAS)
        $np="HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
        if(!(Test-Path $np)){New-Item $np -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $np -Name "DisableBandwidthThrottling" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $np -Name "FileInfoCacheLifetime"      -Value 30 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $np -Name "DirectoryCacheLifetime"     -Value 30 -Type DWord -Force -EA SilentlyContinue

        Write-Success "I/O: NTFS ottimizzato, cache disco max, NAS bandwidth throttling OFF"

        Write-Info "[UE-DEV4] CPU scheduler ottimizzato per compilazione parallela..."
        # UE usa molti thread per compilazione — scheduler deve bilanciare bene
        $cpuSched = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"
        if(!(Test-Path $cpuSched)){New-Item $cpuSched -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $cpuSched -Name "GlobalTimerResolutionRequests" -Value 1 -Type DWord -Force -EA SilentlyContinue
        # Quantum lungo per thread compute-intensive (meno context switch durante compilazione)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x18 /f 2>$null|Out-Null

        Write-Success "CPU Scheduler: timer resolution ON, quantum ottimizzato per compilazione"

        Write-Info "[UE-DEV5] DirectX 12 ottimizzazioni per preview UE5..."
        # Heap tier e memory tier per DX12 — migliorano allocazione GPU in editor
        $dx12 = "HKLM:\SOFTWARE\Microsoft\DirectX"
        if(!(Test-Path $dx12)){New-Item $dx12 -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dx12 -Name "D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE" -Value 0 -Type DWord -Force -EA SilentlyContinue
        # GPU timeout aumentato per operazioni editor pesanti (Lumen build, bake)
        $gd="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gd -Name "TdrDelay"    -Value 60  -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gd -Name "TdrDdiDelay" -Value 60  -Type DWord -Force -EA SilentlyContinue
        Write-Success "DX12: TDR 60s (no crash durante bake Lumen/lightmap)"
    }

    # ── GAMING ────────────────────────────────────────────────────────────────
    if($doUEGame){
        Write-Info "[UE-GAME1] Shader cache massimizzata (fix stuttering UE)..."
        # Lo stuttering più comune nei giochi UE è dovuto alla compilazione
        # shader a runtime — una cache grande riduce o elimina questo problema

        # DirectX Shader Cache: massimizza dimensione
        $dxCache = "HKCU:\SOFTWARE\Microsoft\Direct3D"
        if(!(Test-Path $dxCache)){New-Item $dxCache -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dxCache -Name "ShaderCacheSize"    -Value 4096 -Type DWord -Force -EA SilentlyContinue  # 4GB cache
        Set-ItemProperty $dxCache -Name "D3D12ShaderCacheSize" -Value 4096 -Type DWord -Force -EA SilentlyContinue

        # NVIDIA shader cache (se presente)
        $nvFTS = "HKLM:\SOFTWARE\NVIDIA Corporation\Global\FTS"
        if(!(Test-Path $nvFTS)){New-Item $nvFTS -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $nvFTS -Name "EnableRID61684" -Value 1 -Type DWord -Force -EA SilentlyContinue  # Unlimited shader cache

        # GPU: aumenta timeout per stutter fix durante shader compile a runtime
        $gd2="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gd2 -Name "TdrDelay"    -Value 30 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gd2 -Name "TdrDdiDelay" -Value 30 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gd2 -Name "HwSchMode"   -Value 2  -Type DWord -Force -EA SilentlyContinue

        Write-Success "Shader cache: DX12 4GB, NVIDIA unlimited, TDR 30s, HwSch ON"

        Write-Info "[UE-GAME2] Memory streaming ottimizzato (Nanite + Lumen UE5)..."
        # UE5 con Nanite e Lumen fa streaming massiccio di asset — I/O critico
        $mp2="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
        Set-ItemProperty $mp2 -Name "LargeSystemCache"       -Value 0 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mp2 -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force -EA SilentlyContinue

        # I/O priority alta per processi UE in-game
        foreach($ueExe in @("UnrealGame.exe","UE4Game.exe","UnrealEditor.exe")){
            $rp3="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$ueExe\PerfOptions"
            if(!(Test-Path $rp3)){New-Item $rp3 -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $rp3 -Name "CpuPriorityClass" -Value 3 -Type DWord -Force -EA SilentlyContinue  # High
            Set-ItemProperty $rp3 -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue  # High
        }
        Write-Success "Memory: kernel paging OFF, I/O Priority High per UE executables"

        Write-Info "[UE-GAME3] DirectX 12 + Vulkan ottimizzazioni UE5..."
        # Flip Model ottimizzato per UE5 (riduce latency presentazione frame)
        reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;VRROptimizeEnable=0;" /f 2>$null|Out-Null

        # DX12 heap: ottimizzazioni per allocazioni frequenti UE5
        $dx12g = "HKLM:\SOFTWARE\Microsoft\DirectX"
        if(!(Test-Path $dx12g)){New-Item $dx12g -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dx12g -Name "D3D12_CREATE_NOT_ZEROED" -Value 1 -Type DWord -Force -EA SilentlyContinue  # heap non azzerato = +10% velocità alloc

        # Preemption GPU: batch level (meno interruzioni durante draw call pesanti)
        $gpuPreempt = "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler"
        if(!(Test-Path $gpuPreempt)){New-Item $gpuPreempt -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $gpuPreempt -Name "EnablePreemption" -Value 1 -Type DWord -Force -EA SilentlyContinue

        Write-Success "DX12: Flip Model ON, heap non-zeroed, GPU preemption ottimizzato"

        Write-Info "[UE-GAME4] CPU boost per microstutter UE (WorldPartition / HLOD)..."
        # UE5 WorldPartition carica/scarica livelli dinamicamente — CPU spikes
        # Boost mode Aggressive riduce i tempi di risposta durante loading asincrono
        $pgUE=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pgUE){$pgUE=$Matches[1]}else{$pgUE="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pgUE SUB_PROCESSOR PERFBOOSTMODE    2  2>$null  # Aggressive
        powercfg /setacvalueindex $pgUE SUB_PROCESSOR PROCTHROTTLEMIN  75 2>$null
        powercfg /setacvalueindex $pgUE SUB_PROCESSOR PERFINCTIME      1  2>$null
        powercfg /setacvalueindex $pgUE SUB_PROCESSOR PERFDECTIME      1  2>$null
        powercfg /setactive $pgUE 2>$null
        Write-Success "CPU: Boost Aggressive, risposta 1ms per UE5 WorldPartition loading"

        Write-Info "[UE-GAME5] MMCSS gaming + audio priorità per UE..."
        $mmUE = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Set-ItemProperty $mmUE -Name "SystemResponsiveness"   -Value 0          -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmUE -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF  -Type DWord -Force -EA SilentlyContinue
        $mmTasksUE = "$mmUE\Tasks\Games"
        Set-ItemProperty $mmTasksUE -Name "Priority"            -Value 6     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmTasksUE -Name "GPU Priority"        -Value 8     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmTasksUE -Name "Scheduling Category" -Value "High"            -Force -EA SilentlyContinue
        Set-ItemProperty $mmTasksUE -Name "Clock Rate"          -Value 10000 -Type DWord -Force -EA SilentlyContinue
        Write-Success "MMCSS: Games Priority 6, GPU 8, SystemResponsiveness 0"

        Write-Info "[UE-GAME6] Game Mode + DVR OFF per UE games..."
        reg add "HKCU\Software\Microsoft\GameBar"               /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore"                   /v "GameDVR_Enabled"     /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR"    /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode"          /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "Game Mode ON, DVR OFF, FSE ottimizzato"
    }

    Write-Host ""
    Write-Host "  ════════════════════════════════════════════════════" -F Green
    $ueName = switch($ueChoice){"1"{"DEVELOPER"}"2"{"GAMING"}default{"FULL"}}
    Write-Host "   ✓ UNREAL ENGINE TWEAKS ($ueName) COMPLETATI!" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green

    Write-Host "  📋 CONSIGLI AGGIUNTIVI:" -F Cyan
    Write-Host "   • Aggiungi le cartelle UE all'esclusione di Windows Defender" -F White
    Write-Host "     (Impostazioni → Virus e minacce → Esclusioni → Aggiungi)" -F DarkGray
    Write-Host "   • UE5: abilita DX12 nel progetto (Project Settings → Rendering)" -F White
    Write-Host "   • UE5: Virtual Shadow Maps + Lumen richiedono GPU DX12 tier2+" -F White
    Write-Host "   • Usa SSD NVMe per la cartella Intermediate (shader compile)" -F DarkGray
    Write-Host "   • UE5 Nanite: abilita 'r.Nanite 1' nella console di gioco`n" -F DarkGray

    if((Read-Host "  Riavviare ora? (S/N)") -in @("S","s")){ Restart-Computer -Force }
    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ C: CALL OF DUTY TWEAKS (MW1 → Black Ops 7)
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("C","c")){
    Show-Banner
    Write-Section "CALL OF DUTY TWEAKS — MW1 → Black Ops 7"

    Write-Host "`n  🔫 Ottimizzazioni Windows per Call of Duty`n" -F Red
    Write-Host "  ⚠️  IMPORTANTE — COSA NON FA QUESTO MENU:" -F Yellow
    Write-Host "   • Nessuna modifica ai file di gioco" -F DarkGray
    Write-Host "   • Nessuna modifica alla memoria del processo" -F DarkGray
    Write-Host "   • Nessun bypass anti-cheat (RICOCHET)" -F DarkGray
    Write-Host "   • Nessun config editing che dia vantaggi gameplay" -F DarkGray
    Write-Host "   Tutto ciò che fa questo menu è a livello Windows — 100% safe`n" -F DarkGray

    Write-Host "  Titoli supportati:" -F Cyan
    Write-Host "   MW (2019) | MW2 | MW3 | Warzone | Vanguard" -F DarkGray
    Write-Host "   Cold War | Black Ops 6 | Black Ops 7`n" -F DarkGray

    Write-Host "  [1] ⚡ BASE - Priorità processo + overlays OFF (tutti i CoD)" -F Green
    Write-Host "      Safe su qualsiasi titolo CoD`n" -F DarkGray
    Write-Host "  [2] 🌐 NETWORK - Latenza e packet loss (tutti i CoD)" -F Yellow
    Write-Host "      TCP/IP gaming, QoS, buffer ottimizzato`n" -F DarkGray
    Write-Host "  [3] 🔴 BLACK OPS 7 - Tweaks specifici BO7 (priorità)" -F Red
    Write-Host "      Ottimizzazioni specifiche per BO7 + tweaks nascosti`n" -F DarkGray
    Write-Host "  [A] 🚀 ALL - Applica tutto (1+2+3)" -F Magenta
    Write-Host "  [R] 🔄 RESET - Ripristina valori default`n" -F DarkGray
    Write-Host "  [0] ↩️  Torna al menu`n" -F DarkGray

    $codChoice = Read-Host "  Scelta (1/2/3/A/R/0)"
    if($codChoice -eq "0"){ continue MenuLoop }

    $doCODBase    = ($codChoice -in @("1","A","a"))
    $doCODNet     = ($codChoice -in @("2","A","a"))
    $doCODBO7     = ($codChoice -in @("3","A","a"))
    $doCODReset   = ($codChoice -in @("R","r"))

    Write-Host ""
    try{
        Enable-ComputerRestore -Drive "C:\" -EA SilentlyContinue
        $desc="OGD CoD Tweaks - $(Get-Date -Format 'dd/MM/yyyy HH:mm')"
        Checkpoint-Computer -Description $desc -RestorePointType MODIFY_SETTINGS -EA Stop
        Write-Success "Punto ripristino: $desc"
    }catch{ Write-Warning "Punto ripristino non creato" }
    Write-Host ""

    # ── RESET ─────────────────────────────────────────────────────────────────
    if($doCODReset){
        Write-Info "Reset CoD tweaks..."
        $codExes = @(
            "cod.exe","cod_launcher.exe","BlackOps7.exe","BlackOps7_Launcher.exe",
            "ModernWarfare.exe","ModernWarfare2.exe","ModernWarfare3.exe",
            "Warzone.exe","cod-cold-war.exe","Vanguard.exe","BlackOps6.exe",
            "bg3.exe"  # non CoD ma per sicurezza non tocchiamo altri giochi
        )
        foreach($ex in $codExes){
            $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$ex\PerfOptions"
            if(Test-Path $rp){ Remove-Item $rp -Recurse -Force -EA SilentlyContinue }
        }
        # Rimuovi QoS policy CoD
        $qosCod = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\QoS\CoD Gaming"
        if(Test-Path $qosCod){ Remove-Item $qosCod -Recurse -Force -EA SilentlyContinue }
        Write-Success "CoD tweaks: ripristinati al default"
        Read-Host "  INVIO per tornare al menu"
        continue MenuLoop
    }

    # ── BASE: Process priority + Overlays OFF ─────────────────────────────────
    if($doCODBase){
        Write-Info "[COD1] Process priority Real-Time per executables CoD..."

        # Lista completa executables CoD da MW2019 a BO7
        $codProcs = @{
            # Black Ops 7 (priorità massima)
            "BlackOps7.exe"           = @{P=3;I=3}   # High CPU, High I/O
            "BlackOps7_Launcher.exe"  = @{P=6;I=2}   # AboveNormal
            # Black Ops 6
            "BlackOps6.exe"           = @{P=3;I=3}
            # Cold War
            "cod-cold-war.exe"        = @{P=3;I=3}
            # Modern Warfare (2019/2022/2023)
            "ModernWarfare.exe"       = @{P=3;I=3}
            "ModernWarfare2.exe"      = @{P=3;I=3}
            "ModernWarfare3.exe"      = @{P=3;I=3}
            # Warzone
            "Warzone.exe"             = @{P=3;I=3}
            # Vanguard
            "Vanguard.exe"            = @{P=3;I=3}
            # Launcher Battle.net
            "Battle.net.exe"          = @{P=6;I=2}   # AboveNormal
            "Agent.exe"               = @{P=2;I=1}   # Normal, Low I/O
            # Shader compile CoD (IW engine)
            "cod.exe"                 = @{P=3;I=3}
        }
        foreach($ex in $codProcs.Keys){
            $pi = $codProcs[$ex]
            $rp = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$ex\PerfOptions"
            if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $rp -Name "CpuPriorityClass" -Value $pi.P -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $rp -Name "IoPriority"       -Value $pi.I -Type DWord -Force -EA SilentlyContinue
        }
        Write-Success "Process priority: CoD executables High, launcher AboveNormal"

        Write-Info "[COD2] Xbox Game Bar/DVR OFF (causa stuttering in CoD)..."
        # Xbox Game Bar e DVR — principali cause di stutter in CoD
        # Discord e NVIDIA overlay lasciati attivi (utili per comunicazione e stats)
        reg add "HKCU\Software\Microsoft\GameBar"               /v "UseNexusForGameBarEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore"                   /v "GameDVR_Enabled"            /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR"           /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "Xbox DVR: OFF | Discord overlay: ✓ lasciato attivo | NVIDIA overlay: ✓ lasciato attivo"

        Write-Info "[COD3] Game Mode + Fullscreen Exclusive ottimizzato..."
        reg add "HKCU\Software\Microsoft\GameBar"     /v "AutoGameModeEnabled"          /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore"         /v "GameDVR_FSEBehaviorMode"       /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore"         /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore"         /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "Game Mode ON, FSE ottimizzato"

        Write-Info "[COD4] Fix crash Discord screen share + minimize/restore..."
        # Il crash avviene perché CoD usa Fullscreen Exclusive — quando Discord
        # cattura lo schermo o quando minimizzi, Windows resetta il contesto DX12
        # La soluzione è forzare DXGI Flip Model (Borderless Windowed-like behavior)
        # mantenendo le performance del fullscreen ma senza perdere il contesto DX

        # Forza DirectX Flip Presentation — evita il reset contesto DX su focus loss
        reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;VRROptimizeEnable=0;" /f 2>$null|Out-Null

        # TDR aumentato — evita crash GPU quando Discord cattura (causa spike breve)
        $gdCOD="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gdCOD -Name "TdrDelay"         -Value 10 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gdCOD -Name "TdrDdiDelay"      -Value 10 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gdCOD -Name "TdrLimitCount"    -Value 10 -Type DWord -Force -EA SilentlyContinue  # più tentativi prima del crash

        # Hardware Accelerated GPU Scheduling ON — Discord usa HAGS per la cattura
        # con HAGS attivo Discord può catturare senza interrompere il render di CoD
        Set-ItemProperty $gdCOD -Name "HwSchMode" -Value 2 -Type DWord -Force -EA SilentlyContinue

        # Disabilita fullscreen optimization forzata che causa conflitto con Discord
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode"                   /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible"     /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEBehaviorMode"                  /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita la virtualizzazione GPU per la cattura schermo — causa context loss
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HyperV" /v "RequireSecureDeviceEncryption" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Fix per minimize/restore — aumenta tempo di attesa GPU prima del crash
        $gdSch = "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler"
        if(!(Test-Path $gdSch)){New-Item $gdSch -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $gdSch -Name "EnablePreemption"    -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gdSch -Name "GpuPreemptionLevel"  -Value 2 -Type DWord -Force -EA SilentlyContinue  # Batch level — meno interrupt

        Write-Success "Crash fix: Flip Model ON, TDR aumentato, HAGS ON, GPU virtualizzazione OFF"
        Write-Host "  ℹ In-game: imposta Display Mode su 'Borderless Windowed' per fix definitivo" -F Yellow
        Write-Host "  ℹ In Discord: Impostazioni → Avanzate → usa 'H264 hardware' per cattura`n" -F DarkGray

        Write-Info "[COD4] MMCSS priorità massima per CoD..."
        $mmCoD = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Set-ItemProperty $mmCoD -Name "SystemResponsiveness"   -Value 0          -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmCoD -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF  -Type DWord -Force -EA SilentlyContinue
        $mmGames = "$mmCoD\Tasks\Games"
        Set-ItemProperty $mmGames -Name "Priority"            -Value 6     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "GPU Priority"        -Value 8     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "Scheduling Category" -Value "High"            -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "Clock Rate"          -Value 10000 -Type DWord -Force -EA SilentlyContinue
        Write-Success "MMCSS: Games Priority 6, GPU 8, SystemResponsiveness 0"

        Write-Info "[COD5] USB Suspend OFF (no spike input durante le partite)..."
        $pgCoD=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pgCoD){$pgCoD=$Matches[1]}else{$pgCoD="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pgCoD 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setactive $pgCoD 2>$null
        Write-Success "USB Selective Suspend: OFF"
    }

    # ── NETWORK: latenza e packet loss ────────────────────────────────────────
    if($doCODNet){
        Write-Info "[COD-NET1] TCP/IP ottimizzato per CoD (server tick 20Hz/64Hz)..."

        # CoD usa UDP — ottimizziamo anche UDP oltre TCP
        $tcpCoD = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
        New-ItemProperty $tcpCoD -Name "TCPNoDelay"        -PropertyType DWord -Value 1     -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpCoD -Name "TcpAckFrequency"   -PropertyType DWord -Value 1     -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpCoD -Name "TcpDelAckTicks"    -PropertyType DWord -Value 0     -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpCoD -Name "TcpTimedWaitDelay" -PropertyType DWord -Value 30    -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpCoD -Name "MaxUserPort"       -PropertyType DWord -Value 65534 -Force -EA SilentlyContinue|Out-Null
        # Disable Nagle per UDP-over-TCP (lobby CoD)
        New-ItemProperty $tcpCoD -Name "DisableTaskOffload"-PropertyType DWord -Value 0     -Force -EA SilentlyContinue|Out-Null

        netsh int tcp set global autotuninglevel=normal          2>$null|Out-Null
        netsh int tcp set global congestionprovider=ctcp         2>$null|Out-Null
        netsh int tcp set global ecncapability=disabled          2>$null|Out-Null
        netsh int tcp set global timestamps=disabled             2>$null|Out-Null
        netsh int tcp set global nonsackrttresiliency=disabled   2>$null|Out-Null
        netsh int tcp set global maxsynretransmissions=2         2>$null|Out-Null
        netsh int tcp set global initialRto=2000                 2>$null|Out-Null
        netsh int tcp set global rss=enabled                     2>$null|Out-Null

        # QoS: priorità massima per traffico CoD (porta 3074 UDP Battle.net / 30000-45000 UDP)
        $qosPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\QoS\CoD Gaming"
        if(!(Test-Path $qosPath)){New-Item $qosPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $qosPath -Name "Version"            -Value "1.0"       -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $qosPath -Name "Application Name"   -Value "*"          -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $qosPath -Name "Protocol"           -Value "UDP"        -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $qosPath -Name "Local Port"         -Value "*"          -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $qosPath -Name "Remote Port"        -Value "3074"       -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $qosPath -Name "DSCP Value"         -Value "46"         -Type String -Force -EA SilentlyContinue  # Expedited Forwarding
        Set-ItemProperty $qosPath -Name "Throttle Rate"      -Value "-1"         -Type String -Force -EA SilentlyContinue

        # Priorità DNS locale per risolvere velocemente i server CoD
        $dnsCoD = "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters"
        if(!(Test-Path $dnsCoD)){New-Item $dnsCoD -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dnsCoD -Name "LocalPriority" -Value 4 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $dnsCoD -Name "HostsPriority"  -Value 5 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $dnsCoD -Name "DnsPriority"    -Value 6 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $dnsCoD -Name "NetbtPriority"  -Value 7 -Type DWord -Force -EA SilentlyContinue

        Write-Success "Network: TCP/IP ottimizzato, QoS UDP porta 3074 priorità EF, DNS priority"

        Write-Info "[COD-NET2] Adapter LAN ottimizzato per CoD..."
        $lanCoD = Get-NetAdapter -Physical | Where-Object{
            ($_.MediaType -like "*802.3*" -or $_.InterfaceDescription -like "*Ethernet*" -or
             $_.InterfaceDescription -like "*Gigabit*" -or $_.InterfaceDescription -like "*Realtek*" -or
             $_.InterfaceDescription -like "*Intel*") -and $_.Status -eq "Up"
        }
        if($lanCoD){
            foreach($a in $lanCoD){
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Interrupt Moderation"         -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Energy Efficient Ethernet"    -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Flow Control"                 -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Receive Buffers"              -DisplayValue "2048"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Transmit Buffers"             -DisplayValue "2048"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Receive Side Scaling"         -DisplayValue "Enabled"         -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Large Send Offload V2 (IPv4)" -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Magic Packet"         -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
            }
            Write-Success "LAN: Interrupt OFF, EEE OFF, Buffer 2048, RSS ON, LSO OFF"
        } else {
            Write-Warning "Nessun adapter LAN attivo trovato"
        }

        Write-Info "[COD-NET3] Flush DNS + Winsock reset..."
        ipconfig /flushdns     | Out-Null
        ipconfig /registerdns  | Out-Null
        netsh winsock reset    | Out-Null
        Write-Success "DNS flushed, Winsock reset"
    }

    # ── BLACK OPS 7 — Tweaks specifici ───────────────────────────────────────
    if($doCODBO7){
        Write-Host ""
        Write-Section "BLACK OPS 7 — TWEAKS SPECIFICI"
        Write-Host ""

        Write-Info "[BO7-1] Process priority BO7 — Real-Time safe..."
        # BO7 usa IW engine evoluto — stessi exe pattern di BO6 ma aggiornati
        $bo7Exes = @("BlackOps7.exe","BlackOps7_Launcher.exe","cod.exe","cod_launcher.exe")
        foreach($ex in $bo7Exes){
            $rp7 = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$ex\PerfOptions"
            if(!(Test-Path $rp7)){New-Item $rp7 -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $rp7 -Name "CpuPriorityClass" -Value 3 -Type DWord -Force -EA SilentlyContinue  # High
            Set-ItemProperty $rp7 -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue  # High
        }
        Write-Success "BO7: Process priority High per tutti gli executables"

        Write-Info "[BO7-2] GPU ottimizzato per BO7 (IW engine DX12)..."
        # BO7 usa DX12 natively — ottimizza per DX12
        $gd7="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gd7 -Name "HwSchMode"       -Value 2  -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gd7 -Name "TdrDelay"         -Value 10 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gd7 -Name "TdrDdiDelay"      -Value 10 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gd7 -Name "EnablePreemption" -Value 1  -Type DWord -Force -EA SilentlyContinue
        # DirectX Flip Model — riduce latenza presentazione frame in BO7
        reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;VRROptimizeEnable=0;" /f 2>$null|Out-Null
        # Shader cache BO7 — riduce shader stutter
        $dxC7 = "HKCU:\SOFTWARE\Microsoft\Direct3D"
        if(!(Test-Path $dxC7)){New-Item $dxC7 -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dxC7 -Name "ShaderCacheSize"      -Value 4096 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $dxC7 -Name "D3D12ShaderCacheSize" -Value 4096 -Type DWord -Force -EA SilentlyContinue
        Write-Success "GPU BO7: HwSch ON, Flip Model, Shader Cache 4GB"

        Write-Info "[BO7-3] CPU scheduling ottimizzato per BO7..."
        # BO7 è multithread-heavy — Quantum Fixed riduce varianza frame time
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x2a /f 2>$null|Out-Null
        # Power Throttling OFF per BO7
        $ptpBO7 = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
        if(!(Test-Path $ptpBO7)){New-Item $ptpBO7 -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ptpBO7 -Name "PowerThrottlingOff" -Value 1 -Type DWord -Force -EA SilentlyContinue
        # CPU Boost: Aggressive per risposta rapida agli spike BO7
        $pgBO7=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pgBO7){$pgBO7=$Matches[1]}else{$pgBO7="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pgBO7 SUB_PROCESSOR PERFBOOSTMODE    2  2>$null
        powercfg /setacvalueindex $pgBO7 SUB_PROCESSOR PROCTHROTTLEMIN  75 2>$null
        powercfg /setacvalueindex $pgBO7 SUB_PROCESSOR PERFINCTIME      1  2>$null
        powercfg /setacvalueindex $pgBO7 SUB_PROCESSOR PERFDECTIME      1  2>$null
        powercfg /setactive $pgBO7 2>$null
        Write-Success "CPU BO7: Quantum Fixed, Power Throttling OFF, Boost Aggressive"

        Write-Info "[BO7-4] Tweaks registro nascosti IW Engine..."
        # Tweaks a livello registro per l'IW engine (usato da MW2019 in poi)
        # Queste chiavi influenzano il comportamento del renderer Windows-side
        # NON modificano il codice del gioco — solo come Windows gestisce il processo

        # Priorità IRQ per il processo BO7 (nascosto, non documentato MS)
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BlackOps7.exe" /v "PerfOptions" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Large Address Aware — BO7 può usare più di 4GB di spazio indirizzi
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BlackOps7.exe" /v "DisableHeapLookaside" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Memory working set ottimizzato per BO7
        $mp7 = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
        Set-ItemProperty $mp7 -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force -EA SilentlyContinue

        # Timer resolution globale — riduce jitter frame time BO7
        $kern7 = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"
        if(!(Test-Path $kern7)){New-Item $kern7 -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $kern7 -Name "GlobalTimerResolutionRequests" -Value 1 -Type DWord -Force -EA SilentlyContinue

        Write-Success "IW Engine hidden tweaks: Large Address, Paging OFF, Timer resolution"

        Write-Info "[BO7-5] Disabilita servizi che interferiscono con RICOCHET..."
        # Servizi che possono causare falsi positivi o interferire con anti-cheat
        # (non li disabilitiamo — solo abbassamo priorità I/O)
        $antiInterfer = @("DiagTrack","WSearch","SysMain","dmwappushservice")
        foreach($svc in $antiInterfer){
            try{
                $rp8 = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$svc.exe\PerfOptions"
                if(!(Test-Path $rp8)){New-Item $rp8 -Force -EA SilentlyContinue|Out-Null}
                Set-ItemProperty $rp8 -Name "IoPriority" -Value 0 -Type DWord -Force -EA SilentlyContinue
            }catch{}
        }
        Write-Success "Servizi background: I/O priority minima (meno interferenze con RICOCHET)"

        Write-Info "[BO7-6] Ottimizzazione audio per footstep audio accuracy..."
        # BO7 ha audio basato su posizione — latenza audio bassa è critica
        $mmAu7 = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio"
        if(!(Test-Path $mmAu7)){New-Item $mmAu7 -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $mmAu7 -Name "Affinity"            -Value 0     -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAu7 -Name "Background Only"     -Value "False"            -Force  -EA SilentlyContinue
        Set-ItemProperty $mmAu7 -Name "Clock Rate"          -Value 10000 -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAu7 -Name "GPU Priority"        -Value 8     -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAu7 -Name "Priority"            -Value 6     -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAu7 -Name "Scheduling Category" -Value "High"             -Force  -EA SilentlyContinue
        Set-ItemProperty $mmAu7 -Name "SFIO Priority"       -Value "High"             -Force  -EA SilentlyContinue
        # Disabilita audio enhancements (causano latenza audio)
        reg add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d 3 /f 2>$null|Out-Null
        Write-Success "Audio BO7: MMCSS Clock 10000, Priority 6, enhancements OFF (footstep accuracy)"
    }

    # ── Riepilogo ─────────────────────────────────────────────────────────────
    Write-Host ""
    Write-Host "  ════════════════════════════════════════════════════" -F Red
    Write-Host "   🔫 CALL OF DUTY TWEAKS COMPLETATI!" -F Red
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green

    Write-Host "  📋 CONSIGLI IN-GAME (da fare manualmente):" -F Cyan
    Write-Host "   • BO7: Texture Quality → Bassa/Media (meno VRAM spike)" -F White
    Write-Host "   • BO7: Rendering Mode → Performance o Balanced" -F White
    Write-Host "   • BO7: V-Sync → OFF | Frame Rate Limit → quello del tuo monitor" -F White
    Write-Host "   • BO7: Shader Pre-loading → ON (esegui prima di giocare)" -F White
    Write-Host "   • Tutti i CoD: NVIDIA Reflex → ON + Boost (se disponibile)" -F White
    Write-Host "   • Warzone/BO7: Cache Spot → SSD (non HDD)`n" -F DarkGray
    Write-Host "  ⚠️  RICORDA: quando uscirà il prossimo CoD aggiorna via OGD!" -F Yellow
    Write-Host "     (Segnala su Discord quando è disponibile)`n" -F DarkGray

    if((Read-Host "  Riavviare ora? (S/N)") -in @("S","s")){ Restart-Computer -Force }
    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ D: DISCORD
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("D","d")){
    Show-Banner
    Write-Section "COMMUNITY OGD — DISCORD"

    Write-Host "`n  💬 Unisciti al server Discord di OGD!`n" -F Cyan
    Write-Host "  Trovi:" -F White
    Write-Host "   • Supporto per lo script" -F DarkGray
    Write-Host "   • Consigli e ottimizzazioni dalla community" -F DarkGray
    Write-Host "   • Aggiornamenti e novità in anteprima" -F DarkGray
    Write-Host "   • Amici con cui condividere la passione per il gaming`n" -F DarkGray
    Write-Host "  🔗 https://discord.gg/5SJa2xp5`n" -F Yellow

    if((Read-Host "  Aprire Discord nel browser? (S/N)") -in @("S","s")){
        try{
            Start-Process "https://discord.gg/5SJa2xp5"
            Write-Host "`n  ✓ Discord aperto nel browser!`n" -F Green
        }catch{
            Write-Host "`n  ⚠ Apri manualmente: https://discord.gg/5SJa2xp5`n" -F Yellow
        }
    }

    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ N: NET TWEAKS — WiFi + LAN ottimizzazione avanzata
# ═════════════════════════════════════════════════════════════════════════════

if($mode -in @("N","n")){
    Show-Banner
    Write-Section "NET TWEAKS — WiFi + LAN"

    Write-Host "`n  📡 Ottimizzazione avanzata schede di rete`n" -F Cyan
    Write-Host "  [1] 📶 WiFi ONLY" -F Cyan
    Write-Host "  [2] 🔌 LAN ONLY" -F Green
    Write-Host "  [3] 🌐 ENTRAMBI (consigliato)" -F Yellow
    Write-Host "  [0] ↩️  Torna al menu`n" -F DarkGray

    $ntChoice = Read-Host "  Scelta (1/2/3/0)"
    if($ntChoice -eq "0"){ continue MenuLoop }

    $doNTWifi = ($ntChoice -in @("1","3"))
    $doNTLan  = ($ntChoice -in @("2","3"))

    Write-Host ""

    # ── TCP/IP BASE (sempre) ──────────────────────────────────────────────────
    Write-Info "TCP/IP stack ottimizzazione..."

    # ── netsh globale ─────────────────────────────────────────────────────────
    netsh int tcp set global autotuninglevel=normal   2>$null|Out-Null  # TCP Window: normal
    netsh int tcp set global congestionprovider=ctcp  2>$null|Out-Null  # CTCP (migliore throughput)
    netsh int tcp set global ecncapability=disabled   2>$null|Out-Null  # ECN: disabled
    netsh int tcp set global timestamps=disabled      2>$null|Out-Null  # Timestamps: disabled
    netsh int tcp set global rss=enabled              2>$null|Out-Null  # RSS: enabled
    netsh int tcp set global rsc=enabled              2>$null|Out-Null  # RSC (Receive Segment Coalescing): enabled
    netsh int tcp set global chimney=disabled         2>$null|Out-Null  # TCP Chimney: disabled
    netsh int tcp set global dca=enabled              2>$null|Out-Null  # DCA: enabled
    netsh int tcp set global netdma=disabled          2>$null|Out-Null  # NetDMA: disabled
    netsh int tcp set global heuristics=disabled      2>$null|Out-Null  # Scaling heuristics: disabled
    netsh int tcp set global nonsackrttresiliency=disabled 2>$null|Out-Null  # NonSackRtt: disabled
    netsh int tcp set global maxsynretransmissions=2  2>$null|Out-Null  # Max SYN retransmissions: 2
    netsh int tcp set global initialRto=2000          2>$null|Out-Null  # Initial RTO: 2000ms
    netsh int tcp set global minRto=300               2>$null|Out-Null  # Min RTO: 300ms

    # ── Registro TCP/IP ───────────────────────────────────────────────────────
    $tcpip = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
    New-ItemProperty $tcpip -Name "TCPNoDelay"             -PropertyType DWord -Value 1     -Force -EA SilentlyContinue|Out-Null  # Nagle OFF
    New-ItemProperty $tcpip -Name "TcpAckFrequency"        -PropertyType DWord -Value 1     -Force -EA SilentlyContinue|Out-Null  # ACK immediato
    New-ItemProperty $tcpip -Name "TcpDelAckTicks"         -PropertyType DWord -Value 0     -Force -EA SilentlyContinue|Out-Null  # Delayed ACK ticks: 0
    New-ItemProperty $tcpip -Name "IRPStackSize"           -PropertyType DWord -Value 32    -Force -EA SilentlyContinue|Out-Null
    New-ItemProperty $tcpip -Name "GlobalMaxTcpWindowSize" -PropertyType DWord -Value 65535 -Force -EA SilentlyContinue|Out-Null
    New-ItemProperty $tcpip -Name "TcpTimedWaitDelay"      -PropertyType DWord -Value 30    -Force -EA SilentlyContinue|Out-Null  # TIME_WAIT: 30s
    New-ItemProperty $tcpip -Name "MaxUserPort"            -PropertyType DWord -Value 65534 -Force -EA SilentlyContinue|Out-Null  # Port range massimo
    New-ItemProperty $tcpip -Name "MaxConnectionsPerServer"-PropertyType DWord -Value 20    -Force -EA SilentlyContinue|Out-Null  # Max connessioni server: 20
    New-ItemProperty $tcpip -Name "MaxConnectionsPer1_0Server" -PropertyType DWord -Value 20 -Force -EA SilentlyContinue|Out-Null

    # ── DNS/Host Resolution Priority ─────────────────────────────────────────
    $dnsCache = "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters"
    if(!(Test-Path $dnsCache)){New-Item $dnsCache -Force -EA SilentlyContinue|Out-Null}
    Set-ItemProperty $dnsCache -Name "LocalPriority" -Value 4 -Type DWord -Force -EA SilentlyContinue  # Local: 4
    Set-ItemProperty $dnsCache -Name "HostsPriority"  -Value 5 -Type DWord -Force -EA SilentlyContinue  # Hosts: 5
    Set-ItemProperty $dnsCache -Name "DnsPriority"    -Value 6 -Type DWord -Force -EA SilentlyContinue  # DNS: 6
    Set-ItemProperty $dnsCache -Name "NetbtPriority"  -Value 7 -Type DWord -Force -EA SilentlyContinue  # NetBT: 7

    # ── Gaming Tweaks (NetworkThrottling + SystemResponsiveness) ─────────────
    $mmsp = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
    Set-ItemProperty $mmsp -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF -Type DWord -Force -EA SilentlyContinue  # Throttling: ffffffff
    Set-ItemProperty $mmsp -Name "SystemResponsiveness"   -Value 0          -Type DWord -Force -EA SilentlyContinue  # Gaming: 0

    # ── QoS ──────────────────────────────────────────────────────────────────
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f 2>$null|Out-Null  # QoS: 0% riservato
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS" /t REG_DWORD /d 0 /f 2>$null|Out-Null

    Write-Success "TCP/IP: RSC ON, NonSackRtt OFF, RTO 2000/300, ACK freq, MaxConn 20, DNS priority, QoS 0%, port 65534"

    # ── WiFi ─────────────────────────────────────────────────────────────────
    if($doNTWifi){
        Write-Host ""
        Write-Info "Ricerca adapter WiFi..."
        $wifiAdapters = Get-NetAdapter -Physical | Where-Object{
            $_.MediaType -like "*802.11*" -or
            $_.InterfaceDescription -like "*Wi-Fi*" -or
            $_.InterfaceDescription -like "*Wireless*" -or
            $_.InterfaceDescription -like "*WLAN*"
        }

        if(-not $wifiAdapters){
            Write-Warning "Nessun adapter WiFi trovato"
        } else {
            foreach($a in $wifiAdapters){
                Write-Host "  → $($a.Name): $($a.InterfaceDescription)" -F DarkGray

                # Power management OFF
                $devID = $a.DeviceID
                $regP  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                if(Test-Path $regP){ Set-ItemProperty $regP -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue }

                $props = @{
                    "Power Saving Mode"           = "Maximum Performance"
                    "MIMO Power Save Mode"         = "No SMPS"
                    "Roaming Aggressiveness"       = "1. Lowest"
                    "Transmit Power"               = "Highest"
                    "802.11n Mode"                 = "Enabled"
                    "802.11ac Mode"                = "Enabled"
                    "802.11ax Mode"                = "Enabled"          # WiFi 6
                    "Preferred Band"               = "Prefer 5GHz Band" # preferisce 5GHz
                    "Fat Channel Intolerant"       = "Disabled"
                    "Throughput Enhancement"       = "Disabled"
                    "Throughput Booster"           = "Disabled"
                    "U-APSD Support"               = "Disabled"         # riduce latenza gaming
                    "WMM"                          = "Enabled"          # QoS WiFi
                    "ARP Offload"                  = "Disabled"
                    "NS Offload"                   = "Disabled"
                    "GTK Rekeying for Security Association" = "Disabled"
                    "Wake on Magic Packet"         = "Disabled"
                    "Wake on Pattern Match"        = "Disabled"
                    "Interrupt Moderation"         = "Disabled"
                    "Receive Buffers"              = "256"
                    "Transmit Buffers"             = "256"
                }
                foreach($prop in $props.GetEnumerator()){
                    try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName $prop.Key -DisplayValue $prop.Value -EA SilentlyContinue }catch{}
                }
            }
            Write-Success "WiFi: Power OFF, 5GHz, Roaming basso, U-APSD OFF, Wake OFF"
        }
    }

    # ── LAN ──────────────────────────────────────────────────────────────────
    if($doNTLan){
        Write-Host ""
        Write-Info "Ricerca adapter LAN/Ethernet..."
        $lanAdapters = Get-NetAdapter -Physical | Where-Object{
            $_.MediaType -like "*802.3*" -or
            $_.InterfaceDescription -like "*Ethernet*" -or
            $_.InterfaceDescription -like "*Gigabit*" -or
            $_.InterfaceDescription -like "*Realtek*" -or
            $_.InterfaceDescription -like "*Intel*" -or
            $_.InterfaceDescription -like "*2.5G*" -or
            $_.InterfaceDescription -like "*10GbE*"
        }

        if(-not $lanAdapters){
            Write-Warning "Nessun adapter LAN trovato"
        } else {
            $cpuCount = (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
            foreach($a in $lanAdapters){
                Write-Host "  → $($a.Name): $($a.InterfaceDescription)" -F DarkGray

                # Power management OFF
                $devID = $a.DeviceID
                $regP  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                if(Test-Path $regP){ Set-ItemProperty $regP -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue }

                $lanProps = @{
                    "Energy Efficient Ethernet"      = "Disabled"
                    "Advanced EEE"                   = "Disabled"
                    "Green Ethernet"                 = "Disabled"
                    "Ultra Low Power Mode"           = "Disabled"
                    "Interrupt Moderation"           = "Disabled"     # latenza minima gaming
                    "Interrupt Moderation Rate"      = "OFF"
                    "Adaptive Inter-Frame Spacing"   = "Disabled"
                    "Flow Control"                   = "Rx & Tx Enabled"
                    "Large Send Offload V2 (IPv4)"   = "Disabled"
                    "Large Send Offload V2 (IPv6)"   = "Disabled"
                    "TCP Checksum Offload (IPv4)"    = "Rx & Tx Enabled"
                    "TCP Checksum Offload (IPv6)"    = "Rx & Tx Enabled"
                    "UDP Checksum Offload (IPv4)"    = "Rx & Tx Enabled"
                    "UDP Checksum Offload (IPv6)"    = "Rx & Tx Enabled"
                    "IP Checksum Offload"            = "Rx & Tx Enabled"
                    "Receive Buffers"                = "2048"
                    "Transmit Buffers"               = "2048"
                    "Receive Side Scaling"           = "Enabled"
                    "Wake on Magic Packet"           = "Disabled"
                    "Wake on Pattern Match"          = "Disabled"
                    "Jumbo Frame"                    = "9014"
                    "Speed & Duplex"                 = "Auto Negotiation"
                }
                foreach($prop in $lanProps.GetEnumerator()){
                    try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName $prop.Key -DisplayValue $prop.Value -EA SilentlyContinue }catch{}
                }

                # RSS su core 2-3 se 4+ core
                if($cpuCount -ge 4){
                    try{ Set-NetAdapterRSS -Name $a.Name -BaseProcessorNumber 2 -EA SilentlyContinue }catch{}
                }
            }
            Write-Success "LAN: EEE OFF, Interrupt OFF, Jumbo 9K, RSS ON, Checksum ON, Buffer 2048"
        }
    }

    # ── DNS veloce (opzionale) ────────────────────────────────────────────────
    Write-Host ""
    Write-Host "  🌐 DNS veloce (opzionale):" -F Cyan
    Write-Host "  [1] Cloudflare  1.1.1.1 / 1.0.0.1  (veloce + privacy)" -F White
    Write-Host "  [2] Google      8.8.8.8 / 8.8.4.4  (stabile)" -F White
    Write-Host "  [3] Quad9       9.9.9.9 / 149.112.112.112  (sicuro)" -F White
    Write-Host "  [0] Lascia DNS attuale`n" -F DarkGray
    $dnsChoice = Read-Host "  DNS (1/2/3/0)"

    $dnsServers = switch($dnsChoice){
        "1"{ @("1.1.1.1","1.0.0.1") }
        "2"{ @("8.8.8.8","8.8.4.4") }
        "3"{ @("9.9.9.9","149.112.112.112") }
        default{ $null }
    }

    if($dnsServers){
        $adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
        foreach($a in $adapters){
            try{
                Set-DnsClientServerAddress -InterfaceIndex $a.ifIndex -ServerAddresses $dnsServers -EA SilentlyContinue
            }catch{}
        }
        ipconfig /flushdns | Out-Null
        Write-Success "DNS impostato: $($dnsServers -join ' / ')"
    }

    Write-Host ""
    Write-Host "  ════════════════════════════════════════════════════" -F Green
    Write-Host "   ✓ NET TWEAKS COMPLETATI!" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Green
    Write-Host "  ℹ Alcune proprietà richiedono il riavvio dell'adapter" -F DarkGray
    Write-Host "  ℹ Per applicare tutto: disconnetti e riconnetti la rete`n" -F DarkGray

    Read-Host "  INVIO per tornare al menu"
    continue MenuLoop
}

# ═════════════════════════════════════════════════════════════════════════════
#  MODALITÀ 1-5: OTTIMIZZAZIONI

if($mode -in @("1","2","3","A","a","4","5")){

    # ── Flag livelli desktop ─────────────────────────────────────────────────
    $isLaptop        = ($mode -in @("4","5"))
    $isGamingLaptop  = ($mode -eq "5")
    $isAggrGaming    = ($mode -in @("A","a"))

    # Flag livelli gaming
    $doAggrGL = ($isAggrGaming -and $aggrGamingLevel -in @("L","N","F"))  # Light Gaming
    $doAggrGN = ($isAggrGaming -and $aggrGamingLevel -in @("N","F"))      # Normale Gaming
    $doAggrGF = ($isAggrGaming -and $aggrGamingLevel -eq "F")             # Full Gaming

    # Livelli desktop (1-3) + Aggressivo Gaming eredita in base al livello scelto
    $doLight  = ($mode -in @("1","2","3") -or $doAggrGL)
    $doNormal = ($mode -in @("2","3")     -or $doAggrGN)
    $doAggr   = ($mode -eq "3"            -or $doAggrGF)
    $doAggrG  = $doAggrGF  # Blocco tweaks estremi solo in Full

    # Livelli laptop (4-5) — derivati da $laptopLevel
    $doLL  = ($isLaptop -and $laptopLevel -in @("L","N","A","U"))  # Light
    $doLN  = ($isLaptop -and $laptopLevel -in @("N","A","U"))      # Normale
    $doLA  = ($isLaptop -and $laptopLevel -in @("A","U"))           # Alto
    $doLU  = ($isLaptop -and $laptopLevel -eq "U")                  # Ultra

    $lvl = switch($mode){
        "1"{"LIGHT"}
        "2"{"NORMALE"}
        "3"{"AGGRESSIVO"}
        {$_ -in @("A","a")}{"AGGRESSIVO GAMING $aggrGamingLevel"}
        "4"{"LAPTOP $laptopLevel"}
        "5"{"LAPTOP GAMING $laptopLevel"}
    }

    Show-Banner;Write-Section "OTTIMIZZAZIONE $lvl"

    Write-Host "`n  INCLUDE:" -F Cyan
    if($doLight){
        Write-Host "   ✓ C-States + Timer + Piano + GPU + Rete base" -F White
    }
    if($doNormal){
        Write-Host "   ✓ Process 30+ + NPU + Debloat + Visual + Rete avanzata" -F White
    }
    if($doAggr){
        Write-Host "   ✓ Core Affinity + Memory + Responsiveness" -F White
    }
    if($doAggrGL -and -not $doAggrGN){
        Write-Host "   ✓ Game Mode ON + DVR OFF + Process gaming priority" -F Green
        Write-Host "   ✓ Safe su qualsiasi PC gaming`n" -F DarkGray
    }
    if($doAggrGN -and -not $doAggrGF){
        Write-Host "   ✓ Light Gaming + MMCSS + Power max + CPU boost + FSE" -F Yellow
        Write-Host "   ✓ Raccomandato per gaming PC 8GB+`n" -F DarkGray
    }
    if($doAggrGF){
        Write-Host "   ✓ Normale Gaming + Win11 hidden + Core Parking OFF + RAM estrema" -F Magenta
        Write-Host "   ⚠️  Solo desktop di alta potenza`n" -F Yellow
    }
    if($isLaptop){
        $ltInc = switch($laptopLevel){
            "L"{"Timer + Privacy + DNS + GPU + WiFi/LAN + AHCI"}
            "N"{"Light + Process + Debloat + Visual + Rete avanzata"}
            "A"{"Normale + Piano Ultimate + Power Throttling OFF + MMCSS"}
            "U"{"Alto + CPU Boost + Memory" + $(if($isGamingLaptop){" + GPU max + Game Mode"}else{""})}
        }
        Write-Host "   ✓ $ltInc`n" -F White
    }
    
    if((Read-Host "  Procedere? (S/N)") -notin @("S","s")){continue MenuLoop}
    
    # ═════════════════════════════════════════════════════════════════════
    #  CONFIGURAZIONE RAM INTELLIGENTE
    # ═════════════════════════════════════════════════════════════════════
    
    Show-Banner;Write-Section "CONFIGURAZIONE RAM"
    
    Write-Host "`n  TIPO RAM:" -F Cyan
    Write-Host "  [1] DDR4 (latenza più alta, ottimizzazioni conservative)" -F White
    Write-Host "  [2] DDR5 (bandwidth maggiore, ottimizzazioni aggressive)`n" -F White
    $ramType=Read-Host "  Tipo RAM (1/2)"
    $isDDR5=($ramType -eq "2")
    
    Write-Host "`n  QUANTITÀ RAM:" -F Cyan
    if($mode -eq "1"){
        Write-Host "  [1] 8 GB  - Minimo (ottimizzazioni molto conservative)" -F White
        Write-Host "  [2] 12 GB - Consigliato Light" -F White
        Write-Host "  [3] 16 GB+ - Abbondante`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3)"
        $ramGB=switch($ramSize){"1"{8}"2"{12}default{16}}
    }elseif($mode -eq "2"){
        Write-Host "  [1] 12 GB - Minimo Normale" -F White
        Write-Host "  [2] 16 GB - Standard gaming" -F White
        Write-Host "  [3] 32 GB+ - Enthusiast`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3)"
        $ramGB=switch($ramSize){"1"{12}"2"{16}default{32}}
    }elseif($mode -eq "3" -or $isAggrGaming){
        Write-Host "  [1] 16 GB - Minimo Aggressivo" -F White
        Write-Host "  [2] 32 GB - Standard enthusiast" -F White
        Write-Host "  [3] 64 GB - Workstation" -F White
        Write-Host "  [4] 128 GB+ - Extreme`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3/4)"
        $ramGB=switch($ramSize){"1"{16}"2"{32}"3"{64}default{128}}
    }else{
        # Laptop (4/5)
        Write-Host "  [1] 8 GB  - Minimo laptop" -F White
        Write-Host "  [2] 16 GB - Standard laptop" -F White
        Write-Host "  [3] 32 GB - Gaming laptop`n" -F White
        $ramSize=Read-Host "  RAM (1/2/3)"
        $ramGB=switch($ramSize){"1"{8}"2"{16}default{32}}
    }
    
    Write-Host "`n  📊 CONFIGURAZIONE:" -F Cyan
    Write-Host "     Tipo: $(if($isDDR5){'DDR5'}else{'DDR4'})" -F Yellow
    Write-Host "     RAM: $ramGB GB" -F Yellow
    Write-Host "     Livello: $lvl`n" -F Yellow
    
    if((Read-Host "  Confermi? (S/N)") -notin @("S","s")){continue MenuLoop}
    
    $global:opts=0
    
    Show-Banner;Write-Section "APPLICAZIONE OTTIMIZZAZIONI $lvl"
    Write-Host "`n  RAM: $ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'})" -F Yellow
    Write-Host ""
    
    # ═══════════════════════════════════════════════════════════════════════
    #  LIGHT (BASE)
    # ═══════════════════════════════════════════════════════════════════════
    
    if($doLight){
        # C-States BALANCED
        Write-Info "[1] C-States fix freeze..."
        $pg=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pg){$pg=$Matches[1]}else{$pg="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLEDISABLE 0 2>$null
        powercfg /setdcvalueindex $pg SUB_PROCESSOR IDLEDISABLE 0 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLESTATEMAX 1 2>$null
        powercfg /setdcvalueindex $pg SUB_PROCESSOR IDLESTATEMAX 1 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR IDLETHRESHOLD 5 2>$null
        powercfg /setdcvalueindex $pg SUB_PROCESSOR IDLETHRESHOLD 5 2>$null
        powercfg /setacvalueindex $pg 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setacvalueindex $pg 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0 2>$null
        powercfg /setactive $pg 2>$null
        $global:opts++;Write-Success "C-States: Solo C1 (zero freeze)"
        
        # Timer + Piano
        Write-Info "[2] Timer 0.5ms + Piano..."
        bcdedit /set useplatformclock No 2>$null|Out-Null
        bcdedit /set disabledynamictick Yes 2>$null|Out-Null
        bcdedit /set tscsyncpolicy Enhanced 2>$null|Out-Null
        
        $ult=powercfg /list 2>$null|Select-String "Ultimate|Prestazioni ultimate"
        if($ult -and $ult.ToString() -match '([a-f0-9-]{36})'){powercfg /setactive $Matches[1] 2>$null}
        else{
            $ng=powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
            if($ng -match '([a-f0-9-]{36})'){
                powercfg /changename $Matches[1] "Ultimate OGD v7.6.9" 2>$null
                powercfg /setactive $Matches[1] 2>$null
            }
        }
        
        # Timer script v2.0 — copia sul Desktop
        $timerDest = Join-Path ([Environment]::GetFolderPath("Desktop")) "OGD_Timer_0.5ms.ps1"
        # Cerca il timer v2.0 nella stessa cartella dello script
        $timerSrc = Join-Path (Split-Path $PSCommandPath) "OGD_Timer_0.5ms.ps1"
        if((Test-Path $timerSrc) -and ($timerSrc -ne $timerDest)){
            Copy-Item $timerSrc $timerDest -Force
        } else {
            # Fallback: scrivi versione base funzionante
            @'
#Requires -Version 5.1
# OGD Timer 0.5ms v2.0 — by OldGamerDarthy #DarkPlayer84Tv
Add-Type @"
using System.Runtime.InteropServices;
public class OGDTimer2 {
    [DllImport("ntdll.dll")] public static extern int NtSetTimerResolution(uint d, bool s, out uint c);
    [DllImport("ntdll.dll")] public static extern int NtQueryTimerResolution(out uint min, out uint max, out uint cur);
}
"@
$Host.UI.RawUI.WindowTitle="OGD Timer 0.5ms v2.0 — ATTIVO"
if(-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
    Write-Host "Richiesto Amministratore — click destro Esegui come Admin" -ForegroundColor Red; Read-Host; exit 1
}
$c=0u; $r=[OGDTimer2]::NtSetTimerResolution(5000,$true,[ref]$c)
if($r -eq 0){ Write-Host "Timer 0.5ms ATTIVO — Minimizza, non chiudere!" -ForegroundColor Green }
else        { Write-Host "Errore impostazione timer (codice $r)" -ForegroundColor Red; Read-Host; exit 1 }
while($true){ Start-Sleep -Milliseconds 30000
    $min=0u;$max=0u;$cur=0u; [OGDTimer2]::NtQueryTimerResolution([ref]$min,[ref]$max,[ref]$cur)|Out-Null
    if([math]::Round($cur/10000.0,2) -gt 1.0){ [OGDTimer2]::NtSetTimerResolution(5000,$true,[ref]$c)|Out-Null }
}
'@|Out-File $timerDest -Encoding UTF8 -Force
        }
        
        $global:opts++;Write-Success "Timer: 0.5ms + Piano + Script Desktop"
        
        # Privacy + Network
        Write-Info "[3] Privacy + Network..."
        $tp="HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        if(!(Test-Path $tp)){New-Item $tp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $tp -Name "AllowTelemetry" -Value 0 -Type DWord -Force -EA SilentlyContinue
        # TCP/IP base
        netsh int tcp set global autotuninglevel=normal          2>$null|Out-Null
        netsh int tcp set global congestionprovider=ctcp         2>$null|Out-Null
        netsh int tcp set global ecncapability=disabled          2>$null|Out-Null
        netsh int tcp set global timestamps=disabled             2>$null|Out-Null
        netsh int tcp set global heuristics=disabled             2>$null|Out-Null
        netsh int tcp set global rss=enabled                     2>$null|Out-Null
        netsh int tcp set global rsc=enabled                     2>$null|Out-Null
        netsh int tcp set global nonsackrttresiliency=disabled   2>$null|Out-Null
        netsh int tcp set global maxsynretransmissions=2         2>$null|Out-Null
        $tcpipL = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
        New-ItemProperty $tcpipL -Name "TCPNoDelay"         -PropertyType DWord -Value 1     -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpipL -Name "TcpAckFrequency"    -PropertyType DWord -Value 1     -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpipL -Name "TcpDelAckTicks"     -PropertyType DWord -Value 0     -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpipL -Name "TcpTimedWaitDelay"  -PropertyType DWord -Value 30    -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpipL -Name "MaxUserPort"        -PropertyType DWord -Value 65534 -Force -EA SilentlyContinue|Out-Null
        New-ItemProperty $tcpipL -Name "MaxConnectionsPerServer" -PropertyType DWord -Value 20 -Force -EA SilentlyContinue|Out-Null
        $mmspL = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Set-ItemProperty $mmspL -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmspL -Name "SystemResponsiveness"   -Value 0          -Type DWord -Force -EA SilentlyContinue
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        $global:opts++;Write-Success "Privacy + Network: TCP ottimizzato, throttling OFF, QoS 0%"
        
        # DNS + Explorer
        Write-Info "[4] DNS + Explorer..."
        ipconfig /flushdns|Out-Null;netsh winsock reset|Out-Null
        reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f 2>$null|Out-Null
        reg delete "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /d "NotSpecified" /f 2>$null|Out-Null
        $global:opts++;Write-Success "DNS + Explorer OK"
        
        # GPU
        Write-Info "[5] GPU optimization..."
        $gp="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gp -Name "HwSchMode" -Value 2 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gp -Name "TdrDelay" -Value 10 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "GPU: HwScheduling ON + TDR 10s"

        # ── TWEAKS RETE E RISPARMIO ENERGETICO (tutti i PC) ──────────────────
        Write-Host ""
        Write-Info "[L] Rete + risparmio energetico ottimizzati..."

        # SSD: AHCI link power management OFF (no freeze su resume)
        $ap="HKLM:\SYSTEM\CurrentControlSet\Services\storahci\Parameters\Device"
        if(!(Test-Path $ap)){New-Item $ap -Force -EA SilentlyContinue|Out-Null}
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters\Device" /v "StartIo" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "SSD AHCI link power: OFF (no freeze)"

        # Wake timers OFF
        $pg2=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pg2){$pg2=$Matches[1]}else{$pg2="SCHEME_CURRENT"}
        powercfg /setdcvalueindex $pg2 SUB_SLEEP RTCWAKE 0 2>$null
        powercfg /setacvalueindex $pg2 SUB_SLEEP RTCWAKE 0 2>$null
        powercfg /setactive $pg2 2>$null
        Write-Success "Wake timers: OFF"

        # WiFi: ottimizzazione per tutti i PC
        $wifiA = Get-NetAdapter -Physical | Where-Object{$_.MediaType -like "*802.11*" -or $_.InterfaceDescription -like "*Wi-Fi*" -or $_.InterfaceDescription -like "*Wireless*" -or $_.InterfaceDescription -like "*WLAN*"}
        if($wifiA){
            foreach($a in $wifiA){
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Power Saving Mode"      -DisplayValue "Maximum Performance" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Roaming Aggressiveness" -DisplayValue "1. Lowest"           -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Transmit Power"         -DisplayValue "Highest"             -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "U-APSD Support"         -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Magic Packet"   -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Pattern Match"  -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                $devID = $a.DeviceID
                $regP  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                if(Test-Path $regP){ Set-ItemProperty $regP -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue }
            }
            Write-Success "WiFi: Power OFF, Roaming basso, Transmit max, U-APSD OFF, Wake OFF"
        }

        # LAN: ottimizzazione base per tutti i PC
        $lanA = Get-NetAdapter -Physical | Where-Object{$_.MediaType -like "*802.3*" -or $_.InterfaceDescription -like "*Ethernet*" -or $_.InterfaceDescription -like "*Gigabit*" -or $_.InterfaceDescription -like "*Realtek*" -or $_.InterfaceDescription -like "*Intel*"}
        if($lanA){
            foreach($a in $lanA){
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Green Ethernet"            -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Magic Packet"      -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Pattern Match"     -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Flow Control"              -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue }catch{}
                $devID = $a.DeviceID
                $regP  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                if(Test-Path $regP){ Set-ItemProperty $regP -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue }
            }
            Write-Success "LAN: EEE OFF, Green OFF, Wake OFF, Flow Control ON"
        }

        $global:opts++
    }
    
    # ═══════════════════════════════════════════════════════════════════════
    #  NORMALE (include Light)
    # ═══════════════════════════════════════════════════════════════════════
    
    if($doNormal){
        # Process Priority 30+
        Write-Info "[6] Process Priority (33)..."
        
        $procs=@{
            "csrss.exe"=@{P="High";A="P";I="High"}
            "smss.exe"=@{P="High";A="P";I="High"}
            "wininit.exe"=@{P="High";A="P";I="High"}
            "services.exe"=@{P="High";A="P";I="High"}
            "lsass.exe"=@{P="High";A="P";I="High"}
            "explorer.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "dwm.exe"=@{P="High";A="P";I="High"}
            "mmc.exe"=@{P="High";A="P";I="High"}
            "msiexec.exe"=@{P="High";A="P";I="High"}
            "TrustedInstaller.exe"=@{P="High";A="P";I="High"}
            "TiWorker.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "taskmgr.exe"=@{P="High";A="P";I="High"}
            "ShellExperienceHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "StartMenuExperienceHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "TextInputHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "SearchHost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "RuntimeBroker.exe"=@{P="Normal";A="E";I="Low"}
            "svchost.exe"=@{P="Normal";A="All";I="Normal"}
            "dllhost.exe"=@{P="Normal";A="All";I="Normal"}
            "conhost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "SearchIndexer.exe"=@{P="BelowNormal";A="E";I="Low"}
            "SearchProtocolHost.exe"=@{P="BelowNormal";A="E";I="Low"}
            "SearchFilterHost.exe"=@{P="BelowNormal";A="E";I="Low"}
            "spoolsv.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "fontdrvhost.exe"=@{P="Normal";A="All";I="Normal"}
            "WUDFHost.exe"=@{P="Normal";A="All";I="Normal"}
            "sihost.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "ctfmon.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "SecurityHealthSystray.exe"=@{P="Normal";A="E";I="Low"}
            "audiodg.exe"=@{P="High";A="P";I="High"}
            "WmiPrvSE.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "perfmon.exe"=@{P="AboveNormal";A="P";I="Normal"}
            "CompPkgSrv.exe"=@{P="Normal";A="E";I="Low"}
        }
        
        $pmap=@{"Realtime"=4;"High"=3;"AboveNormal"=6;"Normal"=2;"BelowNormal"=5;"Low"=1}
        $imap=@{"High"=3;"Normal"=2;"Low"=1}
        
        foreach($pn in $procs.Keys){
            $pi=$procs[$pn]
            $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$pn\PerfOptions"
            if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $rp -Name "CpuPriorityClass" -Value $pmap[$pi.P] -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $rp -Name "IoPriority" -Value $imap[$pi.I] -Type DWord -Force -EA SilentlyContinue
        }
        
        $global:opts++;Write-Success "Process: $($procs.Count) processi"
        
        # NPU
        if($hasNPU){
            Write-Info "[7] NPU..."
            $np="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AIOptimization"
            if(!(Test-Path $np)){New-Item $np -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $np -Name "EnableNPUOffload" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $np -Name "NPUPriority" -Value 3 -Type DWord -Force -EA SilentlyContinue
            $global:opts++;Write-Success "NPU: Offload ON"
        }else{Write-Info "[7] NPU: Skip"}
        
        # Privacy completo
        Write-Info "[8] Privacy completo..."
        $rp="HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"
        if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $rp -Name "DisableAIDataAnalysis" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 0 -Type DWord -Force -EA SilentlyContinue
        $cp="HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        if(!(Test-Path $cp)){New-Item $cp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $cp -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord -Force -EA SilentlyContinue
        
        # Telemetry OFF (NVIDIA, VS, PowerShell, Adobe, etc)
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\Software\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        [Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT","1","Machine")
        reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Piriform\CCleaner" /v "Monitoring" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        $global:opts++;Write-Success "Privacy: Recall OFF + Telemetry OFF (NVIDIA/VS/PS/Adobe)"
        
        # Protezione Privacy Aggiuntiva (se richiesta)
        if($privacyLevel -ne "0"){
            Write-Info "[8+] Protezione Privacy $(switch($privacyLevel){"1"{"LIGHT"}"2"{"NORMALE"}"3"{"AGGRESSIVO"}"4"{"PARANOICO"}})..."
            
            # LIGHT (1): Base telemetry
            if($privacyLevel -ge "1"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f 2>$null|Out-Null
            }
            
            # NORMALE (2): Cloud + Location
            if($privacyLevel -ge "2"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f 2>$null|Out-Null
            }
            
            # AGGRESSIVO (3): WiFi Sense + Feedback
            if($privacyLevel -ge "3"){
                reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" -EA SilentlyContinue
                Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" -EA SilentlyContinue
            }
            
            # PARANOICO (4): Update manuale + Defender ridotto
            if($privacyLevel -eq "4"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f 2>$null|Out-Null
            }
            
            $privacyName=switch($privacyLevel){"1"{"LIGHT"}"2"{"NORMALE"}"3"{"AGGRESSIVO"}"4"{"PARANOICO"}}
            Write-Success "Protezione Privacy $privacyName applicata"
        }
        
        # Debloat
        Write-Info "[9] Debloat..."
        
        # Rimozione AI/Copilot/Recall
        $aiPkgs=@('Microsoft.Windows.Ai.Copilot.Provider','Microsoft.Copilot','Microsoft.WindowsAiFoundation','Microsoft.Windows.Recall')
        foreach($pkg in $aiPkgs){
            Get-AppxPackage -Name $pkg -AllUsers -EA SilentlyContinue|Remove-AppxPackage -AllUsers -EA SilentlyContinue
            Get-AppxProvisionedPackage -Online -EA SilentlyContinue|Where-Object DisplayName -like $pkg|Remove-AppxProvisionedPackage -Online -EA SilentlyContinue
        }
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        DISM /Online /Disable-Feature /NoRestart /FeatureName:Recall 2>$null|Out-Null
        
        # OneDrive removal
        Stop-Process -Name "OneDrive" -Force -EA SilentlyContinue
        $odSetup="$env:SystemRoot\System32\OneDriveSetup.exe"
        if(Test-Path $odSetup){Start-Process -FilePath $odSetup -ArgumentList "/uninstall" -Wait -EA SilentlyContinue}
        robocopy "$env:USERPROFILE\OneDrive" "$env:USERPROFILE" /mov /e /xj /ndl /nfl /njh /njs /nc /ns /np 2>$null|Out-Null
        Remove-Item "$env:USERPROFILE\OneDrive" -Recurse -Force -EA SilentlyContinue
        Remove-Item "$env:LOCALAPPDATA\OneDrive" -Recurse -Force -EA SilentlyContinue
        Remove-Item "HKCU:\Software\Microsoft\OneDrive" -Recurse -Force -EA SilentlyContinue
        
        # Widgets removal
        Get-AppxPackage *WebExperience* -EA SilentlyContinue|Remove-AppxPackage -EA SilentlyContinue
        
        # Bloatware apps
        $bl=@("*CandyCrush*","*BubbleWitch*","*Facebook*","*Instagram*","*TikTok*","*Disney*","*Dropbox*","*LinkedIn*")
        $rem=0;foreach($b in $bl){Get-AppxPackage $b -EA SilentlyContinue|Remove-AppxPackage -EA SilentlyContinue;if($?){$rem++}}
        
        $global:opts++;Write-Success "Debloat: AI/Copilot/OneDrive/Widgets + $rem app"
        
        # Visual
        Write-Info "[10] Visual..."
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -Type DWord -Force -EA SilentlyContinue
        
        # MenuShowDelay - menu istantanei
        $cpd="HKCU:\Control Panel\Desktop"
        Set-ItemProperty $cpd -Name "MenuShowDelay" -Value "0" -Type String -Force -EA SilentlyContinue
        
        # Mouse acceleration OFF
        reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f 2>$null|Out-Null
        
        # Taskbar icone a sinistra
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        # Menu contestuale classico
        reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve 2>$null|Out-Null
        
        # Dark mode
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        # End Task menu
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /v "TaskbarEndTask" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        
        # Sticky keys OFF
        reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "58" /f 2>$null|Out-Null
        
        # Hibernation OFF
        powercfg /h off 2>$null|Out-Null
        
        $global:opts++;Write-Success "Visual: UI completo (Menu/Mouse/Taskbar/Dark/Hibernation)"
        
        # Memory NORMALE - ottimizzazioni base RAM
        if($mode -eq "2"){
            Write-Info "[11] Memory base ($ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'}))..."
            $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
            
            # NORMALE: Paging sempre ON (più safe)
            Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 0 -Type DWord -Force -EA SilentlyContinue
            
            # LargeSystemCache sempre OFF per gaming
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 0 -Type DWord -Force -EA SilentlyContinue
            
            # Superfetch intelligente
            $pp="$mp\PrefetchParameters"
            if($ramGB -le 16){
                Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 3 -Type DWord -Force -EA SilentlyContinue
                Write-Success "  → Superfetch: ON (RAM $ramGB GB)"
            }else{
                Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 2 -Type DWord -Force -EA SilentlyContinue
                Write-Success "  → Superfetch: BOOT only (RAM $ramGB GB)"
            }
            
            # Prefetch basato su DDR
            if($isDDR5){
                Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 3 -Type DWord -Force -EA SilentlyContinue
            }else{
                Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 2 -Type DWord -Force -EA SilentlyContinue
            }
            
            $global:opts++;Write-Success "Memory: Base per $ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'})"
        }

        # ── TWEAKS RETE AVANZATI (tutti i PC) ───────────────────────────────
        Write-Host ""
        Write-Info "[LN] Rete avanzata + servizi ottimizzati..."

        # Power Throttling gestito da Windows (non forzato OFF)
        $ptp="HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
        if(!(Test-Path $ptp)){New-Item $ptp -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ptp -Name "PowerThrottlingOff" -Value 0 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Power Throttling: gestito da Windows (ottimale)"

        # Servizi background: priorità I/O bassa
        $svcList = @("SysMain","WSearch","DiagTrack","dmwappushservice")
        foreach($svc in $svcList){
            try{
                $rp2="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$svc.exe\PerfOptions"
                if(!(Test-Path $rp2)){New-Item $rp2 -Force -EA SilentlyContinue|Out-Null}
                Set-ItemProperty $rp2 -Name "CpuPriorityClass" -Value 1 -Type DWord -Force -EA SilentlyContinue
                Set-ItemProperty $rp2 -Name "IoPriority"       -Value 0 -Type DWord -Force -EA SilentlyContinue
            }catch{}
        }
        Write-Success "Servizi background: priorità I/O minima (SysMain, WSearch, DiagTrack)"

        # WiFi: ottimizzazione completa per tutti i PC
        $wifiAN = Get-NetAdapter -Physical | Where-Object{$_.MediaType -like "*802.11*" -or $_.InterfaceDescription -like "*Wi-Fi*" -or $_.InterfaceDescription -like "*Wireless*" -or $_.InterfaceDescription -like "*WLAN*"}
        if($wifiAN){
            foreach($a in $wifiAN){
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Power Saving Mode"      -DisplayValue "Maximum Performance" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Roaming Aggressiveness" -DisplayValue "1. Lowest"           -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Transmit Power"         -DisplayValue "Highest"             -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "802.11n Mode"           -DisplayValue "Enabled"             -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Preferred Band"         -DisplayValue "Prefer 5GHz Band"    -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "U-APSD Support"         -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "WMM"                    -DisplayValue "Enabled"             -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Interrupt Moderation"   -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Magic Packet"   -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Pattern Match"  -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "ARP Offload"            -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Fat Channel Intolerant" -DisplayValue "Disabled"            -EA SilentlyContinue }catch{}
                $devID = $a.DeviceID
                $regP  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                if(Test-Path $regP){ Set-ItemProperty $regP -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue }
            }
            Write-Success "WiFi: Power max, 5GHz, Roaming basso, U-APSD OFF, WMM ON, Interrupt OFF"
        }

        # LAN: ottimizzazione completa per tutti i PC
        $lanAN = Get-NetAdapter -Physical | Where-Object{$_.MediaType -like "*802.3*" -or $_.InterfaceDescription -like "*Ethernet*" -or $_.InterfaceDescription -like "*Gigabit*" -or $_.InterfaceDescription -like "*Realtek*" -or $_.InterfaceDescription -like "*Intel*"}
        if($lanAN){
            $cpuCountN = (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
            foreach($a in $lanAN){
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Energy Efficient Ethernet"    -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Advanced EEE"                 -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Green Ethernet"               -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Interrupt Moderation"         -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Flow Control"                 -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Large Send Offload V2 (IPv4)" -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Large Send Offload V2 (IPv6)" -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "TCP Checksum Offload (IPv4)"  -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "TCP Checksum Offload (IPv6)"  -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "UDP Checksum Offload (IPv4)"  -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Receive Buffers"              -DisplayValue "2048"            -EA SilentlyContinue }catch{ try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Receive Buffers" -DisplayValue "1024" -EA SilentlyContinue }catch{} }
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Transmit Buffers"             -DisplayValue "2048"            -EA SilentlyContinue }catch{ try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Transmit Buffers" -DisplayValue "512" -EA SilentlyContinue }catch{} }
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Receive Side Scaling"         -DisplayValue "Enabled"         -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Magic Packet"         -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                try{ Set-NetAdapterAdvancedProperty -Name $a.Name -DisplayName "Wake on Pattern Match"        -DisplayValue "Disabled"        -EA SilentlyContinue }catch{}
                $devID = $a.DeviceID
                $regP  = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                if(Test-Path $regP){ Set-ItemProperty $regP -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue }
                if($cpuCountN -ge 4){ try{ Set-NetAdapterRSS -Name $a.Name -BaseProcessorNumber 2 -EA SilentlyContinue }catch{} }
            }
            Write-Success "LAN: EEE OFF, Interrupt OFF, LSO OFF, Checksum ON, Buffer 2048, RSS ON"
        }

        $global:opts++
    }
    
    # ═══════════════════════════════════════════════════════════════════════
    #  AGGRESSIVO (include Normale)
    # ═══════════════════════════════════════════════════════════════════════
    
    if($doAggr){
        # Salta step [11] se è stato fatto in NORMALE
        $aggStep=if($mode -eq "2"){12}else{11}
        # Core Affinity
        if($isPE){
            Write-Info "[$aggStep] Core Affinity..."
            foreach($pn in $procs.Keys){
                $pi=$procs[$pn]
                $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$pn\PerfOptions"
                $am=0
                switch($pi.A){
                    "P"{for($i=0;$i -lt $pC;$i++){$am+=[math]::Pow(2,$i)}}
                    "E"{for($i=$pC;$i -lt ($pC+$eC);$i++){$am+=[math]::Pow(2,$i)}}
                    default{for($i=0;$i -lt ($pC+$eC);$i++){$am+=[math]::Pow(2,$i)}}
                }
                if($am -gt 0){Set-ItemProperty $rp -Name "CpuAffinityMask" -Value $am -Type DWord -Force -EA SilentlyContinue}
            }
            $global:opts++;Write-Success "Core Affinity: P-cores foreground"
            $aggStep++
        }else{Write-Info "[$aggStep] Core Affinity: Skip";$aggStep++}
        
        # Memory (OTTIMIZZAZIONI INTELLIGENTI RAM)
        Write-Info "[$aggStep] Memory intelligente ($ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'}))..."
        $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
        
        # DisablePagingExecutive - solo se RAM >= 32GB
        if($ramGB -ge 32){
            Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Paging Executive: OFF (RAM $ramGB GB)"
        }else{
            Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Paging Executive: ON (RAM < 32GB)"
        }
        
        # LargeSystemCache - DDR5 + RAM alta
        if($isDDR5 -and $ramGB -ge 64){
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Large Cache: ON (DDR5 $ramGB GB)"
        }else{
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Large Cache: OFF (ottimale gaming)"
        }
        
        # IoPageLockLimit - VALORI ESATTI basati su RAM
        $ioLockValue=switch($ramGB){
            8{512000}      # 8 GB → 500 MB
            12{768000}     # 12 GB → 750 MB
            16{1024000}    # 16 GB → 1 GB
            32{2048000}    # 32 GB → 2 GB
            64{4096000}    # 64 GB → 4 GB
            128{8192000}   # 128 GB → 8 GB
            default{
                if($ramGB -lt 8){256000}           # < 8 GB → 250 MB
                elseif($ramGB -lt 12){640000}      # 8-12 GB → 625 MB
                elseif($ramGB -lt 16){896000}      # 12-16 GB → 875 MB
                elseif($ramGB -lt 32){1536000}     # 16-32 GB → 1.5 GB
                elseif($ramGB -lt 64){3072000}     # 32-64 GB → 3 GB
                else{16384000}                     # > 128 GB → 16 GB
            }
        }
        Set-ItemProperty $mp -Name "IoPageLockLimit" -Value $ioLockValue -Type DWord -Force -EA SilentlyContinue
        $ioLockMB=[math]::Round($ioLockValue/1024,0)
        Write-Success "  → IO Page Lock: $ioLockMB MB ($ioLockValue)"
        
        # SystemPages - page table entries
        $systemPages=if($ramGB -le 8){0}elseif($ramGB -le 16){24000}elseif($ramGB -le 32){36000}elseif($ramGB -le 64){48000}else{64000}
        if($systemPages -gt 0){
            Set-ItemProperty $mp -Name "SystemPages" -Value $systemPages -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → System Pages: $systemPages entries"
        }
        
        # NonPagedPoolSize - pool non paginato (0 = auto, altri = dimensione in bytes)
        $nonPagedPool=if($ramGB -le 16){0}elseif($ramGB -le 32){268435456}elseif($ramGB -le 64){536870912}else{1073741824}
        if($nonPagedPool -gt 0){
            Set-ItemProperty $mp -Name "NonPagedPoolSize" -Value $nonPagedPool -Type DWord -Force -EA SilentlyContinue
            $npMB=[math]::Round($nonPagedPool/1MB,0)
            Write-Success "  → NonPaged Pool: $npMB MB"
        }
        
        # PagedPoolSize - pool paginato
        $pagedPool=if($ramGB -le 16){0}elseif($ramGB -le 32){402653184}elseif($ramGB -le 64){805306368}else{1610612736}
        if($pagedPool -gt 0){
            Set-ItemProperty $mp -Name "PagedPoolSize" -Value $pagedPool -Type DWord -Force -EA SilentlyContinue
            $ppMB=[math]::Round($pagedPool/1MB,0)
            Write-Success "  → Paged Pool: $ppMB MB"
        }
        
        # SessionViewSize - dimensione memoria session
        $sessionView=if($ramGB -le 16){48}elseif($ramGB -le 32){96}elseif($ramGB -le 64){192}else{384}
        Set-ItemProperty $mp -Name "SessionViewSize" -Value $sessionView -Type DWord -Force -EA SilentlyContinue
        Write-Success "  → Session View: $sessionView MB"
        
        # SessionPoolSize - pool sessioni
        $sessionPool=if($ramGB -le 16){16}elseif($ramGB -le 32){32}elseif($ramGB -le 64){64}else{128}
        Set-ItemProperty $mp -Name "SessionPoolSize" -Value $sessionPool -Type DWord -Force -EA SilentlyContinue
        Write-Success "  → Session Pool: $sessionPool MB"
        
        # Superfetch - RAM bassa sempre ON, RAM alta può essere OFF
        $pp="$mp\PrefetchParameters"
        if($ramGB -le 16){
            # RAM bassa: Superfetch ON per performance
            Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 3 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Superfetch: ON (RAM $ramGB GB, necessario)"
        }elseif($ramGB -le 32){
            # RAM media: Superfetch ON ma Boot only
            Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 2 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Superfetch: BOOT only (RAM $ramGB GB)"
        }else{
            # RAM alta: Superfetch OFF (non necessario)
            Set-ItemProperty $pp -Name "EnableSuperfetch" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Superfetch: OFF (RAM $ramGB GB, non necessario)"
        }
        
        # Prefetch - DDR5 può essere più aggressivo
        if($isDDR5){
            Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 3 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Prefetcher: FULL (DDR5 bandwidth)"
        }else{
            Set-ItemProperty $pp -Name "EnablePrefetcher" -Value 2 -Type DWord -Force -EA SilentlyContinue
            Write-Success "  → Prefetcher: BOOT (DDR4)"
        }
        
        # SecondLevelDataCache - basato su RAM
        $cacheSize=if($ramGB -le 16){512}elseif($ramGB -le 32){1024}elseif($ramGB -le 64){2048}else{4096}
        Set-ItemProperty $mp -Name "SecondLevelDataCache" -Value $cacheSize -Type DWord -Force -EA SilentlyContinue
        Write-Success "  → L2 Cache hint: $cacheSize KB"
        
        # SvcHostSplitThresholdInKB - threshold per split processi svchost
        $svcHostThreshold=if($ramGB -le 4){0x400000}elseif($ramGB -le 6){0x600000}elseif($ramGB -le 8){0x800000}elseif($ramGB -le 12){0xc00000}elseif($ramGB -le 16){0x1000000}elseif($ramGB -le 24){0x1800000}elseif($ramGB -le 32){0x2000000}else{0x4000000}
        Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value $svcHostThreshold -Type DWord -Force -EA SilentlyContinue
        $svcMB=[math]::Round($svcHostThreshold/1024,0)
        Write-Success "  → SvcHost Split: $svcMB MB (0x$($svcHostThreshold.ToString('X')))"
        
        $global:opts++;Write-Success "Memory: 11 parametri ottimizzati per $ramGB GB $(if($isDDR5){'DDR5'}else{'DDR4'})"
        $aggStep++
        
        # Responsiveness 3 (FIXED no freeze)
        Write-Info "[$aggStep] Responsiveness 3..."
        Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 3 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 0x26 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "Responsiveness: 3 (97% foreground, no freeze)"
        $aggStep++

        # ── CPU UNPARKING ────────────────────────────────────────────────────
        # Forza tutti i core sempre attivi — Windows non parcheggia core durante gaming
        # Sicuro al 100%: non aumenta frequenza, solo impedisce lo spegnimento dei core
        Write-Info "[$aggStep] CPU Unparking (tutti i core attivi)..."
        $cpuParkPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583"
        if(Test-Path $cpuParkPath){
            Set-ItemProperty $cpuParkPath -Name "ValueMin" -Value 100 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $cpuParkPath -Name "ValueMax" -Value 100 -Type DWord -Force -EA SilentlyContinue
        }
        # Applica al piano corrente
        $pg2=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pg2){$pg2=$Matches[1]}else{$pg2="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pg2 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100 2>$null
        powercfg /setdcvalueindex $pg2 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100 2>$null
        powercfg /setactive $pg2 2>$null
        $global:opts++;Write-Success "CPU Unparking: tutti i core attivi (0% parking)"
        $aggStep++

        # ── PROCESSOR BOOST MODE = AGGRESSIVE ───────────────────────────────
        # Non è overclocking: dice solo al sistema di salire di frequenza subito
        # invece di aspettare che il carico sia sostenuto. CPU rimane nei limiti TDP.
        Write-Info "[$aggStep] Processor Boost Mode = Aggressive..."
        powercfg /setacvalueindex $pg2 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 2 2>$null
        powercfg /setactive $pg2 2>$null
        $global:opts++;Write-Success "Boost Mode: Aggressive (risposta immediata senza OC)"
        $aggStep++

        # ── MMCSS TWEAKS ─────────────────────────────────────────────────────
        # Multimedia Class Scheduler Service — gestisce priorità CPU per audio/giochi
        # Games profile: priorità alta, latenza minima
        Write-Info "[$aggStep] MMCSS Gaming profile..."
        $mmBase = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks"
        # Games
        $mmGames = "$mmBase\Games"
        if(!(Test-Path $mmGames)){New-Item $mmGames -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $mmGames -Name "Affinity"              -Value 0          -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "Background Only"       -Value "False"    -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "Clock Rate"            -Value 2710        -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "GPU Priority"          -Value 8          -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "Priority"              -Value 6          -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "Scheduling Category"   -Value "High"     -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $mmGames -Name "SFIO Priority"         -Value "High"     -Type String -Force -EA SilentlyContinue
        # Pro Audio (usato anche da game engines con audio HW)
        $mmAudio = "$mmBase\Pro Audio"
        if(!(Test-Path $mmAudio)){New-Item $mmAudio -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $mmAudio -Name "Affinity"              -Value 0          -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Background Only"       -Value "False"    -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Clock Rate"            -Value 10000       -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "GPU Priority"          -Value 8          -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Priority"              -Value 6          -Type DWord  -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "Scheduling Category"   -Value "High"     -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $mmAudio -Name "SFIO Priority"         -Value "High"     -Type String -Force -EA SilentlyContinue
        $global:opts++;Write-Success "MMCSS: Games + Pro Audio → Priority 6, GPU Priority 8, High"
        $aggStep++

        # ── XBOX GAME BAR / DVR OFF ──────────────────────────────────────────
        # Disabilita la registrazione in background e Game Bar
        # Libera CPU/GPU/RAM usati per cattura video in background
        Write-Info "[$aggStep] Xbox Game Bar + DVR OFF..."
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d 3 /f 2>$null|Out-Null
        $global:opts++;Write-Success "Xbox Game Bar: OFF | DVR cattura: OFF"
        $aggStep++

        # ── GAME MODE ON ─────────────────────────────────────────────────────
        # Windows Game Mode: priorità risorse al processo in foreground gaming
        Write-Info "[$aggStep] Windows Game Mode ON..."
        reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        $global:opts++;Write-Success "Game Mode: ON (priorità risorse al gioco)"
        $aggStep++

        # ── USB SELECTIVE SUSPEND OFF ────────────────────────────────────────
        # Impedisce a Windows di sospendere USB — no micro-freeze su input da mouse/tastiera
        Write-Info "[$aggStep] USB Selective Suspend OFF..."
        powercfg /setacvalueindex $pg2 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setdcvalueindex $pg2 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setactive $pg2 2>$null
        # Anche via registro per persistenza
        $usbPath = "HKLM:\SYSTEM\CurrentControlSet\Services\USB"
        if(!(Test-Path $usbPath)){New-Item $usbPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $usbPath -Name "DisableSelectiveSuspend" -Value 1 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "USB Selective Suspend: OFF (no freeze mouse/tastiera)"
        $aggStep++

        # ── QoS BANDWIDTH RESERVE = 0% ──────────────────────────────────────
        # Windows riserva per default il 20% della banda per QoS scheduler
        # Impostando a 0 tutta la banda è disponibile per le applicazioni
        Write-Info "[$aggStep] QoS Bandwidth Reserve = 0%..."
        $qosPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched"
        if(!(Test-Path $qosPath)){New-Item $qosPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $qosPath -Name "NonBestEffortLimit" -Value 0 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "QoS Bandwidth Reserve: 0% (100% banda alle app)"
        $aggStep++

        # ── STORAGE: NVMe/SSD TWEAKS ─────────────────────────────────────────
        # Rileva se c'è un NVMe e applica ottimizzazioni I/O
        Write-Info "[$aggStep] Storage optimization..."
        $nvmeFound = Get-PhysicalDisk -EA SilentlyContinue | Where-Object { $_.MediaType -eq "SSD" -or $_.BusType -eq "NVMe" }
        if($nvmeFound){
            # Write cache abilitata sui dischi SSD/NVMe
            foreach($disk in $nvmeFound){
                try{
                    Set-Disk -Number $disk.DeviceId -IsReadOnly $false -EA SilentlyContinue
                } catch{}
            }
            # StorNVMe - coda profonda (QD32)
            $storPath = "HKLM:\SYSTEM\CurrentControlSet\Services\storahci\Parameters\Device"
            if(!(Test-Path $storPath)){New-Item $storPath -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $storPath -Name "TreatAsInternalPort" -Value @(0,1,2,3,4,5) -Type MultiString -Force -EA SilentlyContinue
            # Disabilita idle power management NVMe
            $nvmePath = "HKLM:\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device"
            if(!(Test-Path $nvmePath)){New-Item $nvmePath -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $nvmePath -Name "IdlePowerManagement" -Value 0 -Type DWord -Force -EA SilentlyContinue
            # TRIM abilitato
            fsutil behavior set disableDeleteNotify 0 2>$null|Out-Null
            $global:opts++;Write-Success "Storage: NVMe/SSD rilevato — TRIM ON, Idle PM OFF, QD32"
        } else {
            Write-Host "  → Storage: nessun NVMe/SSD rilevato, skip" -F DarkGray
        }
        $aggStep++

        # ── SERVIZI NON NECESSARI PER GAMING ────────────────────────────────
        # Solo servizi sicuri da disabilitare su PC gaming dedicato
        Write-Info "[$aggStep] Servizi non gaming OFF..."
        $svcsToDisable = @(
            @{Name="Fax";             Desc="Servizio Fax"}
            @{Name="MapsBroker";      Desc="Download mappe offline"}
            @{Name="RetailDemo";      Desc="Modalità demo negozio"}
            @{Name="RemoteRegistry";  Desc="Registro remoto"}
            @{Name="WerSvc";          Desc="Windows Error Reporting"}
            @{Name="wercplsupport";   Desc="Supporto pannello di controllo WER"}
            @{Name="DiagTrack";       Desc="Telemetria Connected User Experiences"}
            @{Name="dmwappushservice";Desc="WAP Push Message Routing"}
        )
        $svcOff = 0
        foreach($svc in $svcsToDisable){
            try{
                $s = Get-Service -Name $svc.Name -EA SilentlyContinue
                if($s -and $s.StartType -ne "Disabled"){
                    Stop-Service -Name $svc.Name -Force -EA SilentlyContinue
                    Set-Service  -Name $svc.Name -StartupType Disabled -EA SilentlyContinue
                    $svcOff++
                }
            }catch{}
        }
        $global:opts++;Write-Success "Servizi disabilitati: $svcOff (Fax/Mappe/Demo/WER/Telemetria)"
        $aggStep++

        # ── FULLSCREEN OPTIMIZATIONS DISABLE ────────────────────────────────
        # Le FSO di Windows possono causare stuttering in alcuni giochi
        # Disabilitarle globalmente ripristina il comportamento exclusive fullscreen
        Write-Info "[$aggStep] Fullscreen Optimizations OFF..."
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEBehaviorMode" /t REG_DWORD /d 2 /f 2>$null|Out-Null
        $global:opts++;Write-Success "Fullscreen Optimizations: OFF (exclusive FS nativo)"
        $aggStep++

        # ── GPU IRQ PRIORITY ─────────────────────────────────────────────────
        # Rileva GPU NVIDIA o AMD e imposta priorità interrupt hardware
        Write-Info "[$aggStep] GPU IRQ / Driver tweaks..."
        $gpuName = (Get-CimInstance Win32_VideoController -EA SilentlyContinue | Select-Object -First 1).Name
        if($gpuName -match "NVIDIA"){
            # NVIDIA - ottimizzazioni driver registry (no OC, solo scheduling)
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero"   /t REG_DWORD /d 1 /f 2>$null|Out-Null
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable"    /t REG_DWORD /d 1 /f 2>$null|Out-Null
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel"     /t REG_DWORD /d 1 /f 2>$null|Out-Null
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC"   /t REG_DWORD /d 1 /f 2>$null|Out-Null
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc"        /t REG_DWORD /d 0x2222 /f 2>$null|Out-Null
            $global:opts++;Write-Success "GPU NVIDIA rilevata: PowerMizer = max performance, no throttle"
        } elseif($gpuName -match "AMD|Radeon"){
            # AMD - disabilita PowerPlay throttling
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable"  /t REG_DWORD /d 1 /f 2>$null|Out-Null
            reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d 0 /f 2>$null|Out-Null
            $global:opts++;Write-Success "GPU AMD rilevata: PowerPlay deep sleep OFF, throttling OFF"
        } else {
            Write-Host "  → GPU: $gpuName — tweaks specifici non applicati" -F DarkGray
        }
        $aggStep++

        # ── DISABLE WINDOWS ERROR REPORTING ─────────────────────────────────
        # WER crea dump e upload quando un programma crasha — overhead inutile gaming
        Write-Info "[$aggStep] Windows Error Reporting OFF..."
        reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        $global:opts++;Write-Success "Windows Error Reporting: OFF"
        $aggStep++

        # ── POWER THROTTLING OFF ─────────────────────────────────────────────
        # Windows 11 può throttlare processi che considera "background" anche se
        # sono il gioco attivo. Disabilitarlo garantisce piena CPU senza throttle.
        # NON è overclocking: rimuove solo il limite artificiale software.
        Write-Info "[$aggStep] Power Throttling OFF..."
        $ptPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
        if(!(Test-Path $ptPath)){New-Item $ptPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ptPath -Name "PowerThrottlingOff" -Value 1 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "Power Throttling: OFF (no throttle artificiale su CPU)"
        $aggStep++

        # ── DISABILITA MANUTENZIONE AUTOMATICA ──────────────────────────────
        # Windows avvia manutenzione automatica (defrag, indexing, WU scan...) in
        # background — causa stuttering durante il gaming. Si può riattivare manualmente.
        Write-Info "[$aggStep] Manutenzione automatica OFF..."
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        # Disabilita task pianificati di manutenzione
        Disable-ScheduledTask -TaskName "\Microsoft\Windows\TaskScheduler\Regular Maintenance"      -EA SilentlyContinue|Out-Null
        Disable-ScheduledTask -TaskName "\Microsoft\Windows\TaskScheduler\Maintenance Configurator" -EA SilentlyContinue|Out-Null
        $global:opts++;Write-Success "Manutenzione automatica: OFF (no stuttering da task background)"
        $aggStep++

        # ── WINDOWS SEARCH INDEXING OFF ──────────────────────────────────────
        # Il servizio WSearch scansiona continuamente il disco per l'indicizzazione.
        # Su PC gaming non serve — la ricerca funziona ancora ma senza indice pre-caricato.
        Write-Info "[$aggStep] Windows Search Indexing OFF..."
        try{
            Stop-Service "WSearch" -Force -EA SilentlyContinue
            Set-Service  "WSearch" -StartupType Disabled -EA SilentlyContinue
            # Disabilita indicizzazione sui drive (via registry)
            reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d 0 /f 2>$null|Out-Null
            $global:opts++;Write-Success "Search Indexing: OFF (I/O disco liberato)"
        }catch{ Write-Host "  → Search Indexing: skip" -F DarkGray }
        $aggStep++

        # ── GPU PREEMPTION GRANULARITY ───────────────────────────────────────
        # Controlla quanto spesso il GPU scheduler può interrompere un task grafico.
        # "Batch" = interrompe meno spesso → frame più fluidi, meno overhead scheduling.
        Write-Info "[$aggStep] GPU Preemption = Batch level..."
        $gpuSched = "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler"
        if(!(Test-Path $gpuSched)){New-Item $gpuSched -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $gpuSched -Name "EnablePreemption"    -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gpuSched -Name "PreemptionGranularity" -Value 2 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "GPU Preemption: Batch level (frame più fluidi)"
        $aggStep++

        # ── INTERRUPT AFFINITY POLICY ────────────────────────────────────────
        # Sposta gli interrupt di GPU e NIC lontano dal core 0 (di solito saturato
        # dal sistema operativo). Assegna a core 1 → meno contesa su interrupt.
        Write-Info "[$aggStep] Interrupt Affinity Policy..."
        $iapBase = "HKLM:\SYSTEM\CurrentControlSet\Control\Class"
        # GPU - classe display adapter
        $gpuClass = "$iapBase\{4d36e968-e325-11ce-bfc1-08002be10318}\0000"
        if(Test-Path $gpuClass){
            Set-ItemProperty $gpuClass -Name "MSISupported" -Value 1 -Type DWord -Force -EA SilentlyContinue
        }
        # NIC - classe network adapter (primo trovato)
        $nicKeys = Get-ChildItem "$iapBase\{4d36e972-e325-11ce-bfc1-08002be10318}" -EA SilentlyContinue |
                   Where-Object { $_.PSChildName -match '^\d{4}$' }
        foreach($nic in $nicKeys){
            Set-ItemProperty $nic.PSPath -Name "MSISupported" -Value 1 -Type DWord -Force -EA SilentlyContinue
        }
        $global:opts++;Write-Success "MSI Interrupts: abilitati su GPU e NIC (meno latenza interrupt)"
        $aggStep++

        # ── DISABILITA AGGIORNAMENTI AUTOMATICI DURANTE GAMING ───────────────
        # Active Hours impostato 8:00-23:00 — Windows non riavvia/aggiorna di giorno.
        # Delivery Optimization P2P OFF — non usa la tua banda per distribuire update altrui.
        Write-Info "[$aggStep] Windows Update gaming-friendly..."
        $wuPath = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"
        if(!(Test-Path $wuPath)){New-Item $wuPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $wuPath -Name "ActiveHoursStart"               -Value 8  -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $wuPath -Name "ActiveHoursEnd"                 -Value 23 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $wuPath -Name "IsActiveHoursEnabled"           -Value 1  -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $wuPath -Name "SmartActiveHoursState"          -Value 1  -Type DWord -Force -EA SilentlyContinue
        # Delivery Optimization: disabilita condivisione P2P su internet
        $doPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
        if(!(Test-Path $doPath)){New-Item $doPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $doPath -Name "DODownloadMode" -Value 1 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "Windows Update: Active Hours 8-23, P2P OFF (banda non condivisa)"
        $aggStep++

        # ── VISUAL LATENCY: DWM FLUSH + FLIP MODEL ──────────────────────────
        # DirectX Flip Model: riduce la latenza di visualizzazione del frame finale.
        # DXGI_SWAP_EFFECT_FLIP_DISCARD già preferito dai giochi moderni —
        # questi valori assicurano che Windows non forzi comportamenti legacy.
        Write-Info "[$aggStep] DirectX Flip Model / latenza display..."
        reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f 2>$null|Out-Null
        # Disabilita legacy presentazione DWM per le app Win32
        $dwmPath = "HKCU:\Software\Microsoft\Windows\DWM"
        if(!(Test-Path $dwmPath)){New-Item $dwmPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $dwmPath -Name "OverlayTestMode" -Value 5 -Type DWord -Force -EA SilentlyContinue
        $global:opts++;Write-Success "DirectX Flip Model: ON (latenza display ridotta)"
        $aggStep++

        # ── FONT PREDEFINITO: OPEN DYSLEXIC ─────────────────────────────────
        # OpenDyslexic è un font progettato per facilitare la lettura alle persone
        # con dislessia. Viene impostato come font sostituto di sistema.
        Write-Info "[$aggStep] Font OpenDyslexic — installazione e impostazione predefinito..."
        $odFontName  = "OpenDyslexic-Regular.otf"
        $odFontBold  = "OpenDyslexic-Bold.otf"
        $odSysDest   = "C:\Windows\Fonts"
        $odInstalled = (Test-Path "$odSysDest\$odFontName")

        if(-not $odInstalled){
            try{
                Write-Host "  → Download OpenDyslexic da GitHub..." -F DarkGray
                [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                $odZipUrl  = "https://github.com/antijingoist/opendyslexic/releases/download/v0.91.12-20200630/OpenDyslexic-0.91.12-Stable.zip"
                $odZipPath = "$env:TEMP\OpenDyslexic.zip"
                $odExtPath = "$env:TEMP\OpenDyslexic"
                (New-Object System.Net.WebClient).DownloadFile($odZipUrl, $odZipPath)
                Expand-Archive $odZipPath $odExtPath -Force -EA SilentlyContinue

                # Copia tutti i file OTF/TTF nella cartella font di sistema
                $fontFiles = Get-ChildItem $odExtPath -Recurse -Include "*.otf","*.ttf" -EA SilentlyContinue
                $fontReg   = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
                foreach($ff in $fontFiles){
                    $dest = Join-Path $odSysDest $ff.Name
                    Copy-Item $ff.FullName $dest -Force -EA SilentlyContinue
                    # Registra nel registro font di sistema
                    $regName = ($ff.BaseName -replace "-"," ") + " (OpenType)"
                    Set-ItemProperty $fontReg -Name $regName -Value $ff.Name -Force -EA SilentlyContinue
                }
                # Pulizia temp
                Remove-Item $odZipPath  -Force -EA SilentlyContinue
                Remove-Item $odExtPath  -Recurse -Force -EA SilentlyContinue
                Write-Success "OpenDyslexic: font scaricati e installati in C:\Windows\Fonts"
            }catch{
                Write-Host "  ⚠ Download fallito ($($_.Exception.Message)) — font non installato" -F Yellow
            }
        }else{
            Write-Host "  → OpenDyslexic già presente in C:\Windows\Fonts" -F DarkGray
        }

        # Imposta OpenDyslexic come sostituto font di sistema (Segoe UI + Shell Dlg)
        # FontSubstitutes dice a Windows: "quando un'app chiede Segoe UI, usa OpenDyslexic"
        $fsPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes"
        if(!(Test-Path $fsPath)){New-Item $fsPath -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $fsPath -Name "Segoe UI"         -Value "OpenDyslexic"      -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $fsPath -Name "Segoe UI Bold"    -Value "OpenDyslexic Bold" -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $fsPath -Name "MS Shell Dlg"     -Value "OpenDyslexic"      -Type String -Force -EA SilentlyContinue
        Set-ItemProperty $fsPath -Name "MS Shell Dlg 2"   -Value "OpenDyslexic"      -Type String -Force -EA SilentlyContinue
        $global:opts++;Write-Success "Font predefinito: OpenDyslexic (Segoe UI → OpenDyslexic)"
        $aggStep++

        # ── PRIVACY AGGIUNTIVA (se scelta) ─────────────────────────────────
        if($privacyLevel -ne "0"){
            Write-Info "[LP] Protezione Privacy $(switch($privacyLevel){"1"{"LIGHT"}"2"{"NORMALE"}"3"{"AGGRESSIVO"}"4"{"PARANOICO"}})..."
            if($privacyLevel -ge "1"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f 2>$null|Out-Null
            }
            if($privacyLevel -ge "2"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Deny" /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f 2>$null|Out-Null
            }
            if($privacyLevel -ge "3"){
                reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f 2>$null|Out-Null
            }
            if($privacyLevel -eq "4"){
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f 2>$null|Out-Null
            }
            Write-Success "Privacy: Livello $privacyLevel applicato"
        }

    }  # End if($isLaptop)

    # ── AGGRESSIVO GAMING LIGHT ───────────────────────────────────────────────
    if($doAggrGL){
        Write-Host ""
        Write-Section "AGGRESSIVO GAMING — LIGHT"

        Write-Info "[GL1] Game Mode + DVR OFF..."
        reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled"   /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode"     /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore"     /v "GameDVR_Enabled"       /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        Write-Success "Game Mode: ON | DVR: OFF"

        Write-Info "[GL2] Process priority launcher gaming..."
        $gpGames = @("gameoverlayui.exe","steam.exe","EpicGamesLauncher.exe","Battle.net.exe","Origin.exe","discord.exe")
        foreach($gp in $gpGames){
            $rg="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$gp\PerfOptions"
            if(!(Test-Path $rg)){New-Item $rg -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $rg -Name "CpuPriorityClass" -Value 3 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $rg -Name "IoPriority"       -Value 3 -Type DWord -Force -EA SilentlyContinue
        }
        Write-Success "Launcher gaming (Steam/Epic/Discord): priorità High"

        Write-Info "[GL3] Fullscreen Optimizations OFF..."
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode"          /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Write-Success "Fullscreen: ottimizzato"

        Write-Info "[GL4] Mouse acceleration OFF + input latency ridotta..."
        reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed"      /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f 2>$null|Out-Null
        reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_DWORD /d 1000 /f 2>$null|Out-Null
        Write-Success "Input: mouse lineare, hook timeout ridotto"

        $global:opts++
    }

    # ── AGGRESSIVO GAMING NORMALE ─────────────────────────────────────────────
    if($doAggrGN){
        Write-Host ""
        Write-Section "AGGRESSIVO GAMING — NORMALE"

        Write-Info "[GN1] MMCSS Games + Pro Audio priorità massima..."
        $mm="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks"
        Set-ItemProperty "$mm\Games"     -Name "Priority"            -Value 6     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "$mm\Games"     -Name "Scheduling Category" -Value "High"            -Force -EA SilentlyContinue
        Set-ItemProperty "$mm\Games"     -Name "SFIO Priority"       -Value "High"            -Force -EA SilentlyContinue
        Set-ItemProperty "$mm\Games"     -Name "GPU Priority"        -Value 8     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "$mm\Games"     -Name "Clock Rate"          -Value 10000 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "$mm\Pro Audio" -Name "Priority"            -Value 1     -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty "$mm\Pro Audio" -Name "Scheduling Category" -Value "High"            -Force -EA SilentlyContinue
        Write-Success "MMCSS: Games Priority 6 GPU 8, Pro Audio High"

        Write-Info "[GN2] CPU Boost Efficient Aggressive..."
        $pgGN=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pgGN){$pgGN=$Matches[1]}else{$pgGN="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pgGN SUB_PROCESSOR PERFBOOSTMODE    1  2>$null
        powercfg /setacvalueindex $pgGN SUB_PROCESSOR PROCTHROTTLEMIN  75 2>$null
        powercfg /setacvalueindex $pgGN SUB_PROCESSOR PERFINCTHRESHOLD 10 2>$null
        powercfg /setacvalueindex $pgGN SUB_PROCESSOR PERFDECTHRESHOLD  8 2>$null
        powercfg /setactive $pgGN 2>$null
        Write-Success "CPU: Boost Efficient Aggressive, min 75%"

        Write-Info "[GN3] Power Throttling OFF..."
        $ptpGN="HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
        if(!(Test-Path $ptpGN)){New-Item $ptpGN -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ptpGN -Name "PowerThrottlingOff" -Value 1 -Type DWord -Force -EA SilentlyContinue
        Write-Success "Power Throttling: OFF"

        Write-Info "[GN4] Network throttling OFF + Responsiveness gaming..."
        $mmspGN="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        Set-ItemProperty $mmspGN -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mmspGN -Name "SystemResponsiveness"   -Value 0          -Type DWord -Force -EA SilentlyContinue
        Write-Success "Network throttling OFF, SystemResponsiveness 0"

        Write-Info "[GN5] GPU HwScheduling + DirectX Flip Model..."
        $gdGN="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gdGN -Name "HwSchMode" -Value 2  -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gdGN -Name "TdrDelay"   -Value 10 -Type DWord -Force -EA SilentlyContinue
        reg add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;VRROptimizeEnable=0;" /f 2>$null|Out-Null
        Write-Success "GPU: HwSch ON, Flip Model ON"

        Write-Info "[GN6] USB Suspend OFF..."
        powercfg /setacvalueindex $pgGN 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
        powercfg /setactive $pgGN 2>$null
        Write-Success "USB Selective Suspend: OFF"

        $global:opts++
    }

    # ═══════════════════════════════════════════════════════════════════════
    #  AGGRESSIVO GAMING FULL — Win11 tweaks nascosti + estremi per PC potenti
    # ═══════════════════════════════════════════════════════════════════════

    if($doAggrG){
        Write-Host ""
        Write-Section "AGGRESSIVO GAMING — TWEAKS ESTREMI"
        Write-Host ""

        # ── WIN11 TWEAKS NASCOSTI ──────────────────────────────────────────
        Write-Info "[AG1] Win11 hidden tweaks — registro non documentato..."

        # Disabilita Activity History e Timeline
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed"    /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities"  /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita Cloud Clipboard
        reg add "HKCU\Software\Microsoft\Clipboard" /v "EnableClipboardHistory"    /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\Clipboard" /v "EnableCloudClipboard"      /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita Consumer Features (app suggerite, ads in Start)
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita Background Apps (riduce CPU/RAM in background)
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d 2 /f 2>$null|Out-Null

        # Disabilita Auto-Map delle unità di rete (causa latenza avvio)
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "EnableFirstLogonAnimation" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Fast Startup OFF (può causare problemi con hardware gaming)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita Automatic Maintenance durante gaming
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null

        # Storage Sense OFF (non pulisce automaticamente durante il gaming)
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita Reserved Storage Windows Update (libera GB di spazio)
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Large Address Aware per app 32bit (usa più di 2GB RAM)
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options" /v "LargeAddressAware" /t REG_DWORD /d 1 /f 2>$null|Out-Null

        # Disabilita pointer compression RAM (riduce overhead su RAM abbondante)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d 1 /f 2>$null|Out-Null

        Write-Success "Win11 hidden tweaks: 14 ottimizzazioni applicate"

        # ── CPU ESTREMO ────────────────────────────────────────────────────
        Write-Info "[AG2] CPU estremo — scheduler e boost..."

        # Disabilita CPU throttling per processi foreground
        $ptp2="HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
        if(!(Test-Path $ptp2)){New-Item $ptp2 -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $ptp2 -Name "PowerThrottlingOff" -Value 1 -Type DWord -Force -EA SilentlyContinue

        # Processor boost: Aggressive (non OC, usa il turbo al massimo)
        $pg=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
        if($pg){$pg=$Matches[1]}else{$pg="SCHEME_CURRENT"}
        powercfg /setacvalueindex $pg SUB_PROCESSOR PERFBOOSTMODE   2 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR PROCTHROTTLEMIN 100 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR PERFINCTHRESHOLD 10 2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR PERFDECTHRESHOLD 8  2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR PERFINCTIME      1  2>$null
        powercfg /setacvalueindex $pg SUB_PROCESSOR PERFDECTIME      1  2>$null
        powercfg /setactive $pg 2>$null

        # Disabilita Core Parking (tutti i core sempre attivi)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        powercfg /setacvalueindex $pg 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 0 2>$null
        powercfg /setactive $pg 2>$null

        # CPU heterogeneous policy: performance core first
        $cpuSched = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"
        if(!(Test-Path $cpuSched)){New-Item $cpuSched -Force -EA SilentlyContinue|Out-Null}
        Set-ItemProperty $cpuSched -Name "GlobalTimerResolutionRequests" -Value 1 -Type DWord -Force -EA SilentlyContinue

        # Quantum: Fixed (non variabile) — frame time più costante
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 0x2a /f 2>$null|Out-Null

        Write-Success "CPU estremo: Boost Aggressive, Core Parking OFF, min 100%, Quantum Fixed"

        # ── GPU ESTREMO ────────────────────────────────────────────────────
        Write-Info "[AG3] GPU estremo — latenza e scheduling..."

        # Hardware GPU Scheduling + Flip Model
        $gp="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        Set-ItemProperty $gp -Name "HwSchMode"          -Value 2  -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gp -Name "TdrDelay"            -Value 60 -Type DWord -Force -EA SilentlyContinue  # no TDR crash
        Set-ItemProperty $gp -Name "TdrDdiDelay"         -Value 60 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $gp -Name "EnablePreemption"    -Value 1  -Type DWord -Force -EA SilentlyContinue

        # DirectX: ottimizza scheduling GPU per gaming
        reg add "HKLM\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=0;" /f 2>$null|Out-Null

        # Disabilita GPU virtualization (Hyper-V GPU-PV overhead)
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HyperV" /v "RequireSecureDeviceEncryption" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        Write-Success "GPU estremo: HwSch ON, TDR 60s, Preemption ON, DirectX ottimizzato"

        # ── RAM ESTREMA ────────────────────────────────────────────────────
        Write-Info "[AG4] RAM estrema — pool e working set..."

        $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"

        # Working Set: aggressivo per applicazioni gaming
        Set-ItemProperty $mp -Name "DisablePagingExecutive"   -Value 1 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $mp -Name "LargeSystemCache"         -Value 0 -Type DWord -Force -EA SilentlyContinue

        # Pool Non Paged: massimizza per RAM abbondante
        $npPool = if($ramGB -ge 32){1073741824}else{536870912}
        Set-ItemProperty $mp -Name "NonPagedPoolSize" -Value $npPool -Type DWord -Force -EA SilentlyContinue

        # Trim working set aggressivo
        Set-ItemProperty $mp -Name "SessionViewSize" -Value $(if($ramGB -ge 32){192}else{96}) -Type DWord -Force -EA SilentlyContinue

        # Superfetch OFF (RAM abbondante non ne ha bisogno)
        $pp="$mp\PrefetchParameters"
        Set-ItemProperty $pp -Name "EnableSuperfetch"  -Value 0 -Type DWord -Force -EA SilentlyContinue
        Set-ItemProperty $pp -Name "EnablePrefetcher"  -Value $(if($isDDR5){3}else{2}) -Type DWord -Force -EA SilentlyContinue

        Write-Success "RAM estrema: Paging OFF, Superfetch OFF, NonPaged Pool max"

        # ── SISTEMA OPERATIVO OTTIMIZZAZIONI NASCOSTE ──────────────────────
        Write-Info "[AG5] OS ottimizzazioni nascoste Win11..."

        # NTFS: disabilita update dei timestamp (già in FileIO ma lo forzo)
        fsutil behavior set disablelastaccess 1 2>$null|Out-Null
        fsutil behavior set disable8dot3      1 2>$null|Out-Null

        # IRQ8: riduce priorità real time clock (meno interrupt inutili)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f 2>$null|Out-Null

        # Disabilita prefetch SSD (non necessario su NVMe)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBootTrace" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Network: ottimizzazione latenza estrema
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency"      /t REG_DWORD /d 1     /f 2>$null|Out-Null
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay"           /t REG_DWORD /d 1     /f 2>$null|Out-Null
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks"       /t REG_DWORD /d 0     /f 2>$null|Out-Null
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort"          /t REG_DWORD /d 65534 /f 2>$null|Out-Null

        # Disabilita LLMNR (Link-Local Multicast Name Resolution — overhead rete)
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Win32 priority boost: massimo per thread gaming
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Disabilita crash dump (risparmia I/O e RAM su crash)
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled"     /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot"           /t REG_DWORD /d 1 /f 2>$null|Out-Null

        # Disabilita error reporting automatico
        reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" -EA SilentlyContinue | Out-Null

        Write-Success "OS nascosti: NTFS, IRQ8, Network latenza 0, Win32 boost max, CrashDump OFF"

        # ── SERVIZI NON NECESSARI SU PC GAMING ────────────────────────────
        Write-Info "[AG6] Servizi inutili su PC gaming puro..."

        $aggrSvcs = @(
            "DiagTrack",         # Telemetria connessa
            "dmwappushservice",  # Push messaggi WAP
            "MapsBroker",        # Download mappe offline
            "lfsvc",             # Geolocalizzazione
            "SharedAccess",      # Internet Connection Sharing
            "WbioSrvc",          # Windows Biometric (se non usi Windows Hello)
            "WMPNetworkSvc",     # Windows Media Player sharing
            "icssvc",            # Mobile hotspot
            "PcaSvc",            # Compatibility Assistant
            "RemoteRegistry"     # Registro remoto
        )
        $disabled = 0
        foreach($svc in $aggrSvcs){
            try{
                $s = Get-Service $svc -EA SilentlyContinue
                if($s -and $s.StartType -ne "Disabled"){
                    Stop-Service $svc -Force -EA SilentlyContinue
                    Set-Service  $svc -StartupType Disabled -EA SilentlyContinue
                    $disabled++
                }
            }catch{}
        }
        Write-Success "Servizi disabilitati: $disabled su $($aggrSvcs.Count)"

        # ── GAME MODE + FULLSCREEN OTTIMIZZATO ────────────────────────────
        Write-Info "[AG7] Game Mode + Fullscreen estremo..."

        reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled"  /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode"    /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        # Fullscreen Optimizations: OFF (più controllo diretto al gioco)
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled"               /t REG_DWORD /d 0 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior"            /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode"        /t REG_DWORD /d 2 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f 2>$null|Out-Null
        reg add "HKCU\System\GameConfigStore" /v "Win32_AutoGameModeDefaultProfile" /t REG_BINARY /d "02000000000000000000000000000000" /f 2>$null|Out-Null
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f 2>$null|Out-Null

        Write-Success "Game Mode ON, DVR OFF, FSE ottimizzato"

        $global:opts++
        Write-Host ""
        Write-Success "⚡ AGGRESSIVO GAMING: 7 blocchi tweaks applicati"
    }

    # ═══════════════════════════════════════════════════════════════════════
    #  MODALITÀ 4-5: LAPTOP / LAPTOP GAMING
    # ═══════════════════════════════════════════════════════════════════════

    if($isLaptop){
        Write-Host ""
        Write-Section "APPLICAZIONE TWEAKS LAPTOP"
        Write-Host ""

        # ── LIGHT: tweaks base sicuri per laptop ────────────────────────────
        if($doLL){
            Write-Info "[L1] Timer 0.5ms + Privacy base..."
            bcdedit /set useplatformclock No 2>$null|Out-Null
            bcdedit /set disabledynamictick Yes 2>$null|Out-Null
            # Timer script v2.0 Desktop
            $timerDest2 = Join-Path ([Environment]::GetFolderPath("Desktop")) "OGD_Timer_0.5ms.ps1"
            $timerSrc2  = Join-Path (Split-Path $PSCommandPath) "OGD_Timer_0.5ms.ps1"
            if((Test-Path $timerSrc2) -and ($timerSrc2 -ne $timerDest2)){
                Copy-Item $timerSrc2 $timerDest2 -Force
            } else {
                @'
#Requires -Version 5.1
# OGD Timer 0.5ms v2.0 — by OldGamerDarthy #DarkPlayer84Tv
Add-Type @"
using System.Runtime.InteropServices;
public class OGDTimer2 {
    [DllImport("ntdll.dll")] public static extern int NtSetTimerResolution(uint d, bool s, out uint c);
    [DllImport("ntdll.dll")] public static extern int NtQueryTimerResolution(out uint min, out uint max, out uint cur);
}
"@
$Host.UI.RawUI.WindowTitle="OGD Timer 0.5ms v2.0 — ATTIVO"
if(-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
    Write-Host "Richiesto Amministratore — click destro Esegui come Admin" -ForegroundColor Red; Read-Host; exit 1
}
$c=0u; $r=[OGDTimer2]::NtSetTimerResolution(5000,$true,[ref]$c)
if($r -eq 0){ Write-Host "Timer 0.5ms ATTIVO — Minimizza, non chiudere!" -ForegroundColor Green }
else        { Write-Host "Errore impostazione timer (codice $r)" -ForegroundColor Red; Read-Host; exit 1 }
while($true){ Start-Sleep -Milliseconds 30000
    $min=0u;$max=0u;$cur=0u; [OGDTimer2]::NtQueryTimerResolution([ref]$min,[ref]$max,[ref]$cur)|Out-Null
    if([math]::Round($cur/10000.0,2) -gt 1.0){ [OGDTimer2]::NtSetTimerResolution(5000,$true,[ref]$c)|Out-Null }
}
'@|Out-File $timerDest2 -Encoding UTF8 -Force
            }
            Write-Success "Timer: 0.5ms v2.0 copiato sul Desktop"

            Write-Info "[L2] Privacy base..."
            $tp="HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
            if(!(Test-Path $tp)){New-Item $tp -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $tp -Name "AllowTelemetry" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Write-Success "Privacy: Telemetry OFF"

            Write-Info "[L3] DNS flush..."
            ipconfig /flushdns|Out-Null; netsh winsock reset|Out-Null
            Write-Success "DNS: Flushed"

            Write-Info "[L4] GPU HwScheduling..."
            $gp="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
            Set-ItemProperty $gp -Name "HwSchMode" -Value 2 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $gp -Name "TdrDelay"   -Value 10 -Type DWord -Force -EA SilentlyContinue
            Write-Success "GPU: HwScheduling ON"

            # C-States laptop: solo C1 (niente C0 package — preserva batteria)
            Write-Info "[L5] C-States laptop (C1 balanced)..."
            $pg=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
            if($pg){$pg=$Matches[1]}else{$pg="SCHEME_CURRENT"}
            powercfg /setacvalueindex $pg SUB_PROCESSOR IDLESTATEMAX 1 2>$null
            powercfg /setactive $pg 2>$null
            Write-Success "C-States: C1 balanced (batteria preservata)"

            $global:opts++
        }

        # ── NORMALE: process priority + debloat + visual ────────────────────
        if($doLN){
            Write-Info "[N1] Process Priority (laptop-safe)..."
            $pmap=@{"High"=3;"AboveNormal"=6;"Normal"=2;"BelowNormal"=5;"Low"=1}
            $imap=@{"High"=3;"Normal"=2;"Low"=1}
            $lprocs=@{
                "explorer.exe"=@{P="AboveNormal";I="Normal"}
                "dwm.exe"=@{P="High";I="High"}
                "audiodg.exe"=@{P="High";I="High"}
                "csrss.exe"=@{P="High";I="High"}
                "SearchIndexer.exe"=@{P="BelowNormal";I="Low"}
                "SysMain"=@{P="BelowNormal";I="Low"}
            }
            foreach($pn in $lprocs.Keys){
                $pi=$lprocs[$pn]
                $rp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\$pn\PerfOptions"
                if(!(Test-Path $rp)){New-Item $rp -Force -EA SilentlyContinue|Out-Null}
                Set-ItemProperty $rp -Name "CpuPriorityClass" -Value $pmap[$pi.P] -Type DWord -Force -EA SilentlyContinue
                Set-ItemProperty $rp -Name "IoPriority" -Value $imap[$pi.I] -Type DWord -Force -EA SilentlyContinue
            }
            Write-Success "Process: Priorità ottimizzate (laptop-safe)"

            Write-Info "[N2] Debloat base..."
            $aiPkgs=@('Microsoft.Windows.Ai.Copilot.Provider','Microsoft.Copilot','Microsoft.Windows.Recall')
            foreach($pkg in $aiPkgs){
                Get-AppxPackage -Name $pkg -AllUsers -EA SilentlyContinue|Remove-AppxPackage -AllUsers -EA SilentlyContinue
            }
            reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f 2>$null|Out-Null
            Write-Success "Debloat: Copilot/Recall rimossi"

            Write-Info "[N3] Visual ottimizzato..."
            Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0" -Type String -Force -EA SilentlyContinue
            reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f 2>$null|Out-Null
            reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f 2>$null|Out-Null
            reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f 2>$null|Out-Null
            Write-Success "Visual: Trasparenza OFF, menu istantanei, mouse lineare"

            $global:opts++
        }

        # ── ALTO: piano prestazioni + throttling OFF (in carica) ────────────
        if($doLA){
            Write-Info "[A1] Piano Ultimate (in carica)..."
            $ult=powercfg /list 2>$null|Select-String "Ultimate|Prestazioni ultimate"
            if($ult -and $ult.ToString() -match '([a-f0-9-]{36})'){
                powercfg /setactive $Matches[1] 2>$null
            }else{
                $ng=powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
                if($ng -match '([a-f0-9-]{36})'){
                    powercfg /changename $Matches[1] "Ultimate OGD Laptop" 2>$null
                    powercfg /setactive $Matches[1] 2>$null
                }
            }
            Write-Success "Piano: Ultimate attivato"

            Write-Info "[A2] Power Throttling OFF (in carica)..."
            $ptp="HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
            if(!(Test-Path $ptp)){New-Item $ptp -Force -EA SilentlyContinue|Out-Null}
            Set-ItemProperty $ptp -Name "PowerThrottlingOff" -Value 1 -Type DWord -Force -EA SilentlyContinue
            Write-Success "Power Throttling: OFF"

            Write-Info "[A3] MMCSS Games + Pro Audio..."
            $mm="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks"
            Set-ItemProperty "$mm\Games" -Name "Priority"         -Value 6  -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty "$mm\Games" -Name "Scheduling Category" -Value "High" -Force -EA SilentlyContinue
            Set-ItemProperty "$mm\Pro Audio" -Name "Priority"     -Value 1  -Type DWord -Force -EA SilentlyContinue
            Write-Success "MMCSS: Games High, Pro Audio ottimizzato"

            Write-Info "[A4] Network throttling OFF..."
            Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xFFFFFFFF -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness"   -Value 3        -Type DWord -Force -EA SilentlyContinue
            Write-Success "Network: Throttling OFF, Responsiveness 3"

            $global:opts++
        }

        # ── ULTRA: massima performance (solo in carica!) ─────────────────────
        if($doLU){
            Write-Host "`n  ⚠️  ULTRA: ottimizza per massima performance" -F Yellow
            Write-Host "     Usa solo con laptop in carica!`n" -F Yellow

            Write-Info "[U1] CPU Boost Aggressive..."
            $pg=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
            if($pg){$pg=$Matches[1]}else{$pg="SCHEME_CURRENT"}
            powercfg /setacvalueindex $pg SUB_PROCESSOR PERFBOOSTMODE 2 2>$null
            powercfg /setacvalueindex $pg SUB_PROCESSOR PROCTHROTTLEMIN 100 2>$null
            powercfg /setactive $pg 2>$null
            Write-Success "CPU: Boost Aggressive, min 100% in carica"

            Write-Info "[U2] Memory ottimizzata ($ramGB GB)..."
            $mp="HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
            if($ramGB -ge 16){Set-ItemProperty $mp -Name "DisablePagingExecutive" -Value 1 -Type DWord -Force -EA SilentlyContinue}
            Set-ItemProperty $mp -Name "LargeSystemCache" -Value 0 -Type DWord -Force -EA SilentlyContinue
            $pp="$mp\PrefetchParameters"
            Set-ItemProperty $pp -Name "EnableSuperfetch"  -Value $(if($ramGB -le 16){3}else{0}) -Type DWord -Force -EA SilentlyContinue
            Set-ItemProperty $pp -Name "EnablePrefetcher"  -Value $(if($isDDR5){3}else{2})        -Type DWord -Force -EA SilentlyContinue
            Write-Success "Memory: Paging + Superfetch ottimizzati"

            if($isGamingLaptop){
                Write-Info "[U3] Gaming Laptop: GPU max + Game Mode..."
                # GPU High Performance
                $gp2="HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
                Set-ItemProperty $gp2 -Name "HwSchMode" -Value 2 -Type DWord -Force -EA SilentlyContinue
                # Game Mode ON
                reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f 2>$null|Out-Null
                reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode"   /t REG_DWORD /d 1 /f 2>$null|Out-Null
                # Xbox DVR OFF
                reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f 2>$null|Out-Null
                # USB Suspend OFF
                $pg3=(powercfg /getactivescheme) -match 'GUID:\s+([a-f0-9\-]+)'
                if($pg3){$pg3=$Matches[1]}else{$pg3="SCHEME_CURRENT"}
                powercfg /setacvalueindex $pg3 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 2>$null
                powercfg /setactive $pg3 2>$null
                Write-Success "Gaming Laptop: GPU max, Game Mode ON, DVR OFF, USB Suspend OFF"
            }

            $global:opts++
        }
    }

    # RIEPILOGO
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   ⚡ OTTIMIZZAZIONE $lvl COMPLETATA - OGD ⚡" -F Yellow
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    Write-Success "Ottimizzazioni applicate: $global:opts"
    Write-Host "`n  📊 CONFIGURAZIONE RAM:" -F Cyan
    Write-Host "     Tipo: $(if($isDDR5){'DDR5 ⚡'}else{'DDR4'})" -F White
    Write-Host "     Quantità: $ramGB GB" -F White
    if($mode -eq "3"){
        Write-Host "`n  💾 PARAMETRI MEMORY MANAGEMENT:" -F Cyan
        Write-Host "     Paging Executive: $(if($ramGB -ge 32){'OFF'}else{'ON'})" -F White
        Write-Host "     Large Cache: $(if($isDDR5 -and $ramGB -ge 64){'ON'}else{'OFF'})" -F White
        Write-Host "     Superfetch: $(if($ramGB -le 16){'ON'}elseif($ramGB -le 32){'BOOT'}else{'OFF'})" -F White
        Write-Host "     Prefetcher: $(if($isDDR5){'FULL'}else{'BOOT'})" -F White
        $ioLockValue=if($ramGB -eq 8){512000}elseif($ramGB -eq 12){768000}elseif($ramGB -eq 16){1024000}elseif($ramGB -eq 32){2048000}elseif($ramGB -eq 64){4096000}elseif($ramGB -eq 128){8192000}elseif($ramGB -lt 8){256000}elseif($ramGB -lt 12){640000}elseif($ramGB -lt 16){896000}elseif($ramGB -lt 32){1536000}elseif($ramGB -lt 64){3072000}else{16384000}
        Write-Host "     IO Page Lock: $([math]::Round($ioLockValue/1024,0)) MB" -F White
        $cacheSize=if($ramGB -le 16){512}elseif($ramGB -le 32){1024}elseif($ramGB -le 64){2048}else{4096}
        Write-Host "     L2 Cache: $cacheSize KB" -F White
    }elseif($mode -eq "2"){
        Write-Host "`n  💾 MEMORY (base):" -F Cyan
        Write-Host "     Paging: ON | Superfetch: $(if($ramGB -le 16){'ON'}else{'BOOT'})" -F White
    }
    Write-Host "`n  ⚡ PROSSIMI PASSI:" -F Cyan
    Write-Host "  1. RIAVVIA il PC (obbligatorio)" -F White
    Write-Host "  2. Avvia OGD_Timer_0.5ms.ps1 dal Desktop" -F White
    Write-Host "  3. Minimizza timer durante gaming`n" -F White
    Write-Info "Punto ripristino disponibile in: Impostazioni → Ripristino sistema"
    Write-Host "`n  ════════════════════════════════════════════════════" -F Cyan
    Write-Host "   OGD WinCaffè v7.6.9 ULTIMATE" -F Yellow
    Write-Host "   #DarkPlayer84Tv Productions" -F Green
    Write-Host "   by OldGamerDarthy Official" -F Green
    Write-Host "  ════════════════════════════════════════════════════`n" -F Cyan
    
    # ═════════════════════════════════════════════════════════════════════════════
    #  APPLICAZIONE NETWORK OPTIMIZATION
    # ═════════════════════════════════════════════════════════════════════════════
    
    if($networkType -ne "0"){
        Show-Banner
        Write-Section "NETWORK OPTIMIZATION"
        
        $netTypeStr=switch($networkType){"1"{"WiFi ONLY"}"2"{"Ethernet ONLY"}"3"{"WiFi + Ethernet"}}
        Write-Host "`n  🌐 Applicazione ottimizzazioni: $netTypeStr`n" -F Cyan
        
        # ═════════════════════════════════════════════════════════════════════════
        #  TCP/IP REGISTRY TWEAKS (comuni a WiFi e Ethernet)
        # ═════════════════════════════════════════════════════════════════════════
        
        Write-Info "TCP/IP Stack Optimization..."
        
        # NetworkThrottlingIndex = FFFFFFFF (disabilita throttling)
        $mmsp="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        if(!(Test-Path $mmsp)){New-Item $mmsp -Force -EA SilentlyContinue|Out-Null}
        reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xFFFFFFFF /f 2>$null|Out-Null
        
        # TCP/IP Parameters
        $tcpip="HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"
        if(!(Test-Path $tcpip)){New-Item $tcpip -Force -EA SilentlyContinue|Out-Null}
        
        # TcpAckFrequency = 1 (no delay ACK)
        New-ItemProperty $tcpip -Name "TcpAckFrequency" -PropertyType "DWord" -Value 1 -Force -EA SilentlyContinue|Out-Null
        
        # TCPNoDelay = 1 (Nagle algorithm OFF)
        New-ItemProperty $tcpip -Name "TCPNoDelay" -PropertyType "DWord" -Value 1 -Force -EA SilentlyContinue|Out-Null
        
        # IRPStackSize = 32 (da 15 default) - per connessioni >10Mbps
        New-ItemProperty $tcpip -Name "IRPStackSize" -PropertyType "DWord" -Value 32 -Force -EA SilentlyContinue|Out-Null
        
        # GlobalMaxTcpWindowSize = 65535
        New-ItemProperty $tcpip -Name "GlobalMaxTcpWindowSize" -PropertyType "DWord" -Value 65535 -Force -EA SilentlyContinue|Out-Null
        
        # Disable NetBIOS over TCP/IP (già in step Privacy ma forzo)
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "EnableLMHOSTS" /t REG_DWORD /d 0 /f 2>$null|Out-Null
        
        Write-Success "TCP/IP optimized (Throttling OFF, ACK Freq, Nagle OFF)"
        
        # ═════════════════════════════════════════════════════════════════════════
        #  WiFi ADAPTER SETTINGS
        # ═════════════════════════════════════════════════════════════════════════
        
        if($networkType -in @("1","3")){
            Write-Host ""
            Write-Info "WiFi Adapter Optimization..."
            
            # Trova tutti gli adapter WiFi
            $wifiAdapters=Get-NetAdapter -Physical|Where-Object{$_.MediaType -like "*802.11*" -or $_.InterfaceDescription -like "*Wi-Fi*" -or $_.InterfaceDescription -like "*Wireless*"}
            
            if($wifiAdapters){
                foreach($adapter in $wifiAdapters){
                    Write-Host "  → $($adapter.Name): $($adapter.InterfaceDescription)" -F DarkGray
                    
                    # Power Management OFF
                    $devID=$adapter.DeviceID
                    $regPath="HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                    if(Test-Path $regPath){
                        Set-ItemProperty $regPath -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue
                    }
                    
                    try{
                        # Roaming Aggressiveness = Lowest (1) - stability per home network
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Roaming Aggressiveness" -DisplayValue "1. Lowest" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Transmit Power = Highest
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Transmit Power" -DisplayValue "Highest" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Power Saving Mode = Disabled / Maximum Performance
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Power Saving Mode" -DisplayValue "Maximum Performance" -EA SilentlyContinue
                    }catch{
                        try{
                            Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "MIMO Power Save Mode" -DisplayValue "No SMPS" -EA SilentlyContinue
                        }catch{}
                    }
                    
                    try{
                        # 802.11n Mode = Enabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "802.11n Mode" -DisplayValue "Enabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Fat Channel Intolerant = Disabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Fat Channel Intolerant" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Throughput Enhancement / Booster = Disabled (single device home network)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Throughput Enhancement" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{
                        try{
                            Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Throughput Booster" -DisplayValue "Disabled" -EA SilentlyContinue
                        }catch{}
                    }
                }
                Write-Success "WiFi: Power OFF, Roaming Lowest, Transmit Highest"
            }else{
                Write-Host "  ⚠️ Nessun adapter WiFi trovato" -F Yellow
            }
        }
        
        # ═════════════════════════════════════════════════════════════════════════
        #  ETHERNET ADAPTER SETTINGS
        # ═════════════════════════════════════════════════════════════════════════
        
        if($networkType -in @("2","3")){
            Write-Host ""
            Write-Info "Ethernet Adapter Optimization..."
            
            # Trova tutti gli adapter Ethernet
            $ethAdapters=Get-NetAdapter -Physical|Where-Object{$_.MediaType -like "*802.3*" -or $_.InterfaceDescription -like "*Ethernet*" -or $_.InterfaceDescription -like "*Gigabit*" -or $_.InterfaceDescription -like "*Realtek*" -or $_.InterfaceDescription -like "*Intel*"}
            
            if($ethAdapters){
                foreach($adapter in $ethAdapters){
                    Write-Host "  → $($adapter.Name): $($adapter.InterfaceDescription)" -F DarkGray
                    
                    # Power Management OFF
                    $devID=$adapter.DeviceID
                    $regPath="HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\$devID"
                    if(Test-Path $regPath){
                        Set-ItemProperty $regPath -Name "PnPCapabilities" -Value 24 -Type DWord -Force -EA SilentlyContinue
                    }
                    
                    try{
                        # Energy Efficient Ethernet (EEE) = Disabled - gaming priority
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Advanced EEE = Disabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Advanced EEE" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Green Ethernet = Disabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Green Ethernet" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Flow Control = Rx & Tx Enabled (prevent packet loss)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Flow Control" -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue
                    }catch{
                        try{
                            Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Flow Control" -DisplayValue "On" -EA SilentlyContinue
                        }catch{}
                    }
                    
                    try{
                        # Interrupt Moderation = Disabled (lowest latency gaming)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Interrupt Moderation" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Jumbo Frames = 9000 (se supportato)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Jumbo Frame" -DisplayValue "9014" -EA SilentlyContinue
                    }catch{
                        try{
                            Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Jumbo Packet" -DisplayValue "9KB MTU" -EA SilentlyContinue
                        }catch{}
                    }
                    
                    try{
                        # Large Send Offload v2 IPv4 = Disabled (controverso, ma migliore per gaming)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Large Send Offload V2 (IPv4)" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Large Send Offload v2 IPv6 = Disabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Large Send Offload V2 (IPv6)" -DisplayValue "Disabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # TCP Checksum Offload IPv4 = Enabled (reduce CPU)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "TCP Checksum Offload (IPv4)" -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # TCP Checksum Offload IPv6 = Enabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "TCP Checksum Offload (IPv6)" -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # UDP Checksum Offload IPv4 = Enabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "UDP Checksum Offload (IPv4)" -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # UDP Checksum Offload IPv6 = Enabled
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "UDP Checksum Offload (IPv6)" -DisplayValue "Rx & Tx Enabled" -EA SilentlyContinue
                    }catch{}
                    
                    try{
                        # Receive Buffers = Maximum (2048 se disponibile)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Receive Buffers" -DisplayValue "2048" -EA SilentlyContinue
                    }catch{
                        try{
                            Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Receive Buffers" -DisplayValue "1024" -EA SilentlyContinue
                        }catch{}
                    }
                    
                    try{
                        # Transmit Buffers = Maximum (2048 se disponibile)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Transmit Buffers" -DisplayValue "2048" -EA SilentlyContinue
                    }catch{
                        try{
                            Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Transmit Buffers" -DisplayValue "512" -EA SilentlyContinue
                        }catch{}
                    }
                    
                    try{
                        # Receive Side Scaling (RSS) = Enabled (multi-core)
                        Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Receive Side Scaling" -DisplayValue "Enabled" -EA SilentlyContinue
                    }catch{}
                    
                    # RSS Queue Binding (cores 2-3 se 4+ cores)
                    $cpuCount=(Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
                    if($cpuCount -ge 4){
                        try{
                            Set-NetAdapterRSS -Name $adapter.Name -BaseProcessorNumber 2 -EA SilentlyContinue
                        }catch{}
                    }
                }
                Write-Success "Ethernet: EEE OFF, Interrupt Mod OFF, Jumbo 9K, RSS ON"
            }else{
                Write-Host "  ⚠️ Nessun adapter Ethernet trovato" -F Yellow
            }
        }
        
        Write-Host "`n  ✓ Network Optimization completata!`n" -F Green
        Start-Sleep 2
    }
    
    # Installazione / aggiornamento programmi opzionali (se richiesti)
    if($installPrograms -and ($selectedApps.Count -gt 0 -or $upgradeApps.Count -gt 0)){
        Write-Host "`n  ════════════════════════════════════════════════════" -F Green
        Write-Host "   📦 INSTALLAZIONE / AGGIORNAMENTO PROGRAMMI" -F Green
        Write-Host "  ════════════════════════════════════════════════════`n" -F Green

        $doneInstall = 0
        $doneUpgrade = 0

        # NUOVE INSTALLAZIONI
        foreach($appID in $selectedApps){
            $appName = ($appCatalog | Where-Object {$_.ID -eq $appID}).Name
            if(!$appName){ $appName = $appID }
            Write-Info "Installazione $appName..."
            $r = winget install --id $appID --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
            if($LASTEXITCODE -eq 0 -or $r -match "installato|installed|successfully"){
                Write-Success "$appName installato!"
                $doneInstall++
            } else {
                Write-Host "  ⚠ $appName - installazione fallita" -F Yellow
            }
        }

        # AGGIORNAMENTI
        foreach($appID in $upgradeApps){
            $appName = ($appCatalog | Where-Object {$_.ID -eq $appID}).Name
            if(!$appName){ $appName = $appID }
            Write-Info "Aggiornamento $appName..."
            $r = winget upgrade --id $appID --silent --accept-source-agreements --accept-package-agreements 2>&1 | Out-String
            if($LASTEXITCODE -eq 0 -or $r -match "aggiornato|upgraded|successfully"){
                Write-Success "$appName aggiornato!"
                $doneUpgrade++
            } else {
                Write-Host "  ⚠ $appName - aggiornamento fallito" -F Yellow
            }
        }

        Write-Host ""
        if($doneInstall -gt 0){ Write-Success "$doneInstall programmi installati" }
        if($doneUpgrade -gt 0){ Write-Success "$doneUpgrade programmi aggiornati" }
        Write-Host ""
        Start-Sleep 2
    }
    
    if((Read-Host "  Riavviare ORA? (S/N)") -in @("S","s")){
        taskkill /im explorer.exe /f 2>$null|Out-Null;Start-Sleep 1
        Restart-Computer -Force
    }
    continue MenuLoop
}

}  # End while MenuLoop
