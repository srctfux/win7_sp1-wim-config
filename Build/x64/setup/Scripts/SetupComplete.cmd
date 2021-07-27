@echo off

powercfg -h off

reg IMPORT %WINDIR%\Setup\Scripts\Software.reg

cscript %WINDIR%\Setup\Scripts\KB2545227.vbs
start /wait %WINDIR%\Setup\Scripts\windows6.1-kb4536952-x64_87f81056110003107fa0e0ec35a3b600ef300a14.msu /quiet /norestart

net stop defragsvc
net stop WerSvc
net stop WinDefend
net stop WSearch

sc config defragsvc start= disabled
sc config WerSvc start= disabled
sc config WinDefend start= disabled
sc config WSearch start= disabled
sc config wuauserv start= demand

schtasks /change /TN "\Microsoft\Windows\Application Experience\AitAgent" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /DISABLE
schtasks /change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Location\Notifications" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Maintenance\WinSAT" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Media Center\mcupdate" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Media Center\PeriodicScanRetry" /DISABLE
schtasks /change /TN "\Microsoft\Windows\MemoryDiagnostic\CorruptionDetector" /DISABLE
schtasks /change /TN "\Microsoft\Windows\MemoryDiagnostic\DecompressionFailureDetector" /DISABLE
schtasks /change /TN "\Microsoft\Windows\MobilePC\HotStart" /DISABLE
schtasks /change /TN "\Microsoft\Windows\MUI\LPRemove" /DISABLE
schtasks /change /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /DISABLE
schtasks /change /TN "\Microsoft\Windows\RAC\RacTask" /DISABLE
schtasks /change /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Setup\EOSNotify" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Setup\EOSNotify2" /DISABLE
schtasks /change /TN "\Microsoft\Windows\SystemRestore\SR" /DISABLE
schtasks /change /TN "\Microsoft\Windows\WindowsBackup\ConfigNotification" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /DISABLE
schtasks /change /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" /DISABLE
schtasks /change /TN "\Microsoft\Windows Defender\MP Scheduled Scan" /DISABLE
schtasks /change /TN "\Microsoft\Windows Defender\MpIdleTask" /DISABLE

rd /s /q  %WINDIR%\Setup\Scripts
