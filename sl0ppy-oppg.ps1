# Sloppy-oppg.ps1
#
# Author : P.Hoogeveeen
# AKA    : x0xr00t
# Taam   : sl0ppyroot
#
# this is a menu to gen automated obfuscated ps code 
#
# place files under C:\
# add exlusion path C:\sl0ppy-oppg
#
# gen obfuscated payload and copy to clipboard... without output to file 
#Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,clip'
# gen obfuscated payload with output to file
#Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\users\x0\Desktop\output.ps1' 
mkdir C:\sl0ppy-payload
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
    Write-Host "10: Press '10' For Compression+Whitespace+Output."
    Write-Host "11: Press '11' For Dubble-Compression+Whitespace+Output."
    Write-Host "12: Press '12' For Tripple-Compression+Whitespace+Output."
    Write-Host "Q: Press 'Q' To Quit."
}

do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
    'You chose option Compression+SecureString+Output '
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '2' {
    'You chose option Dubble-Compression+SecureString+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\5,compress\1,encoding\5,encoding\5,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '3' {
    'You chose option Tripple-Compression+SecureString+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\5,compress\1,encoding\5,compress\1,encoding\5,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '4' {
    'You chose option Compression+BXOR+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\6,encoding\6,encoding\6,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '5' {
    'You chose option Dubble-Compression+BXOR+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\6,compress\1,encoding\6,encoding\6,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '6' {
    'You chose option Tripple-Compression+BXOR+Output'
    Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\6,compress\1,encoding\6,compress\1,encoding\6,out C:\sl0ppy-payload\output.ps1'
    Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
    Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'    
    } '7' {
    'You chose option Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\3,encoding\3,encoding\3,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '8' {
    'You chose option Dubble-Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\3,compress\1,encoding\3,encoding\3,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '9' {
    'You chose option Tripple-Compression+Octal+Output'
    Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\3,compress\1,encoding\3,compress\1,encoding\3,out C:\sl0ppy-payload\output.ps1'
    Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
    Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'    
    } '10' {
    'You chose option Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\8,encoding\8,encoding\8,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '11' {
    'You chose option Dubble-Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\8,compress\1,encoding\8,encoding\8,out C:\sl0ppy-payload\output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'	
    } '12' {
    'You chose option Tripple-Compression+Octal+Output'
    Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg\1.ps1} -command 'compress\1,encoding\8,compress\1,encoding\8,compress\1,encoding\8,out C:\sl0ppy-payload\output.ps1'
    Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 "| powershell "  
    Add-Content -NoNewline -path C:\sl0ppy-payload\output.ps1 '$()'    
    } 
    }
    pause
 }
 until ($selection -eq 'q')

