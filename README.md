# dfir-installer

## What is the Purpose of this Repository?

Install every tool and every needed software for your DFIR workstation. This includes everything after installing Windows (and update) Post-Process steps recommended by me 

**Follow the Readmy Tutorial below to get the best Experience**

The Tool will create a Folder `C:\DFIR\` where everything will get installed (except winget and chocolatey packages). At some point, there will spawn some gui installers at the end. Feel free to use the `C:\DFIR\<Toolname>` Path for this if you wish.

The files and folders in `Documents` will get copied in your User Documents folder (Recommended Templates,...). If you wish to not get these files, feel free to delete the folder and files in `Documents` before running the installer.

## Tutorial

Status Quo: Windows 10/11 installed and updated and restarted

### Preparation
0. First, deactivate Defender (Defender -> Settings -> Deactivate Real-Time-Protection,...)

1. Set ExecutionPolicy
   run admin powershell and bypass execution policy via using this command:
   
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope CurrentUser
   ```

2. Make sure that winget is installed:
   
   ```powershell
   winget
   ```
   
   If not, follow this [tutorial](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
   *Note: After Installation Reopen the Shell to install programms*

3. Install Chocolatey: 
   Run as Administrator in Powershell Terminal:
   
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
   
   Note: After Installation Reopen the Shell as Administrator to install programms

4. Enable WSL (Optional)
   Enable System component -> WSL 
   
   *or*
   
   ```powershell
   wsl.exe --update
   ```

5. Install the latest PowerShell Version (Required!)
   
   ```ps1
   winget install Microsoft.PowerShell
   ```

### RUN DFIR-INSTALLER -- Install Tools and Setting up your Environment
Download the latest Release of this Repository

Run the *dfir-install.ps1* in **Admin Powershell Console** as shown below.

**NOTE:** For Installation Popups, always use C:\DFIR\<ToolName> where ToolName is the Name in the Terminal After `Installing: ToolName`

This ensures the right shortcut location!

**Configs**

The Configs are in the "Configs" folder of the root repository. The installer will identify every .conf file during runtime as a valid argument for the *-config* command.

The config files contains tool names that should get installed.

There are Post-Process Routines for each packages (Feel free to contribue on this as described at the bottom)

Feel free to use or create your own e.g. with the *dfir-install-selector* tool placed in the *Tools* folder. Use this GUI tool to select the packages to use and save the .conf file using the Export Button (Currently German: "Exportieren") in the *Configs* Folder of this Repository.

Main Configs:
* minimal (only Basic Programms including System Components and GenPurp Apps)
* dfir (DFIR Tools, Includes some of Minimal)
* malsre (Malware Analysis and Software Reverse Engineering Tools, Includes some of Minimal)
* offensive (Pentesting Tools)
* flagship (Everything)

others:
* own (My own Forensic Laptop Preferences including other tools then in Flagship)
* test (just for my personal tool testing, feel free to ignore this)
* Forensic-Workstation-StudioED (My DFIR Workstation Setup including Drivers and Casual Apps)

Pipeline Folder: Future planed configs

**Run the Script with the config name (without .conf) as this:**

```ps1
& 'C:\Program Files\PowerShell\7\pwsh.exe' -ExecutionPolicy Bypass .\dfir-install.ps1 -config <CONFIG-NAME>
```

For Debugging info use *-Debug*:

```ps1
& 'C:\Program Files\PowerShell\7\pwsh.exe' -ExecutionPolicy Bypass .\dfir-install.ps1 -config CONFIG-NAME -Debug
```

**Post Installation Steps**

* Run W10Privacy as Admin and use the Configs in the *W10Privacy/*. This is for Analysis Workstation or Laptop Hardening. Please review the config file in the W10Privacy Tool before apply the settings.
  * Reboot Afterwards
  * Feel free to grab a copy of this tool if you did not installed it using the installer: https://www.w10privacy.de/
* Set Windows Defender Exceptions to (due to Hacking tools might get blocked by defender):
  * C:\DFIR
  * C:\ProgramData\chocolatey
  * C:\tools (if created)
* Restrict execution rights via Powershell admin console: `Set-ExecutionPolicy Restricted -Scope CurrentUser`
* Enable Defender again.

**Recommendations**

* https://draculatheme.com
* Install Powershell Upgrade -> ps-admin cmd: `Install-Module -Name PowerShellGet -Force`

**Updates**

Feel free to use the *update-system.ps1* scripted placed on your desktop for updating winget and chocolatey packages.

Other Update features will get added in the future :)

**Manual Install**

* Optional Folder
* https://hex-rays.com/ida-free

## Other Tools in this Repo (Tools folder)
**GUI Config Builder**
dfir-installer-selector.exe (https://github.com/n0raitor/dfir-installer-selector)

**Scripts/**
Some Scripts that could be used to install WSL supported Tools in Ubuntu LTS 22.04.

## Contribute to this Project
I am happy if you have recommendations or requests to this project.

Please use an Issue for an Request.

Requests examples:
* Configs
* Tools
* Post-Install Steps / Routins of Tools or in general

If you run into a bug or some issues, I am happy to support you or fix those issues.


## Supported Tools
```
.NET Framework
010Editor
adconnectdump
AdvancedRun
AlternateStreamView
AnalyzePDF
AnyBurn
apilogger
Apimonitor
Apktool
AppCrashView
AppInstaller
AppReadWriteCounter
Appx-Analysis
Arsenalimagemounter
ArtiFast
AutoIt-Extractor
Autopsy
Autopsy-Addons
Autorunner
balbuzard
balenaEtcher
Binary Ninja
BlobRunner
BloodHound
BlueScreenView
bring2lite
BrowsingHistoryView
BuildTools
Bulk-extractor
BurpSuite-Community
Bytecode-Viewer
bytehist
Capa
Chainsaw
Cherrytree
ChocolateyGUI
Chromagnon
Chrome
ChromeCacheView
CMake
Cmder
CoreTemp
CrystalDiskInfo
CSVFileView
Cutter
CyberChef
Cygwin
DataDump
DBBrowserForSQLite
Dcode
de4dot
decompile-py2exe
DeepSound
dejsonlz4
densityscout
DesktopRuntime6
dex2jar
DidierStevensSuite
Die
dll_to_exe
dnlib
DNSLookupView
dnSpy
DockerDesktop
Dokany
DotNet Framework 3.5
DotNet Framework 4.5
DotPeek
DriveFS-Sleuth
DumpIt
edb-debugger
EncryptedDiskDetector
EncryptedDiskHunter
Eraser
Etcher
Event Log Explorer
Event Log Explorer Old
Event Log Explorer_Forensic
Event Log Explorer_Standard
Everything
Exchange-edb-viewer
exe2aut
ExeInfoPE.exe
ExifTool
ExifToolGUI
Explorer Suite
Explorersuite
Exterro FTK Imager
ExtremeDumper
Fakenet
ffdec
FiddlerClassic
Firefox
Floss
forensicsim
forensictools
fqlite
Free Kernel OST Viewer
Free Kernel PST Viewer
FullEventLogView
GeForceExperience
GeoIpUpdate
Get-ZimmermanTools
Ghidra
GIGABYTEControlCenter
Git
GitKraken
GmailURLDecoder
gMetaDataParse
Google-Analytic-Cookie-Cruncher
google-fs-recover
Hashcat
HashMyFiles
HashSuite
Hasleo Data Recovery
Hasleo-Backup-Suite
Hayabusa
Hexinator
Highlighter
hindsight
hindsightgui
Hollowshunter
HTTrack
HxD
iDef Map Setup
IFPSTools
iisGeoLocate
ILSpy
inetsim
innoextract
Innounp
InsideClipboard
InstalledDriversList
InstalledPackagesView
IrfanView
iTopEasyDesktop
JavaDecompilerGUI
java-deobfuscator
JDownloader
JoakimSchichtTools
KaliLinux
kali-windows-binaries
Kansa
KANSA-PP
KAPE
kapexplaso-pp
KeePass
Kernel Mode Driver Loader
Last Activity View
Lessmsi
LibreOffice
Logfileparser
LogiOptions
Logitech G HUB
LordPE
MagnetRAMCapture
MailSniper
Mailviewer
Maltego
Malware-Analysis-Scripts
malware-jail
Mandiant IOCe
MarkText
MemoryBaseliner
MemoryDumperx64
MemoryDumperx86
MemProcFS
Merlin
Metasploit Framework
MFCMAPI
MFTBrowser
MicroBurst
Mimikatz
MSGWalker
msodbcsql
NetBScanner
NetRouteView
NetworkInterfacesView
NetworkMiner
NetworkOpenedFiles
NetworkUsageView
NirSoft DownTester
NirSoft IPNetInfo
NirSoft NK2Edit
NirSoft ShellExView
NirSoft VideoCacheView
NirSoft Volumouse
NirSoft WhoisThisDomain
NirSoft Wireless Network Watcher
NirSoft-Everything
Nmap
Noriben
notatin_comp
notatin_dump
Notepadpp
Npcap
Obsidian
OBSStudio
OfficeSpy
OffVis
OleTools
Ollydbg
OllyDumpEx
OneDriveExplorer
OneNoteAnalyzer
OpenedFilesView
openstego
OutlookSpy
parseusbs
Partition-4DiagnosticParser
PDF Stream Dumper
PDF24Creator
Pebear
PEDetective
peepdf
peframe
PEiD
Pesieve
Pestudio
PEview
Photorec
pkg-unpacker
Plaso
PowerShell
PowerToys
Ppee
ProcDOT
Procdump
Processhacker
ProtonDrive
ProtonMail
ProtonPass
ProtonVPN
PSDecode
PSTWalker
PyCharmCommunityEdition
pyinstxtractor
Python3.11
Python3.12.9
Python-Launcher
qBittorrent
qFlipper
Quickhash-GUI
Radare2
RealVNC Viewer
ReCsvEdit
Redline
Regcool
RegExport
Registryexplorer
RegRipper3.0
Regshot
Resourcehacker.portable
ResourcesExtract
retoolkit_installer
retoolkit2_installer
Rufus
RunDotNetDll
Runtime6
samdump
Scylla
ScyllaHide
SearchMyFiles
ShadowExplorer
shellcode_launcher
Sidr
sigma
SilkETW
SimpleProgramDebugger
Skyperious
Sleuthkit
sliver
sort-PhotorecRecoveredFiles
SoundVolumeView
SpaceSniffer
SpyStudio
Sqlcmd
Sqlitebrowser
sqlite-dissect
SQliteSpy
SQLRecon
srum-dump
SrumMonkey
Stracciatella
Structured Storage Viewer
SynologyActiveBackupforBusinessAgent
Sysinternals
SystemInformer
TcpLogView
Telnet
Temurin
Testdisk
TimeApp
Thumbcache Viewer
Thumbs Viewer
Tor-browser
TotalRegistry
TurnedOnTimesView
tzworks_toolset
Ubuntu2204
UI.Xaml2.7
UI.Xaml2.8
undark
uniextract
UninstallView
Upx
USBLogView
vb_decompiler_lite
VC Redistributable x64
VCLibsDesktop14
VCRedist2010
VCRedist2015x64
VCRedist2015x86
Veeam-backup-and-replication-iso
Vim
VisioViewer
VisualStudio2022
VisualStudioCode
VisualStudioEnterprise2022
VLC
VMware Workstation
Vnc-viewer
Vscmount
VSS_Carver.pyinfected
VSTOR
Vt-cli
WakeMeOnLan
WebDeploy
Whisker
WifiInfoView
WinDbg
WinDirStat
WindowsInstallationAssistant
WindowsSDK10
WindowsTerminal
windump
WinEDB
winpmem
WinSCP
WinSearchDBAnalyzer
Wireshark
WMImplant
WSL
WSL Update
X64dbg.portable
XstReader
Yara
```

## Disclaimer
This tool is for educational and testing purposes only. I am not the owner of the tools and do not provide licenses to them.

Use to your own risk and only on virual testing systems. I will not take any fault on system damages.
