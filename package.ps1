if (-not (test-path "build\Release_win_x64\ts3pf_win64.dll")) { exit }
if (-not (test-path "build\Release_win_x86\ts3pf_win32.dll")) { exit }

# Check for 7Zip
if (-not (test-path "C:\Program Files\7-Zip\7z.exe")) { throw "C:\Program Files\7-Zip\7z.exe needed" }
set-alias sz "C:\Program Files\7-Zip\7z.exe"

# Create working directory
New-Item -type directory -path ".build\plugins\" -Force | Out-Null

# Load plugin.json
$plugin = Get-Content -Raw -Path "plugin.json" | ConvertFrom-Json

# Copy build files
Copy-Item -path "build\Release_win_x64\ts3pf_win64.dll" -destination ".build\plugins\$($plugin.FileName)_win64.dll"
Copy-Item -path "build\Release_win_x86\ts3pf_win32.dll" -destination ".build\plugins\$($plugin.FileName)_win32.dll"

# Create package.ini
$package = @"
Name = $($plugin.Name)
Type = Plugin
Author = $($plugin.Author)
Version = $($plugin.Version)
Platforms = win32, win64
Description = $($plugin.Description)
"@
New-Item -type file -path ".build\package.ini" -value $package | Out-Null

# Create ts3_plugin file
Set-Location ".build"
sz a -tzip -mx=9 -mm=Deflate "..\build\$($plugin.FileName)_$($plugin.Version)_win.ts3_plugin" "package.ini" "plugins\*" | Out-Null
Set-Location ".."

# Clean up working directory
Remove-Item .build\ -Recurse -Force

Write-Host "Plugin $($plugin.Name) (v$($plugin.Version)) packaged successfully."