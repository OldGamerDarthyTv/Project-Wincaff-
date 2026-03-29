#Requires -Version 5.1
<#
═══════════════════════════════════════════════════════════════════════════════
 ⚡ OGD Timer 0.5ms v2.0
 by OldGamerDarthy — #DarkPlayer84Tv Productions
 
 Riduce il timer di sistema da 15.6ms a 0.5ms.
 Effetto: meno latenza, frame time più stabili, input più reattivo.
 
 ISTRUZIONI:
   • Avvia prima di giocare
   • Tieni MINIMIZZATO (non chiudere) durante il gaming
   • Chiudi quando finisci di giocare
═══════════════════════════════════════════════════════════════════════════════
#>

# ── Parametri ─────────────────────────────────────────────────────────────────
$TARGET_RESOLUTION = 5000   # 5000 x 100ns = 0.5ms
$CHECK_INTERVAL_MS = 30000  # Ricontrolla ogni 30 secondi (30000ms)

# ── Admin check ───────────────────────────────────────────────────────────────
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")
if(-not $isAdmin){
    Write-Host "`n  ⚠️  Richiesti privilegi Amministratore" -ForegroundColor Red
    Write-Host "  Click destro → Esegui con PowerShell come Admin`n" -ForegroundColor Yellow
    Read-Host "  INVIO per chiudere"
    exit 1
}

# ── Carica API Win32 ──────────────────────────────────────────────────────────
try{
    Add-Type @"
using System.Runtime.InteropServices;
public class OGDTimer {
    [DllImport("ntdll.dll")]
    public static extern int NtSetTimerResolution(uint DesiredResolution, bool SetResolution, out uint CurrentResolution);
    [DllImport("ntdll.dll")]
    public static extern int NtQueryTimerResolution(out uint MinimumResolution, out uint MaximumResolution, out uint CurrentResolution);
}
"@
}catch{
    # Già definita in questa sessione — va bene
}

# ── Funzioni ──────────────────────────────────────────────────────────────────
function Write-Log {
    param([string]$Message, [string]$Level = "Info")
    $time  = Get-Date -Format "HH:mm:ss"
    $color = switch($Level){
        "OK"      { "Green"  }
        "Warn"    { "Yellow" }
        "Error"   { "Red"    }
        default   { "Cyan"   }
    }
    Write-Host "  [$time] $Message" -ForegroundColor $color
}

function Get-CurrentResolution {
    try{
        $min=0u; $max=0u; $cur=0u
        [OGDTimer]::NtQueryTimerResolution([ref]$min,[ref]$max,[ref]$cur) | Out-Null
        return [math]::Round($cur / 10000.0, 2)  # converte da 100ns a ms
    }catch{ return -1 }
}

function Set-TimerResolution {
    param([uint32]$Resolution)
    try{
        $current = 0u
        $result = [OGDTimer]::NtSetTimerResolution($Resolution, $true, [ref]$current)
        return @{ Success = ($result -eq 0); Current = $current }
    }catch{
        return @{ Success = $false; Current = 0 }
    }
}

# ── UI ────────────────────────────────────────────────────────────────────────
$Host.UI.RawUI.WindowTitle = "OGD Timer 0.5ms v2.0 — ATTIVO"

Clear-Host
Write-Host "`n  ╔═══════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "  ║          ⚡ OGD Timer 0.5ms v2.0 — ATTIVO ⚡          ║" -ForegroundColor Cyan
Write-Host "  ║        #DarkPlayer84Tv Productions — OGD Team         ║" -ForegroundColor DarkGray
Write-Host "  ╚═══════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

# ── Leggi risoluzione attuale prima del set ───────────────────────────────────
$before = Get-CurrentResolution
Write-Log "Risoluzione attuale: ${before}ms" "Info"

# ── Imposta timer ─────────────────────────────────────────────────────────────
Write-Log "Impostazione timer a 0.5ms..." "Info"
$result = Set-TimerResolution -Resolution $TARGET_RESOLUTION

if(-not $result.Success){
    Write-Log "Errore durante l'impostazione del timer!" "Error"
    Write-Log "Riprova come Amministratore o riavvia il PC." "Warn"
    Read-Host "  INVIO per chiudere"
    exit 1
}

$after = [math]::Round($result.Current / 10000.0, 2)
Write-Log "Timer impostato: ${after}ms ✓" "OK"
Write-Host ""
Write-Host "  ✅ Timer attivo — MINIMIZZA questa finestra!" -ForegroundColor Green
Write-Host "  ⛔ NON chiudere durante il gaming" -ForegroundColor Yellow
Write-Host "  ℹ  Chiudi quando hai finito di giocare`n" -ForegroundColor DarkGray
Write-Host "  ─────────────────────────────────────────────────────────" -ForegroundColor DarkGray

# ── Loop di mantenimento ──────────────────────────────────────────────────────
# Ricontrolla ogni 30s e reimposta se necessario (alcuni processi resettano il timer)
$checks = 0
while($true){
    Start-Sleep -Milliseconds $CHECK_INTERVAL_MS
    $checks++

    $cur = Get-CurrentResolution
    if($cur -gt 1.0){
        # Il timer è stato resettato da qualcosa — reimposta
        $r2 = Set-TimerResolution -Resolution $TARGET_RESOLUTION
        if($r2.Success){
            Write-Log "Timer reimpostato a 0.5ms (era ${cur}ms) — check #$checks" "Warn"
        }else{
            Write-Log "Reimpostazione fallita (${cur}ms) — check #$checks" "Error"
        }
    }
    # Nessun output se tutto OK — finestra pulita
}
