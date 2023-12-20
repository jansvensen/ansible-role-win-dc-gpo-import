start-sleep -seconds 10 # For an unknown reason, Importing without a little timeout after unzipping fails with "access denied"

$BackupPath = "c:\gpo\GPO"

Get-Childitem $BackupPath | ForEach-Object{

    $BackupGUID = (Get-ChildItem $_.FullName).Name.split(" ")[0].Replace("{","").Replace("}","")

    Import-GPO -BackupId $BackupGUID -Path $_.FullName -TargetName $_.Name -CreateIfNeeded

}