# sl0ppy-oppg
sl0ppy-obfuscated-pif-payload-generator

# Cycle
* reads .ps1 to makes obfuscated powershellcode 
* Outputs output obfuscator to .ps1 
* dubble Appends powershell $() 
* reads file .ps1 to gen exe 
* renames exe to pif 

# usage
* gen powershell payload and 
* add "| powershell $()" to the powershell payload
* copy string convert to b64  
* add| replace b64 payload in b.ps1 >>> (if needed add "|powershell $()" to the b.ps1 (if good not needed but check it!!))
