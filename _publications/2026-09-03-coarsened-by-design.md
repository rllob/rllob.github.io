---
title: "Addressing Coarsening Induced Measurement Error From Grouped Regressors"
collection: publications
permalink: /research/coarsened-by-design/
excerpt: "Surveys often record income and other continuous quantities in brackets, leaving researchers to assign the numbers used in a regression. I show how discrepancies between assigned scores and within-bracket means can attenuate or amplify a slope, and study reconstruction from interval data, distributional family choice and uncertainty. A top-bracket indicator can remove sensitivity to the assigned top value, but recovery still depends on the calibration of the remaining scores. This is the first paper in a broader project on coarsening-induced measurement error. Draft available upon request."
date: 2026-09-03
venue: "Working paper"
posterurl: "https://rllob.github.io/files/llobet_coarsening_poster_polmeth2026.pdf"
---

How strongly do economic resources shape political preferences and participation? Surveys often record income in brackets, leaving researchers to choose numerical values before estimating that relationship. A difference between recorded categories and a slope per unit of income are distinct targets. Category ranks and bracket midpoints do not automatically preserve the latter, even when respondents report their brackets accurately.

This paper develops an account of coarsening-induced measurement error centered on the discrepancy between an assigned score and the population mean within its bracket. I show how the pattern of these discrepancies can attenuate or amplify a linear regression slope. Under the paper's linear-model assumptions, population bracket means preserve the slope, although individuals still differ within each bracket. The distinction separates the information lost through grouping from the consequences of the numerical values used to reconstruct the predictor.

Recovering those means introduces assumptions that the observed categories cannot fully verify. I use interval likelihoods to estimate conditional-mean scores and examine how distributional family choice affects reconstruction and inference. A family can fit the observed bracket frequencies well while recovering the wrong means, particularly in an open upper category. Monte Carlo experiments compare point estimates and confidence intervals, distinguishing uncertainty within a fitted family from uncertainty after family selection.

The paper also examines a simple way to isolate the open top category: adding an indicator for membership in that category. In a regression on a bracket-constant score and this indicator, with an intercept, the slope equals the slope among observations in the closed brackets whenever it is identified. Holding their scores fixed, the assigned top value no longer affects the coefficient. The result does not make arbitrary scores unbiased, because displacement within the remaining brackets can still change the slope. Current simulations show substantial improvements for AIC-selected interval scores in several settings, while midpoint bias can remain and propagating calibration uncertainty does not uniformly restore nominal coverage.

Paper 1 focuses on linear relationships, reconstruction, family sensitivity and inference, with a short extension to additive controls. Income motivates the political applications, while the observation structure also applies to other quantities recorded in known intervals. An open source R package is in development to support these analyses and is described on the [Software](/software/) page.

## Companion papers in progress

The broader project develops the consequences of coarsening for different research questions:

- **Bracketed Predictors and Apparent Moderation** studies how calibration differences change interaction coefficients and substantive contrasts.
- **Comparable Measurement Across Heterogeneous Populations** examines cross-population comparability and the choice between pooled and separate calibration.

## Earlier project poster

Earlier versions of the broader project were presented at the 2025 meetings of the European Political Science Association and the American Political Science Association. The poster below was presented at the 2026 Society for Political Methodology meeting (PolMeth XLIII), Michigan State University, July 2026, and reflects an earlier version combining the reconstruction and interaction questions.

<ul class="pdf-embed__links">
  <li><a href="https://rllob.github.io/files/llobet_coarsening_poster_polmeth2026.pdf" target="_blank" rel="noopener">View</a></li>
  <li><a href="https://rllob.github.io/files/llobet_coarsening_poster_polmeth2026.pdf" download>Download</a></li>
</ul>

Draft available upon request.
