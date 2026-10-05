# EduFlow — Web Performance Research Project

**Research title:** Optimizing Web Application Performance Using Modern Web Development Techniques: An Experimental Study

EduFlow is a React/Vite e-learning web application created as a controlled research prototype. The same application is evaluated before and after performance optimizations such as image optimization, lazy loading, code splitting, caching and compression.

## Run the application

```bash
cd eduflow-app
npm install
npm run dev
```

Then open the localhost URL shown by Vite.

## Research files
- `research/PAPER_DRAFT.md` — paper draft
- `research/RESEARCH_PLAN.md` — research design
- `research/FINAL_SUBMISSION_STATUS.md` — evidence and submission status
- `experiments/V0_actual_results.csv` — measured baseline result
- `experiments/results-template.csv` — template for additional runs
- `evidence/` — Lighthouse evidence
- `versions/` — source snapshots for experimental versions
- `docs/` — experiment and project documentation

## Important
The V0 Lighthouse values are real measurements from the running application. Additional experimental values should be recorded only after measuring the corresponding version; they should not be fabricated.
