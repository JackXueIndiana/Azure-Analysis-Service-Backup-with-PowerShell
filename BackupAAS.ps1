$username = "Username with access to AAS"
$password = "password for AAS"
$AnalysisServiceDatabase = "Modelname"
$AnalysisServiceServer = "servername"

$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force

$cred = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)

Login-AzureRmAccount

Write-Output "Starting Backup..." 

Backup-ASDatabase `
    –backupfile ("backup." + (Get-Date).ToString("yyMMdd") + ".abf") `
    –name $AnalysisServiceDatabase `
    -server $AnalysisServiceServer `
    -Credential $cred
