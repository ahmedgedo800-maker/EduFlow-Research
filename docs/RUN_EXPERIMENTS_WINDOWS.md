# Running V0–V5 Lighthouse experiments on Windows

Open PowerShell in the project root (the folder containing `scripts`).

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\run_lighthouse_all.ps1 -Runs 5
python .\scripts\summarize_results.py
python .\scripts\generate_results_chart.py
```

The script performs 5 Lighthouse runs for each version and writes raw JSON files to `experiments/lighthouse_runs/`. It then summarizes mean and sample standard deviation. Do not invent or manually edit results.
