<#
    Parts of this module use the 7-Zip program.
    7-Zip is licensed under the GNU LGPL license.
    www.7-zip.org
#>

# Set PSScriptRoot (if run from ISE)
If (!($PSScriptRoot)) {
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

# Set OSArchitecture
$OSArchitecture = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty OSArchitecture

# Test if 7zaBinary variable is set
If (!(Test-Path Variable:7zaBinary )) {
    $7zaBinary = "$PSScriptRoot\Bin\$OSArchitecture\7za.exe"
}

# Test if 7zaBinary is accessible
If (!(Test-Path $7zaBinary)) {
    Write-Error "7za.exe binary file could not be found"
}

# Dot source the modules functions
. "$PSScriptRoot\Compress-7Zip.ps1"
. "$PSScriptRoot\Expand-7Zip.ps1"
. "$PSScriptRoot\Get-7Zip.ps1"