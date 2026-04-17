# OGD WinCaffe 8.0.2

Strumento PowerShell per ottimizzazione, manutenzione e profili gaming su Windows, con menu guidati, hotfix, moduli hardware dedicati e aggiornamento automatico dal repo ufficiale.

Repo ufficiale:
[https://github.com/OldGamerDarthyTv/Project-Wincaffe](https://github.com/OldGamerDarthyTv/Project-Wincaffe)

## Stato attuale

- Versione ramo corrente: `8.0.2`
- Runtime consigliato: `PowerShell 7.6.0+`
- Compatibilità principale: `Windows 11`
- Presenza di rami dedicati anche per target `Windows 10` e `Windows 11 24H2+`
- Timer companion supportato: `OGD_Timer_0.5ms.ps1`

## Novità recenti

- UI aggiornata in stile `cyber gaming workbench`
- controllo runtime PowerShell anticipato subito dopo l'accettazione
- update check collegato al repo ufficiale GitHub
- fix rete più prudenti dopo i problemi delle build `7.9.x`
- fix dedicato per scenari `pre-7.9.8` con rete/Discord/orario danneggiati
- credito esplicito al progetto `WinScript` per la base del debloat/privacy integrato
- primi sottomenu hardware dedicati:
  - `NVIDIA`
  - `AMD GPU`
  - `AMD CPU`
  - `Intel CPU`
- hardening del debloat su sistemi già toccati da altri debloater:
  - wrapper safe per `AppX`
  - wrapper safe per feature/capability Windows
  - warning soft al posto di stop duro

## Requisiti

- Windows con privilegi amministrativi
- `PowerShell 7.6.0+`
- connessione Internet per:
  - aggiornamento script dal repo ufficiale
  - update di componenti opzionali
  - controlli dipendenze `.NET`

Nota:
Se lo script parte da `powershell.exe` classico, prova a rilanciarsi in `pwsh` quando disponibile.

## Update ufficiale

Lo script ora controlla il repo ufficiale:

- legge i file `OGD_WinCaffe_<versione>.ps1`
- confronta la versione locale con quella più alta trovata
- mostra la versione disponibile
- chiede se aggiornare
- se confermato, aggiorna anche `OGD_Timer_0.5ms.ps1`

Repo usato per l'update:
[https://github.com/OldGamerDarthyTv/Project-Wincaffe](https://github.com/OldGamerDarthyTv/Project-Wincaffe)

## Menu principali

### Profili guidati

- `LIGHT`
  - profilo base, prudente, orientato a reattività generale
- `NORMALE`
  - profilo desktop/gaming bilanciato
- `AGGRESSIVO`
  - profilo più spinto con maggior impatto sul comportamento del sistema
- `AGGRESSIVO GAMING`
  - percorso gaming dedicato con livelli separati
- `LAPTOP`
  - profili bilanciati per notebook
- `LAPTOP GAMING`
  - profili gaming per notebook, con attenzione a carica/termica

### Moduli e strumenti

- `DNS TNT`
- `EXPLORER`
- `INFO`
- `RESET`
- `FILE I/O`
- `WINREVIVE`
- `NET TWEAKS`
- `DPC LATENCY FIX`
- `NPU`
- `UNREAL ENGINE`
- `CALL OF DUTY`
- `MOUSE`
- `HOTFIX`

### Moduli hardware recenti

- `NVIDIA`
  - tweak GPU NVIDIA safe
  - extra software contestuale
- `AMD GPU`
  - tweak Radeon safe
  - extra software contestuale
- `AMD CPU`
  - profili `Light -> Ultra` per Ryzen / X3D
  - tool utili contestuali
- `Intel CPU`
  - profili `Light -> Ultra` per Core / Core Ultra
  - focus anche su piattaforme `Core Ultra` come `Ultra 9`

## Software aggiuntivo contestuale

L'idea dei programmi aggiuntivi non è più pensata come blocco globale da proporre ovunque: nella `8.0.2` viene spostata nei sottomenu hardware, dove ha più senso.

Esempi attuali:

- `NVIDIA`
  - `NVIDIA App`
  - `DDU` solo se serve
- `AMD GPU`
  - `AMD Software: Adrenalin Edition`
  - `AMD Cleanup Utility` solo se serve
- `AMD CPU`
  - `AMD Ryzen Master`
  - `HWiNFO64`
- `Intel CPU`
  - `Intel XTU`
  - `Intel Driver & Support Assistant`

Ogni suggerimento viene accompagnato da:

- breve descrizione
- nota `consigliato` oppure `solo se serve`

## Debloat e compatibilità con WinScript

La parte di debloat/privacy integrata prende spunto anche da `WinScript`.

Crediti:

- `WinScript` by `flick9000 / Francesco`
- repo ufficiale:
  [https://github.com/flick9000/winscript](https://github.com/flick9000/winscript)

Attenzione:

- se sul PC è già stato usato `WinScript`, alcune parti del debloat possono trovare componenti già rimossi o servizi/feature già disattivati
- questo può causare:
  - errori AppX
  - no-op
  - interruzioni in alcuni blocchi non ancora completamente hardenizzati

Caso tipico già osservato:

- `Get-AppxProvisionedPackage ... Interfaccia non registrata`

Questo non significa per forza che tutto il profilo sia sbagliato, ma che lo stack `AppX / provisioned packages` del sistema è già stato alterato o danneggiato.

Per questo nella `8.0.2` il debloat è stato reso più tollerante:

- se query o rimozioni `AppX` falliscono, lo script emette un warning soft e continua
- se una feature Windows è già assente o non gestibile, il profilo non si ferma
- l'obiettivo è evitare che `Aggressivo` o `Debloat` restino bloccati su macchine già modificate

## Rete e fix recenti

Le build `7.9.x` hanno richiesto una bonifica importante della parte rete.

Nelle build recenti sono stati introdotti:

- profilo rete più prudente
- rimozione dei tweak TCP legacy più aggressivi
- reset `Winsock`
- pulizia override persistenti delle NIC
- fix dedicato per:
  - rete lenta o quasi bloccata
  - Discord che resta in caricamento
  - orario di sistema non sincronizzato

## NPU

Se il sistema ha una `NPU`, lo script può rilevarla e usarla per logica e diagnostica più moderna, ma non viene presentata come “boost magico FPS”.

Uso previsto:

- rilevamento hardware
- profili AI / workload dedicati
- percorsi separati dal gaming classico

## Roadmap breve

Direzioni già emerse per le prossime build:

- `8.0.3`
  - associare un profilo di alimentazione dedicato a ogni preset
  - distinguere meglio tra desktop, laptop, AC e batteria
- hardening di:
  - `Debloat`
  - `.NET update`
  - profili `Aggressivo`
  - gestione errori AppX / feature già rimosse
- aggancio completo dei nuovi sottomenu hardware al dispatcher principale

## Note operative

- usare `pwsh` è il percorso corretto
- il vecchio `powershell.exe` può dare errori di parsing o comportamento su file più moderni
- per i sistemi già “toccati” da altri debloater conviene trattare il debloat come best-effort e non come operazione garantita su tutte le macchine

## Credits

- `OldGamerDarthy / #DarkPlayer84Tv Productions`
- comunità OGD
- `WinScript` (`flick9000 / Francesco`) per la base di parte del debloat/privacy

## Licenza

Verificare il file `LICENSE` presente nel repo ufficiale per i termini aggiornati.
