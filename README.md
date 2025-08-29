# DFIR-Installer

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

This is a new way of observing the installer. Just The Tool name and if it was installed correctly or not.
```ps1
& 'C:\Program Files\PowerShell\7\pwsh.exe' -ExecutionPolicy Bypass .\dfir-install.ps1 -config <CONFIG-NAME>
```

For Debugging info and full live install feed and prints use *-Debug*:

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
* **Please keep in mind do review the Post-Install-Terminal-Outputs**, due to some packages e.g. PLASO need more steps to get installed that are technically not possible to implement in the script (if possible though, feel free to create an issue or pull request). If you already closed the terminal, feel free to check out the installation logs in the Root folder of the dfir-installer. 

**Recommendations**

* https://draculatheme.com
* Install Powershell Upgrade -> ps-admin cmd: `Install-Module -Name PowerShellGet -Force`

**Updates**

Feel free to use the *update-system.ps1* scripted placed on your desktop for updating winget and chocolatey packages.

Other Update features will get added in the future :)

**Manual Install**

* Documents/DFIR-Installer-Optional/
* https://hex-rays.com/ida-free

## Other Tools in this Repo (Tools folder)
**GUI Config Builder**
dfir-installer-selector.exe (https://github.com/n0raitor/dfir-installer-selector)

**Additional non installer Scripts and Instructions/**
In Your *Documents* folder */DFIR-Installer-Optional/InstallationSteps*: Some Scripts that could be used to install WSL supported Tools in Ubuntu LTS 22.04 or 20.04 (See Prefix, if no prefix -> distro does not matter). Feel free to use the .md files to see some additional tool installation tipps/instructions

## Contribute to this Project
I am happy if you have recommendations or requests to this project.

Please use an Issue for an Request.

Requests examples:
* Configs
* Tools
* Post-Install Steps / Routins of Tools or in general

If you run into a bug or some issues, I am happy to support you or fix those issues.

For Faild Packaged installes, please create an issue and submit the Log files in your cloned dfir-installer root directory.

## Supported Tools
See file: *list-of-tools.txt*

## Disclaimer
This tool is for educational and testing purposes only. I am not the owner of the tools and do not provide licenses to them.

Use to your own risk and only on virual testing systems. I will not take any fault on system damages.

## Developer Infos:
* `.\Post-Install-Scripts\_Create-Scripts.ps1`: will this relative Path for the categories and creation of new Post-Install-Scripts `..\..\dfir-installer-selector\dfir-installer-selector.xlsx"`.
* `.\calc-new-tool-list.ps1`: will create and update the tool list by checking every installation config (`Installer-Configs`)
* `.\path-var.conf`: Contains every Path-Variable Entry to get inserted.