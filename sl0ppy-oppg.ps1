# gen obfuscated payload and copy to clipboard... without output to file 
#Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,clip'
# gen obfuscated payload with output to file
#Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\users\x0\Desktop\output.ps1' 

function Show-Menu {
    param (
        [string]$Title = 'Sl0ppy-oppg'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' For compression+SecureString+Output."
    Write-Host "2: Press '2' For Dubble-Compression+SecureString+Output."
    Write-Host "3: Press '3' For Tripple-Compression+SecureString+Output."
    Write-Host "Q: Press 'Q' To Quit."
}

do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
    'You chose option #1'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\users\x0\Desktop\output.ps1'
    } '2' {
    'You chose option #2'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,compress\1,encoding\5,encoding\5,out C:\users\x0\Desktop\output.ps1'
    } '3' {
      'You chose option #3'
	  Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,compress\1,encoding\5,compress\1,encoding\5,out C:\users\x0\Desktop\output.ps1'
    }
    }
    pause
 }
 until ($selection -eq 'q')
