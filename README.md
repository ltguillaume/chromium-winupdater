<img src="Chromium-WinUpdater.ico" align="right">

# Chromium WinUpdater
By ltGuillaume: [Codeberg](https://codeberg.org/ltGuillaume) | [GitHub](https://github.com/ltGuillaume) | [Buy me a beer](https://buymeacoff.ee/ltGuillaume) 🍺

An attempt to make updating Chromium for Windows much easier. This is a fork of [LibreWolf WinUpdater](https://codeberg.org/ltGuillaume/librewolf-winupdater).

![Chromium WinUpdater](SCREENSHOT.png)

## Usage
- Chromium WinUpdater currently defaults to [Ungoogled Chromium](https://github.com/macchrome/winchrome/releases) releases by [Marmaduke](https://github.com/macchrome). For support for other Chromium releases, please create an issue with your request.  
- If you want to run the portable version of Chromium, download and extract the latest [`ungoogled-chromium-xxx.x.xxxx.xxx_Win64.7z`](https://github.com/macchrome/winchrome/releases/latest). Put `Chromium-WinUpdater.exe` in the same folder.  
  Then, if you wish to perform an update, just run `Chromium-WinUpdater.exe`.
- When you have installed Chromium using the [xxx.x.xxxx.xxx_ungoogled_mini_installer.exe](https://github.com/macchrome/winchrome/releases/latest), just run `Chromium-WinUpdater.exe` from any location. If an update is available, the new mini installer will be downloaded and installed.

## Scheduled Updates
- Run Chromium WinUpdater and select the option to automatically check for updates. This will prompt for administrative permissions and a blue (PowerShell) window will open and notify you of the result. The scheduled task will run while the current user account is logged on (at start-up and every 24 hours).
- If your account has administrator privileges, the update will be fully automatic. If not, the update will be downloaded and you will be asked by WinUpdater to start the update.  
- If Chromium is already running, the updater will notify you of the new version. The update will start as soon as you close the browser.

## Remarks
- The updater needs to be able to write to `Chromium-WinUpdater.ini` in its own folder (so make sure it has permission to do so), otherwise WinUpdater will copy itself to `%LocalAppData%\Chromium\WinUpdater` and run from there.
- `Chromium-WinUpdater.ini` contains a `[Log]` section that shows the results of the last update check and update action.
- Chromium WinUpdater also updates itself automatically, so you won't have to check for new releases here. If you prefer to update WinUpdater yourself, add the following to the .ini file:
  ```ini
  [Settings]
  UpdateSelf=0
  ```
- WinUpdater by default downloads the 64-bit release of [Ungoogled Chromium by Marmaduke](https://github.com/macchrome/winchrome/releases).  
  Alternatively, you can use the (official?) [release by teeminus et al](https://github.com/ungoogled-software/ungoogled-chromium/releases).  
  To do this, copy/rename `Chromium-WinUpdater.template.ini` to `Chromium-WinUpdater.ini`, then uncomment the 3 lines of the desired alternative release (by removing the `;`).
- __NOTE:__ WinUpdater has not been tested with other Chromium releases, but you can try changing the three variables and see if it works, or ask for help by creating an issue.

## Building
- Requires [7-Zip](https://7-zip.org/download.html) standalone console version (`7za.exe` from the __7-Zip Extra__ download)
- Requires [AutoHotKey 1.1](https://www.autohotkey.com/) \
  See [BUILDING.md](BUILDING.md)

## Credits
* [The Chromium Project](https://www.chromium.org)
* [Chromium icon](https://github.com/Alex313031/chromium/blob/main/logos/NEW/win/thorium.ico) by Alex Frick
* [Chromium logo](https://github.com/Alex313031/chromium/blob/main/logos/STAGING/Thorium90_252.jpg) by Alex Frick
