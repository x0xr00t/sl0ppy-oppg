# sl0ppy-oppg
sl0ppy-Obfuscated-Pif-Payload-Generator, is a fully automated pif payload generator.

# Obfuscator-edit
* added a edited version of obfuscator to the repo. 
* this source is edited to gen larger payloads then the default source.

# ps2exe added
* All files from this sources are included, exe, ps1, psd1, psm1.
* these files are used to gen the exe from the 1.ps1 file 

# Process
* reads .ps1 to make obfuscated powershellcode 
* Outputs output obfuscator to .ps1 
* dubble Appends powershell $() 
* reads file .ps1 to gen exe 
* renames exe to pif 

# NEEDED >> Add exclusions for defender
* `C:\sl0ppy-oppg`
* `C:\sl0ppy-payload`

#Key Enhancements Explained:
  *  `Randomization: Every time a payload is generated, it is saved with a random filename and obfuscated differently, making each one unique.`
  *  `AES Encryption: One of the options applies AES encryption to the payload, making it much harder to detect or reverse-engineer.`
  *  `Anti-VM Check: The script checks if the environment is a virtual machine (VMware, VirtualBox) and stops execution if so, helping evade sandbox analysis.`
  *  `BXOR Encoding: Custom XOR encoding is applied to obfuscate the payload further.`
  *  `Staged Execution: Option 8 introduces a polyglot approach with VBScript stagers that run PowerShell payloads.`
  *  `Sandbox Evasion: Certain options introduce delays and randomness to make it harder for sandbox environments to catch the payload behavior.`

# Usage
* replace powershell payload in 1.ps1
* run `./sl0ppy-oppg`

# Generated payloads u can find under.. 
* `C:\sl0ppy-payload`


# Legal Disclaimer: 
* I am not responsible for U using it on non authorized systems, make sure u use it on systems u own or are authorized on. 

* x0xr00t 
