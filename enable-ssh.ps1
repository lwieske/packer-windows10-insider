#!/usr/bin/env pwsh

############
# Enable SSH
############

# Requires -RunAsAdministrator

$VAGRANT_HOME = "C:\Users\vagrant"
$OPENSSH_HOME = "C:\Program Files\OpenSSH-Win64"
$OPENSSH_ZIP  = "C:\Windows\Temp\OpenSSH-Win64.zip"
$SSHD_CONFIG  = "C:\ProgramData\ssh\ssh_config"

$ssh_download_url = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v7.9.0.0p1-Beta/OpenSSH-Win64.zip"

Invoke-WebRequest $ssh_download_url -OutFile $OPENSSH_ZIP -UseBasicParsing

Expand-Archive $OPENSSH_ZIP $OPENSSH_HOME\..
Remove-Item -Force $OPENSSH_ZIP

Push-Location $OPENSSH_HOME

    Write-Host "Installing OpenSSH"
    & .\install-sshd.ps1 -A

Pop-Location

$newPath = $OPENSSH_HOME + ';' + [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("PATH", $newPath, [EnvironmentVariableTarget]::Machine)

Write-Host "Adding vagrant public key to authorized_keys"
New-Item -ItemType Directory -Force -Path $VAGRANT_HOME\.ssh
C:\Windows\System32\icacls.exe $VAGRANT_HOME /grant "vagrant:(OI)(CI)F"
Copy-Item -Path A:\vagrant.pub -Destination $VAGRANT_HOME\.ssh\authorized_keys

Write-Host "Opening firewall port 22"
New-NetFirewallRule -DisplayName 'OpenSSH SSH Server' -Protocol TCP -LocalPort 22 -Direction Inbound -Action Allow  -Name sshd

Write-Host "Setting sshd service startup type to 'Automatic'"
Set-Service sshd -StartupType Automatic
Start-Service sshd

#Write-Host "Setting sshd service restart behavior"
#sc.exe failure sshd reset= 86400 actions= restart/500
