$ProgressPreference = "SilentlyContinue"

choco install sdelete ultradefrag --confirm --limit-output

Stop-Service wuauserv
Set-Service wuauserv -Startup disabled

udefrag --optimize --repeat C:

Set-ItemProperty 'HKCU:\Software\Sysinternals\SDelete' -name EulaAccepted -value 1

sdelete -q -z C:
