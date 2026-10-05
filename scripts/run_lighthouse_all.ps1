param([int]$Runs=5)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$app = Join-Path $root "eduflow-app"
$out = Join-Path $root "experiments\lighthouse_runs"

New-Item -ItemType Directory -Force $out | Out-Null

$versions = @(
    @{Name="V0_Baseline"; Path="versions\V0_Baseline"},
    @{Name="V1_Image_Optimization"; Path="versions\V1_Image_Optimization"},
    @{Name="V2_Lazy_Loading"; Path="versions\V2_Lazy_Loading"},
    @{Name="V3_Code_Splitting"; Path="versions\V3_Code_Splitting"},
    @{Name="V4_Delivery_Optimization"; Path="versions\V4_Delivery_Optimization"},
    @{Name="V5_Combined"; Path="versions\V5_Combined"}
)

$backup = Join-Path $env:TEMP "EduFlow_App_Backup"

if (Test-Path $backup) {
    Remove-Item $backup -Recurse -Force
}

Copy-Item $app $backup -Recurse -Force

try {

    foreach ($v in $versions) {

        Write-Host ""
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host "=== $($v.Name) ===" -ForegroundColor Cyan
        Write-Host "========================================" -ForegroundColor Cyan

        $versionPath = Join-Path $root $v.Path

        # Restore the complete original src folder.
        # This preserves main.jsx and all required files.
        Remove-Item (Join-Path $app "src") -Recurse -Force -ErrorAction SilentlyContinue

        Copy-Item `
            (Join-Path $backup "src") `
            (Join-Path $app "src") `
            -Recurse `
            -Force

        # Overlay the research version.
        # App.jsx from the version replaces the baseline App.jsx.
        Copy-Item `
            (Join-Path $versionPath "*") `
            (Join-Path $app "src") `
            -Recurse `
            -Force

        Push-Location $app

        Write-Host "Building $($v.Name)..." -ForegroundColor Yellow

        npm run build

        if ($LASTEXITCODE -ne 0) {
            throw "Build failed for $($v.Name). Lighthouse will not run."
        }

        Write-Host "Build successful." -ForegroundColor Green

        # Start production preview server
        $proc = Start-Process `
            -FilePath "cmd.exe" `
            -ArgumentList "/c npm run preview -- --host 127.0.0.1 --port 4173" `
            -PassThru `
            -WindowStyle Hidden

        Start-Sleep -Seconds 6

        try {

            for ($r = 1; $r -le $Runs; $r++) {

                Write-Host "Lighthouse run $r / $Runs" -ForegroundColor Yellow

                $path = Join-Path $out ("{0}_run{1}.json" -f $v.Name, $r)

                npx --yes lighthouse `
                    http://127.0.0.1:4173/ `
                    --only-categories=performance `
                    --output=json `
                    --output-path="$path" `
                    --chrome-flags="--headless --no-sandbox" `
                    --quiet `
                    --no-enable-error-reporting

                if ($LASTEXITCODE -ne 0) {
                    throw "Lighthouse failed for $($v.Name), run $r."
                }
            }

        }
        finally {

            if ($proc -and !$proc.HasExited) {
                Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
            }
        }

        Pop-Location
    }

}
finally {

    Write-Host ""
    Write-Host "Restoring original application..." -ForegroundColor Yellow

    Remove-Item (Join-Path $app "src") -Recurse -Force -ErrorAction SilentlyContinue

    Copy-Item `
        (Join-Path $backup "src") `
        (Join-Path $app "src") `
        -Recurse `
        -Force

    if (Test-Path (Join-Path $backup "index.html")) {
        Copy-Item `
            (Join-Path $backup "index.html") `
            $app `
            -Force
    }

    Remove-Item $backup -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "DONE" -ForegroundColor Green
Write-Host "Raw Lighthouse files:" -ForegroundColor Green
Write-Host $out -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green