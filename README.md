# Teamspeak 3 Clipboard Plugin

## Developers

### Manual

- `version.bat` increases version in `plugin.json` and generates `plugininfo.h`
- `package.bat` created `.ts3_plugin` file in `./build/`

### Automatic

|         |    win32    |           x64           |
|:-------:|:-----------:|:-----------------------:|
|  Debug  |             |       version.ps1       |
| Release | package.ps1 | version.ps1 package.ps1 |