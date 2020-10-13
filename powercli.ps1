#!/usr/bin/pwsh -Command

<#

This script will install PowerCLI
for being used in order to monitor Esxi

#>
yum update -y powershell
$VerbosePreference='Continue'
$PSVersionTable.PSVersion
Set-PSRepository -Name "PSGallery" -InstallationPolicy "Trusted"
Find-Module "VMware.PowerCLI" | Install-Module -Scope "CurrentUser" -AllowClobber
Get-Module "VMware.PowerCLI" -ListAvailable | FT -Autosize
Get-Module "VMware.*" -ListAvailable | FT -Autosize
Update-Module "VMware.PowerCLI"


