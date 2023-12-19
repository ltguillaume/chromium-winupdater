Write-Output "Creating scheduled task for Chromium WinUpdater..."
$Title = "Chromium WinUpdater"
$Host.UI.RawUI.WindowTitle = $Title
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  Write-Output "Requesting administrator privileges"
  $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
  $UserName = [Environment]::UserName
  $Script = $MyInvocation.MyCommand.Path
  Start-Process powershell.exe -Verb RunAs "-ExecutionPolicy RemoteSigned -File `"$PSCommandPath`" `"${User}`" `"${UserName}`""
  Exit
}

$Action   = New-ScheduledTaskAction -Execute "Chromium-WinUpdater.exe" -Argument "/Scheduled" -WorkingDirectory "$PSScriptRoot"
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -RunOnlyIfNetworkAvailable
$24Hours  = New-ScheduledTaskTrigger -Once -At (Get-Date -Minute 0 -Second 0).AddHours(1) -RepetitionInterval (New-TimeSpan -Hours 24)
$AtLogon  = New-ScheduledTaskTrigger -AtLogOn
$AtLogon.Delay = 'PT1M'
$User     = If ($Args[0]) {$Args[0]} Else {[System.Security.Principal.WindowsIdentity]::GetCurrent().Name}
$UserName = If ($Args[1]) {$Args[1]} Else {[Environment]::UserName}

Register-ScheduledTask -TaskName "$Title ($UserName)" -Action $Action -Settings $Settings -Trigger $24Hours,$AtLogon -User $User -RunLevel Highest -Force
Write-Output "Done. Press any key to close this window."
[Console]::ReadKey()