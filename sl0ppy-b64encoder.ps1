# Base64 algorithm borrowed from https://en.wikibooks.org/wiki/Algorithm_Implementation/Miscellaneous/Base64

function ConvertTo-Base64String ($string)
{
    $base64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    $result = [System.Text.StringBuilder]::new()
    $pad = ""
    $count = $string.Length % 3;

    # string needs to be multiple of 3 characters
    if ($count -gt 0)
    {
        while ($count -lt 3)
        {
            $pad += '='
            $string += [char]0
            $count ++
        }
    }

    # increment over the string 3 characters at a time
    for ($count = 0; $count -lt $string.Length; $count += 3)
    {
        # add newline after every 76 output characters, per MIME spec
        if ($count -gt 0 -and ($count / 3 * 4) % 76 -eq 0)
        {
            $null = $result.Append("`n")
        }

        # 3 8-bit ascii characters become one 24-bit number
        [int]$num24 = ([int]($string[$count]) -shl 16) + ([int]($string[$count + 1]) -shl 8) + ([int]($string[$count + 2]))

        # separate 24-bit number into four 6-bit numbers
        $num6 = ([int]($num24 -shr 18) -band 63), ([int]($num24 -shr 12) -band 63), ([int]($num24 -shr 6) -band 63), ([int]$num24 -band 63)

        # the four 6-bit numbers are indices into the base64 character list
        $null = $result.Append($base64chars[$num6[0]])
        $null = $result.Append($base64chars[$num6[1]])
        $null = $result.Append($base64chars[$num6[2]])
        $null = $result.Append($base64chars[$num6[3]])
    }

    # add the actual padding string, after removing the zero pad
    $null = $result.Remove($result.Length - $pad.Length, $pad.Length)
    $null = $result.Append($pad)
    $result.ToString()
}

function ConvertFrom-Base64String ($base64)
{
    $base64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    # remove any characters not in the base64 characters list or the pad character
    $base64 = $base64 -replace "[^$base64chars=]", ""

    # replace any padding with a zero pad (the 'A' character is zero)
    $pad = ""
    if ($base64[$base64.Length - 1] -eq '=')
    {
        if ($base64[$base64.Length - 2] -eq '=')
        {
            $pad = "AA"
        }
        else
        {
            $pad = "A"
        }
    }
    $base64 = $base64.Substring(0, $base64.Length - $pad.Length) + $pad

    $result = [System.Text.StringBuilder]::new()

    # process the string four characters as a time
    for ($count = 0; $count -lt $base64.Length; $count += 4)
    {
        # each of the four characters is a 6-bit index in the base64 character list
        # together representing a 24-bit number of the original 3 characters
        [int]$num = ($base64chars.IndexOf($base64[$count]) -shl 18) +
            ($base64chars.IndexOf($base64[$count + 1]) -shl 12) +
            ($base64chars.IndexOf($base64[$count + 2]) -shl 6) +
            ($base64chars.IndexOf($base64[$count + 3]))

        # split the 24-bit number back to 3 bytes
        $null = $result.Append([char](($num -shr 16) -band 255))
        $null = $result.Append([char](($num -shr 8) -band 255))
        $null = $result.Append([char]($num -band 255))
    }

    # remove any zero pad that was added to make this a multiple of 24 bits
    $null = $result.Remove($result.Length - $pad.Length, $pad.Length)
    $result.ToString()
}

#region test

$text = (Get-Content $MyInvocation.MyCommand.Path -Raw) * 1000
$base64 = ConvertTo-Base64String $text
$result = ConvertFrom-Base64String $base64
if ($result -ne $text)
{
    throw "Round trip base64 failed!"
}

#endregion
