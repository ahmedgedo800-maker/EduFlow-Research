# EduFlow — Web Performance Research Project

## Research Title

**Evaluating Modern Web Performance Optimization Techniques in a React-Based Educational Web Application: An Experimental Study**

## Overview

EduFlow is a React-based educational web application developed as an independent research prototype.

The project investigates the effects of modern web performance optimization techniques by evaluating the same application under multiple experimental configurations.

The study evaluates:

- Image Optimization
- Lazy Loading
- Code Splitting
- Delivery Optimization
- Combined Optimization

The application was evaluated using Google Lighthouse under a controlled mobile-emulation environment.

## Research Objectives

The project aims to:

1. Develop a realistic React-based educational web application.
2. Establish an unoptimized baseline configuration.
3. Apply performance optimization techniques incrementally.
4. Measure the effect of each experimental configuration.
5. Compare the resulting performance metrics.
6. Analyze whether combining optimization techniques provides additional benefits.

## Experimental Versions

| Version | Configuration |
|---|---|
| V0 | Baseline |
| V1 | Image Optimization |
| V2 | Lazy Loading |
| V3 | Code Splitting |
| V4 | Delivery Optimization |
| V5 | Combined Optimizations |

## Evaluation Metrics

The experiments use the following Lighthouse metrics:

- Performance Score
- First Contentful Paint (FCP)
- Largest Contentful Paint (LCP)
- Total Blocking Time (TBT)
- Cumulative Layout Shift (CLS)
- Speed Index

Five Lighthouse runs were performed for each experimental configuration.

## Experimental Environment

- Application: EduFlow
- Framework: React
- Build Tool: Vite
- Evaluation Tool: Lighthouse 13.5.0
- Browser: Headless Chrome 155
- Form Factor: Mobile emulation
- Screen: 412 × 823
- CPU slowdown: 4×
- Network RTT: 150 ms
- Network throughput: 1638.4 Kbps

## Main Findings

Under the tested experimental conditions, V2 (Lazy Loading) produced the lowest mean FCP, LCP, TBT, and Speed Index among the evaluated configurations.

Compared with the baseline V0, V2 showed approximately:

- 1.0% lower FCP
- 0.9% lower LCP
- 16.3% lower TBT
- 1.0% lower Speed Index

The results are specific to the EduFlow application and experimental environment and should not be interpreted as universal performance rankings.

## My Contribution

I independently worked on the EduFlow research project, including:

- Designing the experimental web application.
- Implementing the React application.
- Preparing the experimental configurations.
- Implementing the evaluated optimization techniques.
- Running the Lighthouse performance measurements.
- Collecting and organizing the experimental results.
- Analyzing the measured performance metrics.
- Preparing the accompanying research documentation and paper.

## Project Structure

```text
EduFlow-Research/
├── eduflow-app/
├── versions/
├── experiments/
├── research/
├── evidence/
├── docs/
├── scripts/
├── README.md
└── README_AR.md
