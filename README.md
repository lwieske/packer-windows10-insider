# Packer-Windows10-Insider (17025/February 2018)

Makes a Windows 10 x64 box for use with Virtualbox.

![redstone4](https://www.the-infos-du-geek.fr/wp-content/uploads/2017/10/Windows-10-Redstone-4-build-17025.jpg)

Inspired by so many other repositories on GitHub.

| Build	| Version | Codename | Date | Marketing Term |
|---:|---:|---|---|---|
| 10240	|      | Threshold1 | July 2015      |                      |
| 10586	| 1511 | Threshold2 | November  2015 |                      |
| 14393	| 1607 | Redstone 1 | July      2016 | Anniversary Update   |
| 15063 | 1703 | Redstone 2	| April     2017 | Creators Update      |
|       | 1709 | Redstone 3	| October   2017 | Fall Creators Update |
|       | 1803 | Redstone 4	| TBA	Early 2018 |                      |
| 17025	|      |            | February 2018  |                      |
|       | 1809 | Redstone 5	| TBA	Late  2018 |                      |

```
$ packer build -force -only=virtualbox-iso windows10-insider.json

$ vagrant box add --name windows10-insider builds/windows10-insider.virtualbox.box --force

$ vagrant init windows10-insider

$ vagrant up
```

This repository is based on **Insider Preview 17025 (February 2018)** and the build does the following:

* Autonunattend.xml
  * update windows
  * enable winrm
* windows10-insider.json
  * restart windows
    * enables rdp
    * (enables ssh)
    * installs guest tools
  * restart windows
    * installs packages
    * does some tweaks
    * compacts the drive

```
cloudgate% packer build -force -only=virtualbox-iso windows10-insider.json
virtualbox-iso output will be in this color.

==> virtualbox-iso: Downloading or copying Guest additions
    virtualbox-iso: Downloading or copying: file:///Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
==> virtualbox-iso: Downloading or copying ISO
    virtualbox-iso: Downloading or copying: file:///Users/lothar/GitHub/packer-windows10-insider/iso/Windows10_InsiderPreview_x64_de-de_17025.iso
==> virtualbox-iso: Creating floppy disk...
    virtualbox-iso: Copying files flatly from floppy_files
    virtualbox-iso: Copying file: Autounattend.xml
    virtualbox-iso: Copying file: update-windows.ps1
    virtualbox-iso: Copying file: enable-winrm.ps1
    virtualbox-iso: Done copying files from floppy_files
    virtualbox-iso: Collecting paths from floppy_dirs
    virtualbox-iso: Resulting paths from floppy_dirs : []
    virtualbox-iso: Done copying paths from floppy_dirs
==> virtualbox-iso: Creating virtual machine...
==> virtualbox-iso: Creating hard drive...
==> virtualbox-iso: Attaching floppy disk...
==> virtualbox-iso: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 3761)
==> virtualbox-iso: Executing custom VBoxManage commands...
    virtualbox-iso: Executing: modifyvm packer-virtualbox-iso-1518879178 --memory 1024
    virtualbox-iso: Executing: modifyvm packer-virtualbox-iso-1518879178 --cpus 2
    virtualbox-iso: Executing: modifyvm packer-virtualbox-iso-1518879178 --vram 32
==> virtualbox-iso: Starting the virtual machine...
==> virtualbox-iso: Waiting 10s for boot...
==> virtualbox-iso: Typing the boot command...
==> virtualbox-iso: Waiting for WinRM to become available...
    virtualbox-iso: WinRM connected.
    virtualbox-iso: #< CLIXML
    virtualbox-iso: <Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04"><Obj S="progress" RefId="0"><TN RefId="0"><T>System.Management.Automation.PSCustomObject</T><T>System.Object</T></TN><MS><I64 N="SourceId">1</I64><PR N="Record"><AV>Module werden für erstmalige Verwendung vorbereitet.</AV><AI>0</AI><Nil /><PI>-1</PI><PC>-1</PC><T>Completed</T><SR>-1</SR><SD> </SD></PR></MS></Obj><Obj S="progress" RefId="1"><TNRef RefId="0" /><MS><I64 N="SourceId">1</I64><PR N="Record"><AV>Module werden für erstmalige Verwendung vorbereitet.</AV><AI>0</AI><Nil /><PI>-1</PI><PC>-1</PC><T>Completed</T><SR>-1</SR><SD> </SD></PR></MS></Obj></Objs>
==> virtualbox-iso: Connected to WinRM!
==> virtualbox-iso: Uploading VirtualBox version info (5.2.6)
==> virtualbox-iso: Restarting Machine
==> virtualbox-iso: Waiting for machine to restart...
    virtualbox-iso: Der Computer wird heruntergefahren.(1115)
    virtualbox-iso: WIN10 restarted.
    virtualbox-iso: #< CLIXML
    virtualbox-iso: <Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04"><Obj S="progress" RefId="0"><TN RefId="0"><T>System.Management.Automation.PSCustomObject</T><T>System.Object</T></TN><MS><I64 N="SourceId">1</I64><PR N="Record"><AV>Module werden für erstmalige Verwendung vorbereitet.</AV><AI>0</AI><Nil /><PI>-1</PI><PC>-1</PC><T>Completed</T><SR>-1</SR><SD> </SD></PR></MS></Obj></Objs>
==> virtualbox-iso: Machine successfully restarted, moving on
==> virtualbox-iso: Provisioning with Powershell...
==> virtualbox-iso: Provisioning with powershell script: enable-rdp.ps1
==> virtualbox-iso: Provisioning with Powershell...
==> virtualbox-iso: Provisioning with powershell script: guest-tools.ps1
    virtualbox-iso: VBoxCertUtil.exe: info: Successfully added 'E:\cert\vbox-sha256.cer' as trusted publisher
    virtualbox-iso: VBoxCertUtil.exe: info: Successfully added 'E:\cert\vbox-sha256-r3.cer' as root
==> virtualbox-iso: Provisioning with Powershell...
==> virtualbox-iso: Provisioning with powershell script: chocolatey.ps1
    virtualbox-iso: Getting latest version of the Chocolatey package for download.
    virtualbox-iso: Getting Chocolatey from https://chocolatey.org/api/v2/package/chocolatey/0.10.8.
    virtualbox-iso: Downloading 7-Zip commandline tool prior to extraction.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\chocInstall\chocolatey.zip to C:\Users\vagrant\AppData\Local\Temp\chocolatey\chocInstall...
    virtualbox-iso: Installing chocolatey on this machine
    virtualbox-iso: Creating ChocolateyInstall as an environment variable (targeting 'Machine')
    virtualbox-iso:   Setting ChocolateyInstall to 'C:\ProgramData\chocolatey'
    virtualbox-iso: WARNING: It's very likely you will need to close and reopen your shell
    virtualbox-iso:   before you can use choco.
    virtualbox-iso: Restricting write permissions to Administrators
    virtualbox-iso: We are setting up the Chocolatey package repository.
    virtualbox-iso: The packages themselves go to 'C:\ProgramData\chocolatey\lib'
    virtualbox-iso:   (i.e. C:\ProgramData\chocolatey\lib\yourPackageName).
    virtualbox-iso: A shim file for the command line goes to 'C:\ProgramData\chocolatey\bin'
    virtualbox-iso:   and points to an executable in 'C:\ProgramData\chocolatey\lib\yourPackageName'.
    virtualbox-iso:
    virtualbox-iso: Creating Chocolatey folders if they do not already exist.
    virtualbox-iso:
    virtualbox-iso: WARNING: You can safely ignore errors related to missing log files when
    virtualbox-iso:   upgrading from a version of Chocolatey less than 0.9.9.
    virtualbox-iso:   'Batch file could not be found' is also safe to ignore.
    virtualbox-iso:   'The system cannot find the file specified' - also safe.
    virtualbox-iso: chocolatey.nupkg file not installed in lib.
    virtualbox-iso:  Attempting to locate it from bootstrapper.
    virtualbox-iso: PATH environment variable does not have C:\ProgramData\chocolatey\bin in it. Adding...
    virtualbox-iso: WARNUNG: Not setting tab completion: Profile file does not exist at
    virtualbox-iso: 'C:\Users\vagrant\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'.
    virtualbox-iso: Chocolatey (choco.exe) is now ready.
    virtualbox-iso: You can call choco from anywhere, command line or powershell by typing choco.
    virtualbox-iso: Run choco /? for a list of functions.
    virtualbox-iso: You may need to shut down and restart powershell and/or consoles
    virtualbox-iso:  first prior to using choco.
    virtualbox-iso: Ensuring chocolatey commands are on the path
    virtualbox-iso: Ensuring chocolatey.nupkg is in the lib folder
==> virtualbox-iso: Provisioning with Powershell...
==> virtualbox-iso: Provisioning with powershell script: choco-packs.ps1
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: chocolateygui
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading ChocolateyGUI 0.16.0... 100%
    virtualbox-iso:
    virtualbox-iso: ChocolateyGUI v0.16.0 [Approved]
    virtualbox-iso: chocolateygui package files install completed. Performing other installation steps.
    virtualbox-iso: Installing ChocolateyGUI...
    virtualbox-iso: ChocolateyGUI has been installed.
    virtualbox-iso:   chocolateygui may be able to be automatically uninstalled.
    virtualbox-iso:  The install of chocolateygui was successful.
    virtualbox-iso:   Software installed as 'msi', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: jdk9
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading jdk9 9.0.4.11... 100%
    virtualbox-iso:
    virtualbox-iso: jdk9 v9.0.4.11 [Approved]
    virtualbox-iso: jdk9 package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading JDK from http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_windows-x64_bin.exe
    virtualbox-iso: Installing jdk9...
    virtualbox-iso: jdk9 has been installed.
    virtualbox-iso: PATH environment variable does not have C:\Program Files\Java\jdk-9.0.4\bin in it. Adding...
    virtualbox-iso:   jdk9 may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of jdk9 was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files\Java\jdk-9.0.4\'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: ant
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading jdk8 8.0.162... 100%
    virtualbox-iso: Progress: Downloading ant 1.10.1... 100%
    virtualbox-iso:
    virtualbox-iso: jdk8 v8.0.162 [Approved]
    virtualbox-iso: jdk8 package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading JDK from http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-windows-x64.exe
    virtualbox-iso: Installing jdk8...
    virtualbox-iso: jdk8 has been installed.
    virtualbox-iso: PATH environment variable does not have C:\Program Files\Java\jdk1.8.0_162\bin in it. Adding...
    virtualbox-iso:   jdk8 may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of jdk8 was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files\Java\jdk1.8.0_162\'
    virtualbox-iso:
    virtualbox-iso: ant v1.10.1 [Approved]
    virtualbox-iso: ant package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading ant
    virtualbox-iso:   from 'https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.1-bin.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\ant\1.10.1\apache-ant-1.10.1-bin.zip (8.42 MB).
    virtualbox-iso: Download of apache-ant-1.10.1-bin.zip (8.42 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\ant\1.10.1\apache-ant-1.10.1-bin.zip to C:\ProgramData\chocolatey\lib\ant...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\ant
    virtualbox-iso: Added C:\ProgramData\chocolatey\bin\ant.exe shim pointed to '..\lib\ant\apache-ant-1.10.1\bin\ant.bat'.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of ant was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\ant'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 2/2 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: maven
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading maven 3.5.2.1... 100%
    virtualbox-iso:
    virtualbox-iso: maven v3.5.2.1 [Approved]
    virtualbox-iso: maven package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading Maven
    virtualbox-iso:   from 'https://archive.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\maven\3.5.2.1\apache-maven-3.5.2-bin.zip (8.49 MB).
    virtualbox-iso: Download of apache-maven-3.5.2-bin.zip (8.49 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\maven\3.5.2.1\apache-maven-3.5.2-bin.zip to C:\ProgramData\chocolatey\lib\maven...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\maven
    virtualbox-iso: C:\Users\vagrant\.m2
    virtualbox-iso: Added C:\ProgramData\chocolatey\bin\mvn.exe shim pointed to '..\lib\maven\apache-maven-3.5.2\bin\mvn.cmd'.
    virtualbox-iso: Added C:\ProgramData\chocolatey\bin\mvnDebug.exe shim pointed to '..\lib\maven\apache-maven-3.5.2\bin\mvndebug.cmd'.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of maven was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\maven'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: gradle
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading gradle 4.5.1... 100%
    virtualbox-iso:
    virtualbox-iso: gradle v4.5.1 [Approved]
    virtualbox-iso: gradle package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading gradle
    virtualbox-iso:   from 'https://services.gradle.org/distributions/gradle-4.5.1-bin.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\gradle\4.5.1\gradle-4.5.1-bin.zip (69.07 MB).
    virtualbox-iso: Download of gradle-4.5.1-bin.zip (69.07 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\gradle\4.5.1\gradle-4.5.1-bin.zip to C:\ProgramData\chocolatey\lib\gradle\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\gradle\tools
    virtualbox-iso: Added C:\ProgramData\chocolatey\bin\gradle.exe shim pointed to '..\lib\gradle\tools\gradle-4.5.1\bin\gradle.bat'.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of gradle was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\gradle\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: nodejs
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading nodejs.install 9.5.0... 100%
    virtualbox-iso: Progress: Downloading nodejs 9.5.0... 100%
    virtualbox-iso:
    virtualbox-iso: nodejs.install v9.5.0 [Approved]
    virtualbox-iso: nodejs.install package files install completed. Performing other installation steps.
    virtualbox-iso: Installing 64 bit version
    virtualbox-iso: Installing nodejs.install...
    virtualbox-iso: nodejs.install has been installed.
    virtualbox-iso:   nodejs.install may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of nodejs.install was successful.
    virtualbox-iso:   Software installed as 'msi', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: nodejs v9.5.0 [Approved]
    virtualbox-iso: nodejs package files install completed. Performing other installation steps.
    virtualbox-iso:  The install of nodejs was successful.
    virtualbox-iso:   Software install location not explicitly set, could be in package or
    virtualbox-iso:   default install location if installer.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 2/2 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: yarn
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading yarn 1.3.2... 100%
    virtualbox-iso:
    virtualbox-iso: yarn v1.3.2 [Approved]
    virtualbox-iso: yarn package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading yarn
    virtualbox-iso:   from 'https://yarnpkg.com/downloads/1.3.2/yarn-1.3.2.msi'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\yarn\1.3.2\yarn-1.3.2.msi (1.24 MB).
    virtualbox-iso: Download of yarn-1.3.2.msi (1.24 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing yarn...
    virtualbox-iso: yarn has been installed.
    virtualbox-iso: #< CLIXML
    virtualbox-iso: <Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04"><Obj S="progress" RefId="0"><TN RefId="0"><T>System.Management.Automation.PSCustomObject</T><T>System.Object</T></TN><MS><I64 N="SourceId">1</I64><PR N="Record"><AV>Module werden für erstmalige Verwendung vorbereitet.</AV><AI>0</AI><Nil /><PI>-1</PI><PC>-1</PC><T>Completed</T><SR>-1</SR><SD> </SD></PR></MS></Obj><Obj S="progress" RefId="1"><TNRef RefId="0" /><MS><I64 N="SourceId">1</I64><PR N="Record"><AV>Module werden für erstmalige Verwendung vorbereitet.</AV><AI>0</AI><Nil /><PI>-1</PI><PC>-1</PC><T>Completed</T><SR>-1</SR><SD> </SD></PR></MS></Obj><S S="debug">Host version is 5.1.17025.1000, PowerShell Version is '5.1.17025.1000' and CLR Version is '4.0.30319.42000'.</S><S S="verbose">Exportfunktion "Format-FileSize".</S><S S="verbose">Exportfunktion "Get-ChecksumValid".</S><S S="verbose">Exportfunktion "Get-ChocolateyUnzip".</S><S S="verbose">Exportfunktion "Get-ChocolateyWebFile".</S><S S="verbose">Exportfunktion "Get-EnvironmentVariable".</S><S S="verbose">Exportfunktion "Get-EnvironmentVariableNames".</S><S S="verbose">Exportfunktion "Get-FtpFile".</S><S S="verbose">Exportfunktion "Get-OSArchitectureWidth".</S><S S="verbose">Exportfunktion "Get-PackageParameters".</S><S S="verbose">Exportfunktion "Get-ToolsLocation".</S><S S="verbose">Exportfunktion "Get-UACEnabled".</S><S S="verbose">Exportfunktion "Get-UninstallRegistryKey".</S><S S="verbose">Exportfunktion "Get-VirusCheckValid".</S><S S="verbose">Exportfunktion "Get-WebFile".</S><S S="verbose">Exportfunktion "Get-WebFileName".</S><S S="verbose">Exportfunktion "Get-WebHeaders".</S><S S="verbose">Exportfunktion "Install-BinFile".</S><S S="verbose">Exportfunktion "Install-ChocolateyDesktopLink".</S><S S="verbose">Exportfunktion "Install-ChocolateyEnvironmentVariable".</S><S S="verbose">Exportfunktion "Install-ChocolateyExplorerMenuItem".</S><S S="verbose">Exportfunktion "Install-ChocolateyFileAssociation".</S><S S="verbose">Exportfunktion "Install-ChocolateyInstallPackage".</S><S S="verbose">Exportfunktion "Install-ChocolateyPackage".</S><S S="verbose">Exportfunktion "Install-ChocolateyPath".</S><S S="verbose">Exportfunktion "Install-ChocolateyPinnedTaskBarItem".</S><S S="verbose">Exportfunktion "Install-ChocolateyPowershellCommand".</S><S S="verbose">Exportfunktion "Install-ChocolateyShortcut".</S><S S="verbose">Exportfunktion "Install-ChocolateyVsixPackage".</S><S S="verbose">Exportfunktion "Install-ChocolateyZipPackage".</S><S S="verbose">Exportfunktion "Install-Vsix".</S><S S="verbose">Exportfunktion "Set-EnvironmentVariable".</S><S S="verbose">Exportfunktion "Set-PowerShellExitCode".</S><S S="verbose">Exportfunktion "Start-ChocolateyProcessAsAdmin".</S><S S="verbose">Exportfunktion "Test-ProcessAdminRights".</S><S S="verbose">Exportfunktion "Uninstall-BinFile".</S><S S="verbose">Exportfunktion "Uninstall-ChocolateyEnvironmentVariable".</S><S S="verbose">Exportfunktion "Uninstall-ChocolateyPackage".</S><S S="verbose">Exportfunktion "Uninstall-ChocolateyZipPackage".</S><S S="verbose">Exportfunktion "Update-SessionEnvironment".</S><S S="verbose">Exportfunktion "Write-ChocolateyFailure".</S><S S="verbose">Exportfunktion "Write-ChocolateySuccess".</S><S S="verbose">Exportfunktion "Write-FileUpdateLog".</S><S S="verbose">Exportfunktion "Write-FunctionCallLogMessage".</S><S S="verbose">Exportieren des Alias "Get-ProcessorBits".</S><S S="verbose">Exportieren des Alias "Get-OSBitness".</S><S S="verbose">Exportieren des Alias "Get-InstallRegistryKey".</S><S S="verbose">Exportieren des Alias "Generate-BinFile".</S><S S="verbose">Exportieren des Alias "Add-BinFile".</S><S S="verbose">Exportieren des Alias "Start-ChocolateyProcess".</S><S S="verbose">Exportieren des Alias "Invoke-ChocolateyProcess".</S><S S="verbose">Exportieren des Alias "Remove-BinFile".</S><S S="verbose">Exportieren des Alias "refreshenv".</S><S S="verbose">Exportfunktion "Format-FileSize".</S><S S="verbose">Exportfunktion "Get-ChecksumValid".</S><S S="verbose">Exportfunktion "Get-ChocolateyUnzip".</S><S S="verbose">Exportfunktion "Get-ChocolateyWebFile".</S><S S="verbose">Exportfunktion "Get-EnvironmentVariable".</S><S S="verbose">Exportfunktion "Get-EnvironmentVariableNames".</S><S S="verbose">Exportfunktion "Get-FtpFile".</S><S S="verbose">Exportfunktion "Get-OSArchitectureWidth".</S><S S="verbose">Exportfunktion "Get-PackageParameters".</S><S S="verbose">Exportfunktion "Get-ToolsLocation".</S><S S="verbose">Exportfunktion "Get-UACEnabled".</S><S S="verbose">Exportfunktion "Get-UninstallRegistryKey".</S><S S="verbose">Exportfunktion "Get-VirusCheckValid".</S><S S="verbose">Exportfunktion "Get-WebFile".</S><S S="verbose">Exportfunktion "Get-WebFileName".</S><S S="verbose">Exportfunktion "Get-WebHeaders".</S><S S="verbose">Exportfunktion "Install-BinFile".</S><S S="verbose">Exportfunktion "Install-ChocolateyDesktopLink".</S><S S="verbose">Exportfunktion "Install-ChocolateyEnvironmentVariable".</S><S S="verbose">Exportfunktion "Install-ChocolateyExplorerMenuItem".</S><S S="verbose">Exportfunktion "Install-ChocolateyFileAssociation".</S><S S="verbose">Exportfunktion "Install-ChocolateyInstallPackage".</S><S S="verbose">Exportfunktion "Install-ChocolateyPackage".</S><S S="verbose">Exportfunktion "Install-ChocolateyPath".</S><S S="verbose">Exportfunktion "Install-ChocolateyPinnedTaskBarItem".</S><S S="verbose">Exportfunktion "Install-ChocolateyPowershellCommand".</S><S S="verbose">Exportfunktion "Install-ChocolateyShortcut".</S><S S="verbose">Exportfunktion "Install-ChocolateyVsixPackage".</S><S S="verbose">Exportfunktion "Install-ChocolateyZipPackage".</S><S S="verbose">Exportfunktion "Install-Vsix".</S><S S="verbose">Exportfunktion "Set-EnvironmentVariable".</S><S S="verbose">Exportfunktion "Set-PowerShellExitCode".</S><S S="verbose">Exportfunktion "Start-ChocolateyProcessAsAdmin".</S><S S="verbose">Exportfunktion "Test-ProcessAdminRights".</S><S S="verbose">Exportfunktion "Uninstall-BinFile".</S><S S="verbose">Exportfunktion "Uninstall-ChocolateyEnvironmentVariable".</S><S S="verbose">Exportfunktion "Uninstall-ChocolateyPackage".</S><S S="verbose">Exportfunktion "Uninstall-ChocolateyZipPackage".</S><S S="verbose">Exportfunktion "Update-SessionEnvironment".</S><S S="verbose">Exportfunktion "Write-ChocolateyFailure".</S><S S="verbose">Exportfunktion "Write-ChocolateySuccess".</S><S S="verbose">Exportfunktion "Write-FileUpdateLog".</S><S S="verbose">Exportfunktion "Write-FunctionCallLogMessage".</S><S S="verbose">Exportieren des Alias "Get-ProcessorBits".</S><S S="verbose">Exportieren des Alias "Get-OSBitness".</S><S S="verbose">Exportieren des Alias "Get-InstallRegistryKey".</S><S S="verbose">Exportieren des Alias "Generate-BinFile".</S><S S="verbose">Exportieren des Alias "Add-BinFile".</S><S S="verbose">Exportieren des Alias "Start-ChocolateyProcess".</S><S S="verbose">Exportieren des Alias "Invoke-ChocolateyProcess".</S><S S="verbose">Exportieren des Alias "Remove-BinFile".</S><S S="verbose">Exportieren des Alias "refreshenv".</S></Objs>
    virtualbox-iso: 0
    virtualbox-iso: Only an exit code of non-zero will fail the package by default. Set
    virtualbox-iso:  `--failonstderr` if you want error messages to also fail a script. See
    virtualbox-iso:  `choco -h` for details.
    virtualbox-iso:   yarn may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of yarn was successful.
    virtualbox-iso:   Software installed as 'msi', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: miniconda3
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading miniconda3 4.3.21... 100%
    virtualbox-iso:
    virtualbox-iso: miniconda3 v4.3.21 [Approved]
    virtualbox-iso: miniconda3 package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading miniconda3 64 bit
    virtualbox-iso:   from 'https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Windows-x86_64.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\miniconda3\4.3.21\Miniconda3-4.3.21-Windows-x86_64.exe (57.82 MB).
    virtualbox-iso: Download of Miniconda3-4.3.21-Windows-x86_64.exe (57.82 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing miniconda3...
    virtualbox-iso: miniconda3 has been installed.
    virtualbox-iso:   miniconda3 can be automatically uninstalled.
    virtualbox-iso:  The install of miniconda3 was successful.
    virtualbox-iso:   Software installed as 'EXE', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: anaconda3
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading chocolatey-core.extension 1.3.3... 100%
    virtualbox-iso: Progress: Downloading anaconda3 5.0.1... 100%
    virtualbox-iso:
    virtualbox-iso: chocolatey-core.extension v1.3.3 [Approved]
    virtualbox-iso: chocolatey-core.extension package files install completed. Performing other installation steps.
    virtualbox-iso:  Installed/updated chocolatey-core extensions.
    virtualbox-iso:  The install of chocolatey-core.extension was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\extensions\chocolatey-core'
    virtualbox-iso:
    virtualbox-iso: anaconda3 v5.0.1 [Approved]
    virtualbox-iso: anaconda3 package files install completed. Performing other installation steps.
    virtualbox-iso: WARNING: installing anaconda3, this can take a long time, because the installer will write tons of files on your disk
    virtualbox-iso: WARNING: Please sit back and relax
    virtualbox-iso: WARNING: This usually will take 10-15 mins on an SSD, and about 30 mins on HDD
    virtualbox-iso: WARNING:
    virtualbox-iso: WARNING: If you want to make sure the program is running, you can open Task Manager
    virtualbox-iso: WARNING: you will find the installer running in Background Process
    virtualbox-iso: WARNING: Url has SSL/TLS available, switching to HTTPS for download
    virtualbox-iso: Downloading anaconda3 64 bit
    virtualbox-iso:   from 'https://repo.continuum.io/archive/Anaconda3-5.0.1-Windows-x86_64.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\anaconda3\5.0.1\Anaconda3-5.0.1-Windows-x86_64.exe (514.82 MB).
    virtualbox-iso: Download of Anaconda3-5.0.1-Windows-x86_64.exe (514.82 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing anaconda3...
    virtualbox-iso: anaconda3 has been installed.
    virtualbox-iso:   anaconda3 can be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of anaconda3 was successful.
    virtualbox-iso:   Software installed to 'C:\tools\anaconda3'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 2/2 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso:
    virtualbox-iso: Did you know the proceeds of Pro (and some proceeds from other
    virtualbox-iso:  licensed editions) go into bettering the community infrastructure?
    virtualbox-iso:  Your support ensures an active community, keeps Chocolatey tip top,
    virtualbox-iso:  plus it nets you some awesome features!
    virtualbox-iso:  https://chocolatey.org/compare
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: ruby
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading ruby 2.5.0.1... 100%
    virtualbox-iso:
    virtualbox-iso: ruby v2.5.0.1 [Approved]
    virtualbox-iso: ruby package files install completed. Performing other installation steps.
    virtualbox-iso: Ruby is going to be installed in 'C:\tools\ruby25'
    virtualbox-iso: Installing 64-bit ruby...
    virtualbox-iso: ruby has been installed.
    virtualbox-iso:   ruby can be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  ShimGen has successfully created a shim for rubyinstaller-2.5.0-1-x86_x32.exe
    virtualbox-iso:  The install of ruby was successful.
    virtualbox-iso:   Software installed to 'C:\tools\ruby25\'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: docker-toolbox
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading git.install 2.16.1.4... 100%
    virtualbox-iso: Progress: Downloading docker-toolbox 18.02.0... 100%
    virtualbox-iso:
    virtualbox-iso: git.install v2.16.1.4 [Approved]
    virtualbox-iso: git.install package files install completed. Performing other installation steps.
    virtualbox-iso: Using Git LFS
    virtualbox-iso: Installing 64-bit git.install...
    virtualbox-iso: git.install has been installed.
    virtualbox-iso: git.install installed to 'C:\Program Files\Git'
    virtualbox-iso:   git.install can be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of git.install was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files\Git\'
    virtualbox-iso:
    virtualbox-iso: docker-toolbox v18.02.0 [Approved]
    virtualbox-iso: docker-toolbox package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading docker-toolbox
    virtualbox-iso:   from 'https://github.com/docker/toolbox/releases/download/v18.02.0-ce/DockerToolbox-18.02.0-ce.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\docker-toolbox\18.02.0\DockerToolbox-18.02.0-ce.exe (210.08 MB).
    virtualbox-iso: Download of DockerToolbox-18.02.0-ce.exe (210.08 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing docker-toolbox...
    virtualbox-iso: docker-toolbox has been installed.
    virtualbox-iso:   docker-toolbox can be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of docker-toolbox was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files\Docker Toolbox\'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 2/2 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: docker
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading docker 17.10.0... 100%
    virtualbox-iso:
    virtualbox-iso: docker v17.10.0 [Approved]
    virtualbox-iso: docker package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading docker 64 bit
    virtualbox-iso:   from 'https://download.docker.com/win/static/edge/x86_64/docker-17.10.0-ce.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\docker\17.10.0\docker-17.10.0-ce.zip (16.38 MB).
    virtualbox-iso: Download of docker-17.10.0-ce.zip (16.38 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\docker\17.10.0\docker-17.10.0-ce.zip to C:\ProgramData\chocolatey\lib\docker\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\docker\tools
    virtualbox-iso:  ShimGen has successfully created a shim for docker.exe
    virtualbox-iso:  The install of docker was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\docker\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: kubernetes-cli
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading kubernetes-cli 1.9.2... 100%
    virtualbox-iso:
    virtualbox-iso: kubernetes-cli v1.9.2 [Approved]
    virtualbox-iso: kubernetes-cli package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading kubernetes-cli 64 bit
    virtualbox-iso:   from 'https://dl.k8s.io/v1.9.2/kubernetes-client-windows-amd64.tar.gz'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\kubernetes-cli\1.9.2\kubernetes-client-windows-amd64.tar.gz (14.94 MB).
    virtualbox-iso: Download of kubernetes-client-windows-amd64.tar.gz (14.94 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\kubernetes-cli\1.9.2\kubernetes-client-windows-amd64.tar.gz to C:\ProgramData\chocolatey\lib\kubernetes-cli\tools\temp...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\kubernetes-cli\tools\temp
    virtualbox-iso: Extracting C:\ProgramData\chocolatey\lib\kubernetes-cli\tools\temp to C:\ProgramData\chocolatey\lib\kubernetes-cli\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\kubernetes-cli\tools
    virtualbox-iso:  ShimGen has successfully created a shim for kubectl.exe
    virtualbox-iso:  The install of kubernetes-cli was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\kubernetes-cli\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: etcd
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading NSSM 2.24.101.20180116... 100%
    virtualbox-iso: Progress: Downloading etcd 3.3.0... 100%
    virtualbox-iso:
    virtualbox-iso: NSSM v2.24.101.20180116 [Approved]
    virtualbox-iso: nssm package files install completed. Performing other installation steps.
    virtualbox-iso: Installing 64 bit version
    virtualbox-iso: Extracting C:\ProgramData\chocolatey\lib\NSSM\tools\nssm-2.24-101-g897c7ad.zip to C:\ProgramData\chocolatey\lib\NSSM\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\NSSM\tools
    virtualbox-iso:  ShimGen has successfully created a shim for nssm.exe
    virtualbox-iso:  The install of nssm was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\NSSM\tools'
    virtualbox-iso:
    virtualbox-iso: etcd v3.3.0 [Approved]
    virtualbox-iso: etcd package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading etcd 64 bit
    virtualbox-iso:   from 'https://github.com/coreos/etcd/releases/download/v3.3.0/etcd-v3.3.0-windows-amd64.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\etcd\3.3.0\etcd-v3.3.0-windows-amd64.zip (10.8 MB).
    virtualbox-iso: Download of etcd-v3.3.0-windows-amd64.zip (10.8 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\etcd\3.3.0\etcd-v3.3.0-windows-amd64.zip to C:\ProgramData\etcd...
    virtualbox-iso: C:\ProgramData\etcd
    virtualbox-iso: Service "etcd" installed successfully!
    virtualbox-iso:
    virtualbox-iso: Set parameter "Start" for service "etcd".
    virtualbox-iso:
    virtualbox-iso:  ShimGen has successfully created a shim for etcdctl.exe
    virtualbox-iso:  The install of etcd was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\etcd'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 2/2 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: minikube
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading Minikube 0.25.0... 100%
    virtualbox-iso:
    virtualbox-iso: Minikube v0.25.0 [Approved]
    virtualbox-iso: minikube package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading minikube 64 bit
    virtualbox-iso:   from 'https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-windows-amd64.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\ProgramData\chocolatey\lib\Minikube\tools\minikube.exe (41.53 MB).
    virtualbox-iso: Download of minikube.exe (41.53 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: C:\ProgramData\chocolatey\lib\Minikube\tools\minikube.exe
    virtualbox-iso:  ShimGen has successfully created a shim for minikube.exe
    virtualbox-iso:  The install of minikube was successful.
    virtualbox-iso:   Software install location not explicitly set, could be in package or
    virtualbox-iso:   default install location if installer.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: openshift-cli
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading openshift-cli 3.7.1... 100%
    virtualbox-iso:
    virtualbox-iso: openshift-cli v3.7.1 [Approved]
    virtualbox-iso: openshift-cli package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading openshift-cli
    virtualbox-iso:   from 'https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-windows.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\openshift-cli\3.7.1\openshift-origin-client-tools-v3.7.1-ab0f056-windows.zip (38.43 MB).
    virtualbox-iso: Download of openshift-origin-client-tools-v3.7.1-ab0f056-windows.zip (38.43 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\openshift-cli\3.7.1\openshift-origin-client-tools-v3.7.1-ab0f056-windows.zip to C:\ProgramData\chocolatey\lib\openshift-cli\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\openshift-cli\tools
    virtualbox-iso:  ShimGen has successfully created a shim for oc.exe
    virtualbox-iso:  The install of openshift-cli was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\openshift-cli\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: minishift
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading minishift 1.12.0... 100%
    virtualbox-iso:
    virtualbox-iso: minishift v1.12.0 [Approved]
    virtualbox-iso: minishift package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading minishift 64 bit
    virtualbox-iso:   from 'https://github.com/minishift/minishift/releases/download/v1.12.0/minishift-1.12.0-windows-amd64.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\minishift\1.12.0\minishift-1.12.0-windows-amd64.zip (5.25 MB).
    virtualbox-iso: Download of minishift-1.12.0-windows-amd64.zip (5.25 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\minishift\1.12.0\minishift-1.12.0-windows-amd64.zip to C:\ProgramData\chocolatey\lib\minishift\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\minishift\tools
    virtualbox-iso:  ShimGen has successfully created a shim for minishift.exe
    virtualbox-iso:  The install of minishift was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\minishift\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: github-desktop
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading github-desktop 1.0.13... 100%
    virtualbox-iso:
    virtualbox-iso: github-desktop v1.0.13 [Approved]
    virtualbox-iso: github-desktop package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading github-desktop
    virtualbox-iso:   from 'https://desktop.githubusercontent.com/releases/1.0.13-edec4470/GitHubDesktopSetup.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\github-desktop\1.0.13\GitHubDesktopSetup.exe (80.58 MB).
    virtualbox-iso: Download of GitHubDesktopSetup.exe (80.58 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing github-desktop...
    virtualbox-iso: github-desktop has been installed.
    virtualbox-iso:   github-desktop can be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of github-desktop was successful.
    virtualbox-iso:   Software installed to 'C:\Users\vagrant\AppData\Local\GitHubDesktop'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso:
    virtualbox-iso: Did you know the proceeds of Pro (and some proceeds from other
    virtualbox-iso:  licensed editions) go into bettering the community infrastructure?
    virtualbox-iso:  Your support ensures an active community, keeps Chocolatey tip top,
    virtualbox-iso:  plus it nets you some awesome features!
    virtualbox-iso:  https://chocolatey.org/compare
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: eclipse
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading eclipse 4.7.2... 100%
    virtualbox-iso:
    virtualbox-iso: eclipse v4.7.2 [Approved]
    virtualbox-iso: eclipse package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading eclipse 64 bit
    virtualbox-iso:   from 'https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/2/eclipse-jee-oxygen-2-win32-x86_64.zip&r=1'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\eclipse\4.7.2\eclipse-jee-oxygen-2-win32-x86_64.zip (331.46 MB).
    virtualbox-iso: Download of eclipse-jee-oxygen-2-win32-x86_64.zip (331.46 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\eclipse\4.7.2\eclipse-jee-oxygen-2-win32-x86_64.zip to C:\Program Files\Eclipse 4.7.2...
    virtualbox-iso: C:\Program Files\Eclipse 4.7.2
    virtualbox-iso:  The install of eclipse was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files\Eclipse 4.7.2'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso:
    virtualbox-iso: Enjoy using Chocolatey? Explore more amazing features to take your
    virtualbox-iso: experience to the next level at
    virtualbox-iso:  https://chocolatey.org/compare
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: intellijidea-community
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading intellijidea-community 2017.3.3... 100%
    virtualbox-iso:
    virtualbox-iso: intellijidea-community v2017.3.3 [Approved]
    virtualbox-iso: intellijidea-community package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading intellijidea-community 64 bit
    virtualbox-iso:   from 'https://download.jetbrains.com/idea/ideaIC-2017.3.3.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\intellijidea-community\2017.3.3\ideaIC-2017.3.3.exe (367.09 MB).
    virtualbox-iso: Download of ideaIC-2017.3.3.exe (367.09 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing intellijidea-community...
    virtualbox-iso: intellijidea-community has been installed.
    virtualbox-iso:   intellijidea-community may be able to be automatically uninstalled.
    virtualbox-iso:  The install of intellijidea-community was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files (x86)\JetBrains\IntelliJ IDEA Community Edition 2017.3.3'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: visualstudiocode
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading VisualStudioCode 1.20.1... 100%
    virtualbox-iso: Progress: Downloading DotNet4.5.2 4.5.2.20140902... 100%
    virtualbox-iso:
    virtualbox-iso: DotNet4.5.2 v4.5.2.20140902 [Approved]
    virtualbox-iso: dotnet4.5.2 package files install completed. Performing other installation steps.
    virtualbox-iso: Microsoft .Net 4.5.2 Framework is already installed on your machine.
    virtualbox-iso:  The install of dotnet4.5.2 was successful.
    virtualbox-iso:   Software install location not explicitly set, could be in package or
    virtualbox-iso:   default install location if installer.
    virtualbox-iso:
    virtualbox-iso: VisualStudioCode v1.20.1 [Approved]
    virtualbox-iso: visualstudiocode package files install completed. Performing other installation steps.
    virtualbox-iso: Merge Tasks:
    virtualbox-iso: !runCode, desktopicon, quicklaunchicon, addcontextmenufiles, addcontextmenufolders, addtopath
    virtualbox-iso: Downloading visualstudiocode 64 bit
    virtualbox-iso:   from 'https://az764295.vo.msecnd.net/stable/f88bbf9137d24d36d968ea6b2911786bfe103002/VSCodeSetup-x64-1.20.1.exe'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\VisualStudioCode\1.20.1\VSCodeSetup-x64-1.20.1.exe (42.27 MB).
    virtualbox-iso: Download of VSCodeSetup-x64-1.20.1.exe (42.27 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing visualstudiocode...
    virtualbox-iso: visualstudiocode has been installed.
    virtualbox-iso:   visualstudiocode can be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of visualstudiocode was successful.
    virtualbox-iso:   Software installed to 'C:\Program Files\Microsoft VS Code\'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 2/2 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: awscli
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading awscli 1.14.40... 100%
    virtualbox-iso:
    virtualbox-iso: awscli v1.14.40 [Approved]
    virtualbox-iso: awscli package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading awscli 64 bit
    virtualbox-iso:   from 'https://s3.amazonaws.com/aws-cli/AWSCLI64-1.14.40.msi'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\awscli\1.14.40\AWSCLI64-1.14.40.msi (10.07 MB).
    virtualbox-iso: Download of AWSCLI64-1.14.40.msi (10.07 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing awscli...
    virtualbox-iso: awscli has been installed.
    virtualbox-iso:   awscli may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of awscli was successful.
    virtualbox-iso:   Software installed as 'msi', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: azure-cli
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading azure-cli 2.0.27... 100%
    virtualbox-iso:
    virtualbox-iso: azure-cli v2.0.27 [Approved]
    virtualbox-iso: azure-cli package files install completed. Performing other installation steps.
    virtualbox-iso: Installing azure-cli...
    virtualbox-iso: azure-cli has been installed.
    virtualbox-iso:   azure-cli may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of azure-cli was successful.
    virtualbox-iso:   Software installed as 'msi', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: wget
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading Wget 1.19.4... 100%
    virtualbox-iso:
    virtualbox-iso: Wget v1.19.4 [Approved]
    virtualbox-iso: wget package files install completed. Performing other installation steps.
    virtualbox-iso: Getting x64 bit zip
    virtualbox-iso: Extracting C:\ProgramData\chocolatey\lib\Wget\tools\wget-1.19.4-win64_x64.zip to C:\ProgramData\chocolatey\lib\Wget\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\Wget\tools
    virtualbox-iso:  ShimGen has successfully created a shim for wget.exe
    virtualbox-iso:  The install of wget was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\Wget\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: packer
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading packer 1.2.0... 100%
    virtualbox-iso:
    virtualbox-iso: packer v1.2.0 [Approved]
    virtualbox-iso: packer package files install completed. Performing other installation steps.
    virtualbox-iso: Removing old packer plugins
    virtualbox-iso: Downloading packer 64 bit
    virtualbox-iso:   from 'https://releases.hashicorp.com/packer/1.2.0/packer_1.2.0_windows_amd64.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\packer\1.2.0\packer_1.2.0_windows_amd64.zip (16.77 MB).
    virtualbox-iso: Download of packer_1.2.0_windows_amd64.zip (16.77 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\packer\1.2.0\packer_1.2.0_windows_amd64.zip to C:\ProgramData\chocolatey\lib\packer\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\packer\tools
    virtualbox-iso:  ShimGen has successfully created a shim for packer.exe
    virtualbox-iso:  The install of packer was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\packer\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: vagrant
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading vagrant 2.0.2... 100%
    virtualbox-iso:
    virtualbox-iso: vagrant v2.0.2 [Approved]
    virtualbox-iso: vagrant package files install completed. Performing other installation steps.
    virtualbox-iso: Downloading vagrant 64 bit
    virtualbox-iso:   from 'https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.msi'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\vagrant\2.0.2\vagrant_2.0.2_x86_64.msi (196.77 MB).
    virtualbox-iso: Download of vagrant_2.0.2_x86_64.msi (196.77 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Installing vagrant...
    virtualbox-iso: vagrant has been installed.
    virtualbox-iso:   vagrant may be able to be automatically uninstalled.
    virtualbox-iso: Environment Vars (like PATH) have changed. Close/reopen your shell to
    virtualbox-iso:  see the changes (or in powershell/cmd.exe just type `refreshenv`).
    virtualbox-iso:  The install of vagrant was successful.
    virtualbox-iso:   Software installed as 'msi', install location is likely default.
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
    virtualbox-iso:
    virtualbox-iso: Packages requiring reboot:
    virtualbox-iso:  - vagrant (exit code 3010)
    virtualbox-iso:
    virtualbox-iso: The recent package changes indicate a reboot is necessary.
    virtualbox-iso:  Please reboot at your earliest convenience.
    virtualbox-iso: Chocolatey v0.10.8
    virtualbox-iso: Installing the following packages:
    virtualbox-iso: terraform
    virtualbox-iso: By installing you accept licenses for the packages.
    virtualbox-iso: Progress: Downloading terraform 0.11.3... 100%
    virtualbox-iso:
    virtualbox-iso: terraform v0.11.3 [Approved]
    virtualbox-iso: terraform package files install completed. Performing other installation steps.
    virtualbox-iso: Removing old terraform plugins
    virtualbox-iso: Downloading terraform 64 bit
    virtualbox-iso:   from 'https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_windows_amd64.zip'
    virtualbox-iso: Progress: 100% - Completed download of C:\Users\vagrant\AppData\Local\Temp\chocolatey\terraform\0.11.3\terraform_0.11.3_windows_amd64.zip (15.73 MB).
    virtualbox-iso: Download of terraform_0.11.3_windows_amd64.zip (15.73 MB) completed.
    virtualbox-iso: Hashes match.
    virtualbox-iso: Extracting C:\Users\vagrant\AppData\Local\Temp\chocolatey\terraform\0.11.3\terraform_0.11.3_windows_amd64.zip to C:\ProgramData\chocolatey\lib\terraform\tools...
    virtualbox-iso: C:\ProgramData\chocolatey\lib\terraform\tools
    virtualbox-iso:  ShimGen has successfully created a shim for terraform.exe
    virtualbox-iso:  The install of terraform was successful.
    virtualbox-iso:   Software installed to 'C:\ProgramData\chocolatey\lib\terraform\tools'
    virtualbox-iso:
    virtualbox-iso: Chocolatey installed 1/1 packages.
    virtualbox-iso:  See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
==> virtualbox-iso: Restarting Machine
==> virtualbox-iso: Waiting for machine to restart...
    virtualbox-iso: Der Computer wird heruntergefahren.(1115)
    virtualbox-iso: WIN10 restarted.
    virtualbox-iso: #< CLIXML
    virtualbox-iso: <Objs Version="1.1.0.1" xmlns="http://schemas.microsoft.com/powershell/2004/04"><Obj S="progress" RefId="0"><TN RefId="0"><T>System.Management.Automation.PSCustomObject</T><T>System.Object</T></TN><MS><I64 N="SourceId">1</I64><PR N="Record"><AV>Module werden für erstmalige Verwendung vorbereitet.</AV><AI>0</AI><Nil /><PI>-1</PI><PC>-1</PC><T>Completed</T><SR>-1</SR><SD> </SD></PR></MS></Obj></Objs>
==> virtualbox-iso: Machine successfully restarted, moving on
==> virtualbox-iso: Provisioning with Powershell...
==> virtualbox-iso: Provisioning with powershell script: final-tweaks.ps1
==> virtualbox-iso: Gracefully halting virtual machine...
    virtualbox-iso: Removing floppy drive...
    virtualbox-iso: Removing guest additions drive...
==> virtualbox-iso: Preparing to export machine...
    virtualbox-iso: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 3761)
==> virtualbox-iso: Exporting virtual machine...
    virtualbox-iso: Executing: export packer-virtualbox-iso-1518879178 --output output-virtualbox-iso/packer-virtualbox-iso-1518879178.ovf
==> virtualbox-iso: Deregistering and deleting VM...
==> virtualbox-iso: Running post-processor: vagrant
==> virtualbox-iso (vagrant): Creating Vagrant box for 'virtualbox' provider
    virtualbox-iso (vagrant): Copying from artifact: output-virtualbox-iso/packer-virtualbox-iso-1518879178-disk001.vmdk
    virtualbox-iso (vagrant): Copying from artifact: output-virtualbox-iso/packer-virtualbox-iso-1518879178.ovf
    virtualbox-iso (vagrant): Renaming the OVF to box.ovf...
    virtualbox-iso (vagrant): Compressing: Vagrantfile
    virtualbox-iso (vagrant): Compressing: box.ovf
    virtualbox-iso (vagrant): Compressing: metadata.json
    virtualbox-iso (vagrant): Compressing: packer-virtualbox-iso-1518879178-disk001.vmdk
Build 'virtualbox-iso' finished.

==> Builds finished. The artifacts of successful builds are:
--> virtualbox-iso: 'virtualbox' provider box: builds/windows10-insider.virtualbox.box
cloudgate%
```
