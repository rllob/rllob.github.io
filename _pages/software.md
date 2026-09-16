---
layout: archive
title: "Software"
permalink: /software/
author_profile: true
---

I develop open source tools for the measurement problems my research runs into. The package below
is in active development and is not yet released.

## An R package for coarsened and latent variable measurement

Working name: **LVM**. The package implements the methods developed in my paper on measurement
error from grouped variables, so that applied researchers can use them without reimplementing the
estimators.

**What it addresses.** Surveys record continuous quantities such as income in a handful of ordered
brackets, and analysts then score those brackets with ranks or midpoints. That substitution
introduces measurement error by design, which distorts estimated relationships and, in interacted
models, can rescale a genuine moderation effect or manufacture one that is not there.

**What it will provide.**

- Regularized interval regression, which treats a bracketed response as an interval of a latent
  distribution and builds calibrated proxies from the interval boundaries and covariates.
- Simulation-based uncertainty, so that the estimation error in the calibration step is carried
  into whatever model uses the proxy rather than ignored.
- Diagnostics for when a reconstruction is trustworthy, including checks on the open upper bracket,
  where no natural midpoint exists.
- Likelihood-based and Bayesian estimation for interval-censored and latent variable models more
  generally.

**Status.** Under active development, with a public release planned to accompany the paper. If you
work with bracketed measures and would find the methods useful before then, please
[write to me](mailto:rllobet@uw.edu).
