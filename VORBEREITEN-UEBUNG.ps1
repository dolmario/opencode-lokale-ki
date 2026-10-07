param([Parameter(Mandatory=$true)][string]$OutputDirectory)
$ErrorActionPreference='Stop'
$taskOut=[IO.Path]::GetFullPath($OutputDirectory)
if (Test-Path -LiteralPath $taskOut) { throw 'Output exists; keep it and choose a new practice directory' }
New-Item -ItemType Directory -Path $taskOut | Out-Null
foreach ($taskName in @('fixtures','AUFTRAG.md','ERGEBNIS-SCHEMA.json','PRUEFEN-ERGEBNIS.ps1','ABNAHME.csv')) {
 Copy-Item -LiteralPath (Join-Path $PSScriptRoot $taskName) -Destination $taskOut -Recurse
}
@{agent_started=$false;model_started=$false;downloads=$false;files_prepared=$true} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $taskOut 'VORBEREITUNG.json') -Encoding utf8
Write-Output ('Prepared only: '+$taskOut)
