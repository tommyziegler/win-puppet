#########################
# Autoinstall script using chocolatey
#########################
# Note: Net 4.0 must be installed prior to running this script
#

$items = @("git.install")
# $items = @("GoogleChrome", "thunderbird", "skype", "vlc", "quicktime", "flashplayerplugin", "javaruntime", "DotNet4.5", "utorrent", "dropbox", "Teracopy", "7zip.install", "python", "eclipse-java-juno", "notepadplusplus.install", "git.install" )
 
#################
# Create packages.config based on passed arguments
#################
$xml = '<?xml version="1.0" encoding="utf-8"?>'+ "`n" +'<packages>' + "`n"
foreach ($item in $items)
{
  $xml += "`t" +'<package id="' + $item + '"/>' + "`n"
}
$xml += '</packages>'
 
$file = ([system.environment]::getenvironmentvariable("userprofile") + "\packages.config")
$xml | out-File $file
 
####
# Install chocolatey
####
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
 
 
######
# Install packages with cinst
######
 
cinst $file
 
 
########
# Delete packages.config
Remove-Item $file
