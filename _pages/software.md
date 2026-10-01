---
layout: archive
title: "Software"
permalink: /software/
author_profile: true
---

I develop open source tools for the measurement problems my research runs into. The package below
is in active development and is not yet released.

## An R package for coarsened and latent variable measurement

Working name: **LVM**. The package supports my [research on coarsening-induced measurement error](/research/coarsened-by-design/),
so that applied researchers can reconstruct bracketed predictors and assess the assumptions behind
the resulting estimates without reimplementing the estimators.

**What it addresses.** Surveys record continuous quantities such as income in ordered brackets,
and analysts then assign numerical scores. When the target is a relationship per unit of the
underlying quantity, discrepancies between these scores and conditional bracket means can attenuate
or amplify a regression slope. Good fit to bracket frequencies alone does not establish that a
reconstruction preserves that relationship.

**Methods and tools under development.**

- Interval likelihoods for fitting alternative distributional families and constructing
  conditional-mean scores from known bracket boundaries.
- Coarsening and midpoint-proxy functions with explicit rules for open categories.
- Model-conditional propagation of calibration uncertainty for linear regressions, with
  diagnostics that make its assumptions and failures explicit.
- Diagnostics for bracket occupancy, family fit and sensitivity to the open upper category.
- Likelihood-based and Bayesian estimation for interval-censored and latent variable models more
  generally.

The research evaluates point-estimate accuracy, interval coverage and method availability separately.
Family-selection uncertainty and sensitivity to misspecification require additional assessment.
Empirical Bayes extensions remain exploratory.

**Status.** Under active development, with a public release planned to accompany the research. If you
work with bracketed measures and would find the methods useful before then, please
[write to me](mailto:rllobet@uw.edu).
