Connect-MsolService

$ScriptName = $MyInvocation.MyCommand.Name
$CSVOutputName = $ScriptName.Substring(0, $ScriptName.Length - 4)
$TimeStamp = Get-Date -Format "yyyyMMddTHHmmssffff"
$CSVOutputPath = "$PSScriptRoot\$CSVOutputName-$TimeStamp.csv"

$CSVOutput = Get-MsolDevice -All -ReturnRegisteredOwners

$CSVOutput `
    | Sort Enabled, DeviceOsType, DeviceOsVersion, DisplayName, DeviceTrustType, DeviceTrustLevel `
    | Export-Csv -Path $CSVOutputPath -NoTypeInformation

Invoke-Item $CSVOutputPath
