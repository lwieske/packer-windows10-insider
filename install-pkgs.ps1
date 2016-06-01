#########################
# Install Choco + Goodies
#########################

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

$progs = @()

$progs += "atom"
$progs += "git-credential-manager-for-windows"

$progs += "golang"
$progs += "nodejs.install"
$progs += "jdk8"
$progs += "ant"
$progs += "maven"
$progs += "python"
#$progs += "pip"
$progs += "ruby"
$progs += "ruby.devkit"

$progs += "firefox"
$progs += "googlechrome"

$progs += "7zip.install"
$progs += "jq"
$progs += "fiddler4"

foreach ( $prog in $progs ) {
	    choco install $prog --confirm --limit-output
}

#npm install -g npm-windows-upgrade
