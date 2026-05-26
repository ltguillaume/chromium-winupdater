:https://www.reddit.com/r/brave/comments/yehxbp/one_possible_fix_for_missing_brave_taskbar/
@echo off
ie4uinit.exe -show​
taskkill /im explorer.exe /f​
del /a /f /q "%LocalAppData%\IconCache.db"​
del /a /f /q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache*"​
pause