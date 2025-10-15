# Recorre todos los subdirectorios en la carpeta actual
Get-ChildItem -Directory | ForEach-Object {
    $repoPath = $_.FullName
    if (Test-Path "$repoPath\.git") {
        Write-Host "Procesando $repoPath ..."
        Set-Location $repoPath

        # Obtener la URL actual
        $url = git remote get-url origin

        # Solo actualizar si es del tipo git@github.com
        if ($url -match "^git@github.com:") {
            $newUrl = $url -replace "^git@github.com:", "ssh://git@ssh.github.com:443/"
            git remote set-url origin $newUrl
            Write-Host "Actualizado: $url -> $newUrl"
        } else {
            Write-Host "Saltado (no es github.com o ya está en 443): $url"
        }
    }
}

# Regresar al directorio original
Set-Location ..
