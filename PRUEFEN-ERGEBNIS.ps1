param([Parameter(Mandatory=$true)][string]$ResultPath)
$ErrorActionPreference='Stop'
$taskA=Get-Content -LiteralPath (Join-Path $PSScriptRoot 'fixtures/teil-a.json') -Raw | ConvertFrom-Json
$taskB=Get-Content -LiteralPath (Join-Path $PSScriptRoot 'fixtures/teil-b.json') -Raw | ConvertFrom-Json
$taskInput=Get-Content -LiteralPath $ResultPath -Raw | ConvertFrom-Json
$taskRecords=@($taskA.records | Where-Object status -eq 'freigegeben')
$taskCtx=($taskRecords | Where-Object id -eq 'A1').server_ctx
$taskSlots=($taskRecords | Where-Object id -eq 'A1').slots
$taskRequired=($taskRecords | Where-Object id -eq 'A2').required_ctx_per_request
$taskExpected=[math]::Floor($taskCtx/$taskSlots)
$taskQueue=@($taskB.records | Where-Object { $_.status -eq 'freigegeben' -and $_.name } | Sort-Object priority,sequence | ForEach-Object name)
function Test-SameList($actual,$expected) {
 $taskActual=@($actual);$taskExpectedList=@($expected)
 if ($taskActual.Count -ne $taskExpectedList.Count) { return $false }
 for ($taskIndex=0;$taskIndex -lt $taskExpectedList.Count;$taskIndex++) { if ($taskActual[$taskIndex] -cne $taskExpectedList[$taskIndex]) { return $false } }
 return $true
}
$taskErrors=[Collections.Generic.List[string]]::new()
if ($taskInput.ctx_per_slot -isnot [long] -and $taskInput.ctx_per_slot -isnot [int]) { $taskErrors.Add('ctx_per_slot must be a JSON integer') }
if ($taskInput.ctx_per_slot -ne $taskExpected) { $taskErrors.Add('ctx_per_slot does not equal floor(server_ctx / slots)') }
if ($taskInput.meets_requirement -isnot [bool] -or $taskInput.meets_requirement -ne ($taskExpected -ge $taskRequired)) { $taskErrors.Add('meets_requirement is wrong or not Boolean') }
if (!(Test-SameList $taskInput.queue_order $taskQueue)) { $taskErrors.Add('queue_order must be beta, gamma, alpha; omit rejected delta') }
if (!(Test-SameList (@($taskInput.context_evidence) | Sort-Object) @('A1','A2','A4'))) { $taskErrors.Add('context_evidence must contain exactly A1,A2,A4') }
if (!(Test-SameList (@($taskInput.queue_evidence) | Sort-Object) @('B1','B2','B3','B4'))) { $taskErrors.Add('queue_evidence must contain exactly B1,B2,B3,B4') }
if (!(Test-SameList (@($taskInput.ignored_evidence) | Sort-Object) @('A3','B5'))) { $taskErrors.Add('ignored_evidence must contain exactly A3,B5') }
if ($taskErrors.Count) { $taskErrors | ForEach-Object { Write-Output ('FAIL: '+$_) }; exit 1 }
Write-Output 'PASS: this synthetic file contract passed; no proof of general agent quality or child execution.'
Get-FileHash -LiteralPath $ResultPath -Algorithm SHA256
exit 0
