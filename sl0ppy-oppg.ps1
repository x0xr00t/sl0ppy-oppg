# Sloppy-oppg.ps1
#
# Author : P.Hoogeveeen
# AKA    : x0xr00t
# Taam   : sl0ppyroot
#
# this is a menu to gen automated obfuscated ps code 
#
# gen obfuscated payload and copy to clipboard... without output to file 
#Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,clip'
# gen obfuscated payload with output to file
#Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\users\x0\Desktop\output.ps1' 
$user = "$env:UserName"
function Show-Menu {
    param (
        [string]$Title = 'Sl0ppy-oppg'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' For Compression+SecureString+Output."
    Write-Host "2: Press '2' For Dubble-Compression+SecureString+Output."
    Write-Host "3: Press '3' For Tripple-Compression+SecureString+Output."
    Write-Host "4: Press '4' For Compression+BXOR+Output."
    Write-Host "5: Press '5' For Dubble-Compression+BXOR+Output."
    Write-Host "6: Press '6' For Tripple-Compression+BXOR+Output."
    Write-Host "7: Press '7' For Compression+Octal+Output."
    Write-Host "8: Press '8' For Dubble-Compression+Octal+Output."
    Write-Host "9: Press '9' For Tripple-Compression+Octal+Output."   
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
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\users\$user\Desktop\output.ps1'
    } '2' {
    'You chose option #2'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,compress\1,encoding\5,encoding\5,out C:\users\$user\Desktop\output.ps1'
    } '3' {
      'You chose option #3'
	  Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,compress\1,encoding\5,compress\1,encoding\5,out C:\users\$user\Desktop\output.ps1'
    } '4' {
    'You chose option #4'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\6,encoding\6,encoding\6,out C:\users\x0\Desktop\output.ps1'
    } '5' {
    'You chose option #5'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\6,compress\1,encoding\6,encoding\6,out C:\users\x0\Desktop\output.ps1'
    } '6' {
    'You chose option #6'
       Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\6,compress\1,encoding\6,compress\1,encoding\6,out C:\users\x0\Desktop\output.ps1'
    } '7' {
    'You chose option #7'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\3,encoding\3,encoding\3,out C:\users\x0\Desktop\output.ps1'
    } '8' {
    'You chose option #8'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\3,compress\1,encoding\3,encoding\3,out C:\users\x0\Desktop\output.ps1'
    } '9' {
    'You chose option #9'
       Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\3,compress\1,encoding\3,compress\1,encoding\3,out C:\users\x0\Desktop\output.ps1'
    }    
    }
    pause
 }
 until ($selection -eq 'q')
