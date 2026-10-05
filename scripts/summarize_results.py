import json,csv,statistics
from pathlib import Path
root=Path(__file__).resolve().parents[1]; folder=root/'experiments'/'lighthouse_runs'; out=root/'experiments'/'lighthouse_summary.csv'
rows=[]
for f in sorted(folder.glob('*.json')):
    d=json.loads(f.read_text(encoding='utf-8')); a=d['audits']; name=f.stem.rsplit('_run',1)[0]
    vals={'Performance Score':d['categories']['performance']['score']*100,'FCP (s)':a['first-contentful-paint']['numericValue']/1000,'LCP (s)':a['largest-contentful-paint']['numericValue']/1000,'TBT (ms)':a['total-blocking-time']['numericValue'],'CLS':a['cumulative-layout-shift']['numericValue'],'Speed Index (s)':a['speed-index']['numericValue']/1000}
    rows.append((name,f.name,vals))
metrics=list(rows[0][2]) if rows else []
with out.open('w',newline='',encoding='utf-8') as fh:
    w=csv.writer(fh); w.writerow(['Version','Runs']+[x for m in metrics for x in (m+' Mean',m+' SD')])
    for v in sorted(set(x[0] for x in rows)):
        rs=[x[2] for x in rows if x[0]==v]; row=[v,len(rs)]
        for m in metrics:
            xs=[r[m] for r in rs]; row += [statistics.mean(xs), statistics.stdev(xs) if len(xs)>1 else 0.0]
        w.writerow(row)
print(out)
