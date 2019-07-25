# Load plugin.json
$plugin = Get-Content -Raw -Path "plugin.json" | ConvertFrom-Json
$version = [version] $plugin.Version
$newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, $version.Build, ($version.Revision + 1)
$plugin.Version = $newVersion
$plugin | ConvertTo-Json | Set-Content "plugin.json"

# Create package.ini
$plugininfo = @"
#ifndef PLUGININFO_H
#define PLUGININFO_H

#define PLUGININFO_NAME "$($plugin.Name)"
#define PLUGININFO_AUTHOR "$($plugin.Author)"
#define PLUGININFO_DESCRIPTION "$($plugin.Description)"
#define PLUGININFO_VERSION "$($plugin.Version)"

#endif // !PLUGININFO_H
"@
New-Item -type file -force -path "src\framework\plugininfo.h" -value $plugininfo | Out-Null