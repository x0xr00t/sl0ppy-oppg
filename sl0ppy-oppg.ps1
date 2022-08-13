# gen obfuscated payload and copy to clipboard... without output to file 
Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,clip'
# gen obfuscated payload with output to file
Import-Module .\Invoke-Obfuscation.psd1; Invoke-Obfuscation -scriptpath {C:\users\x0\Desktop\sl0ppy-winvasion\1.ps1} -command 'compress\1,encoding\5,encoding\5,encoding\5,out C:\users\x0\Desktop\output.ps1' 
