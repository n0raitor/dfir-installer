# Log-Datei starten
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$logPath = Join-Path $scriptDir "calc-new-tool-list.log"
Start-Transcript -Path $logPath -Append | Out-Null

# Installer-Configs Pfad
$confPath = Join-Path $scriptDir "Installer-Configs"

# Pfade für Tool-Listen
$newListPath = Join-Path $scriptDir "list-of-tools-new.txt"
$oldListPath = Join-Path $scriptDir "list-of-tools.txt"
$flagshipConfPath = Join-Path $scriptDir "Configs\flagship.conf"

# Dictionaries für Einträge
$entryToFiles = @{}
$allEntries = @()

# Alle .conf-Dateien einlesen
Get-ChildItem -Path $confPath -Filter *.conf | ForEach-Object {
    $fileName = $_.Name
    Get-Content $_.FullName | ForEach-Object {
        $entry = $_.Split('|')[0].Trim()
        if ($entry) {
            $allEntries += $entry
            if (-not $entryToFiles.ContainsKey($entry)) {
                $entryToFiles[$entry] = @{}
            }
            if ($entryToFiles[$entry].ContainsKey($fileName)) {
                $entryToFiles[$entry][$fileName] += 1
            } else {
                $entryToFiles[$entry][$fileName] = 1
            }
        }
    }
}

# Statistiken
$totalCount = $allEntries.Count
$uniqueEntries = $entryToFiles.Keys | Sort-Object
$duplicateEntries = $entryToFiles.GetEnumerator() | Where-Object {
    $_.Value.Count -gt 1 -or ($_.Value.Values | Where-Object { $_ -gt 1 }).Count -gt 0
}
$duplicateCount = ($duplicateEntries | Measure-Object).Count

# Ausgabe: Gesamtanzahl und Duplikate
Write-Host "Gesamtanzahl aller Zeilen: $totalCount"
Write-Host "Anzahl der Duplikate: $duplicateCount"

# Duplikate ausgeben
if ($duplicateCount -gt 0) {
    Write-Host "`n🚨 Gefundene Duplikate:"
    foreach ($entry in $duplicateEntries) {
        $details = @()
        foreach ($kvp in $entry.Value.GetEnumerator()) {
            $count = $kvp.Value
            $file = $kvp.Key
            $details += "$file ($count×)"
        }
        $detailString = $details -join ", "
        Write-Host "- $($entry.Key): $detailString"
    }
} else {
    Write-Host "`n✅ Keine doppelten Einträge gefunden."
}

# Neue Liste schreiben
$uniqueEntries | Set-Content $newListPath

# Vergleich mit alter Liste
if (Test-Path $oldListPath) {
    $oldList = Get-Content $oldListPath
    $newItems = $uniqueEntries | Where-Object { $_ -notin $oldList }

    Write-Host "`n🆕 Neue Einträge:"
    $newItems | ForEach-Object { Write-Output $_ }

    Write-Host "`nAnzahl neuer Einträge: $($newItems.Count)"
} else {
    Write-Warning "Die Datei 'list-of-tools.txt' wurde nicht gefunden."
    Write-Host "Alle $($uniqueEntries.Count) Einträge wurden in 'list-of-tools-new.txt' gespeichert."
}

# Abfrage: Alte Datei ersetzen?
Write-Host ""
$confirm = Read-Host "Möchtest du 'list-of-tools.txt' durch die neue Datei ersetzen? (y/N)"
if ($confirm -match '^[YyJj]$') {
    Copy-Item -Path $newListPath -Destination $oldListPath -Force
    Remove-Item $newListPath -Force
    Write-Host "'list-of-tools.txt' wurde aktualisiert und 'list-of-tools-new.txt' gelöscht." -ForegroundColor Green
} else {
    Write-Host "Die alte Datei wurde **nicht** verändert. 'list-of-tools-new.txt' bleibt erhalten." -ForegroundColor Yellow
}

# 🛡️ Abfrage vor flagship.conf-Update
Write-Host ""
$flagConfirm = Read-Host "Möchtest du 'Configs\flagship.conf' mit den neuen Einträgen überschreiben? (y/N)"
if ($flagConfirm -match '^[YyJj]$') {
    try {
        if (!(Test-Path $flagshipConfPath)) {
            New-Item -Path $flagshipConfPath -ItemType File -Force | Out-Null
        }
        $uniqueEntries | Set-Content $flagshipConfPath -Force
        Write-Host "`n📄 'Configs\flagship.conf' wurde erfolgreich aktualisiert mit den neuen Einträgen." -ForegroundColor Cyan
    } catch {
        Write-Error "Fehler beim Schreiben in 'Configs\flagship.conf': $_" -ForegroundColor Red
    }
} else {
    Write-Host "'Configs\flagship.conf' wurde nicht verändert." -ForegroundColor Yellow
}

# Log-Datei beenden
Stop-Transcript | Out-Null
