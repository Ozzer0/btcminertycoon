if %~1==bettertimeout (goto bettertimeout)
:bettertimeout
chcp 437 >nul
if %~2==-m (
powershell Start-Sleep -m %~3
)
if %~2==-s (
powershell Start-Sleep -s %~3
)