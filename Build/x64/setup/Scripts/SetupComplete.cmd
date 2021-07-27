@echo off

powercfg -h off

reg IMPORT %WINDIR%\Setup\Scripts\Software.reg

getmac /NH | find "XX-XX"
if %ERRORLEVEL% == 0 (
    cscript slmgr.vbs /ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
    net stop sppsvc
    copy /Y %WINDIR%\Setup\Scripts\spp\tokens.dat C:\Windows\ServiceProfiles\NetWorkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\
    cscript slmgr.vbs /cpky
)

net stop defragsvc
net stop WerSvc
net stop WinDefend
net stop WSearch

sc config AxInstSV start= disabled
sc config Browser start= disabled
sc config defragsvc start= disabled
sc config DPS start= disabled
sc config fdPHost start= disabled
sc config FDResPub start= disabled
sc config HomeGroupProvider start= disabled
sc config IEEtwCollectorService start= disabled
sc config iphlpsvc start= disabled
sc config LanmanServer start= disabled
sc config LanmanWorkstation start= disabled
sc config lmhosts start= disabled
sc config netbios start= disabled
sc config netbt start= disabled
sc config p2pimsvc start= disabled
sc config PNRPAutoReg start= disabled
sc config PNRPsvc start= disabled
sc config RemoteRegistry start= disabled
sc config ShellHWDetection start= disabled
sc config SSDPSRV start= disabled
sc config stisvc start= disabled
sc config TBS start= disabled
sc config upnphost start= disabled
sc config WerSvc start= disabled
sc config WinDefend start= disabled
sc config WinHttpAutoProxySvc start= disabled
sc config WMPNetworkSvc start= disabled
sc config WPDBusEnum start= disabled
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

copy /Y %WINDIR%\Setup\Scripts\DisableAPM.exe C:\Windows\SysWOW64
schtasks /create /TN DisableAPM /XML %WINDIR%\Setup\Scripts\DisableAPM.xml

rd /s /q  %WINDIR%\Setup\Scripts
