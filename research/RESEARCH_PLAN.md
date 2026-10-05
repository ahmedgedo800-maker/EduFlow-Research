# Research Plan
## Title
Optimizing Web Application Performance Using Modern Web Development Techniques: An Experimental Study

## Arabic
تحسين أداء تطبيقات الويب باستخدام تقنيات تطوير الويب الحديثة: دراسة تجريبية

## Problem
Modern web applications can become slower as they include more images, JavaScript, routes, and client-side features. This study measures the effect of selected optimization techniques on a controlled React e-learning application.

## Research Questions
RQ1. What is the effect of image optimization?
RQ2. What is the effect of lazy loading?
RQ3. What is the effect of code splitting?
RQ4. Does combining techniques produce greater improvement than applying them individually?

## Objectives
1. Build a realistic React e-learning application.
2. Establish a reproducible unoptimized baseline.
3. Apply optimization techniques incrementally.
4. Measure performance after each stage.
5. Compare the changes quantitatively.
6. Identify the strongest techniques under the experimental conditions.

## Sequence
V0 Baseline → V1 Images → V2 Lazy Loading → V3 Code Splitting → V4 Caching/Compression → V5 Combined.

## Metrics
Performance score, FCP, LCP, TBT, CLS, Speed Index, transfer/page size, request count.

## Integrity
Results and quantitative claims must come from actual measurements.
