# Optimizing Web Application Performance Using Modern Web Development Techniques: An Experimental Study

## Abstract
Modern web applications increasingly rely on client-side JavaScript, media, and dynamic interfaces. These features can improve functionality while increasing browser workload. This study presents an experimental evaluation of selected web performance optimization techniques using EduFlow, a React-based e-learning prototype. An intentionally unoptimized baseline is compared with successive versions incorporating image optimization, lazy loading, code splitting, caching/compression, and a combined strategy. Performance is evaluated using Lighthouse metrics including Performance, FCP, LCP, TBT, CLS, Speed Index, transfer size, and request count. Final quantitative findings will be populated from recorded experiments.

## 1. Introduction
Web performance is an important aspect of modern application quality because users must download, parse, execute, and render resources before interacting with a page. As applications become richer, developers must balance functionality and visual quality with efficient resource delivery. This research implements selected optimization techniques in a controlled React application and measures changes between successive versions.

## 2. Problem Statement
A web application may experience unnecessary performance overhead when it loads large images, downloads JavaScript that is not immediately required, and serves resources without appropriate delivery strategies. The research problem is to determine how much selected techniques improve measurable performance indicators in a realistic React application.

## 3. Research Questions
1. What is the effect of image optimization?
2. What is the effect of lazy loading?
3. What is the effect of code splitting?
4. Does combining the techniques provide greater improvement?

## 4. Methodology
EduFlow is an e-learning interface containing a home page, course catalog, course details, dashboard, profile, search, filtering, images, and client-side routing. V0 is the intentionally unoptimized baseline. V1 introduces image optimization. V2 adds lazy loading. V3 introduces route-level code splitting. V4 evaluates caching/compression at the delivery layer. V5 combines the selected techniques.

Each version is tested under consistent conditions using Chrome Lighthouse. Multiple runs should be performed and median values reported. Metrics include Performance score, FCP, LCP, TBT, CLS, Speed Index, transfer size, and request count.

## 5. Results
Populate this section only after the Lighthouse experiments are completed. No numbers should be fabricated.

## 6. Discussion
Interpret the measured changes, explain technical causes, and compare findings with relevant literature.

## 7. Conclusion
Summarize measured impact, strongest techniques, limitations, and future work.

## 8. References
Add primary technical documentation and peer-reviewed academic sources during the literature-review stage.
