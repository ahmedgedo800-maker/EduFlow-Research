import csv
from pathlib import Path
import matplotlib.pyplot as plt
root=Path(__file__).resolve().parents[1]; f=root/'experiments'/'lighthouse_summary.csv'; out=root/'experiments'/'V0_V5_performance.png'
rows=list(csv.DictReader(f.open(encoding='utf-8'))); labels=[r['Version'] for r in rows]; vals=[float(r['Performance Score Mean']) for r in rows]
plt.figure(figsize=(9,5)); plt.plot(labels,vals,marker='o'); plt.xlabel('Version'); plt.ylabel('Mean Lighthouse Performance Score'); plt.title('EduFlow Performance: V0–V5'); plt.grid(True,alpha=.25); plt.tight_layout(); plt.savefig(out,dpi=180); print(out)
