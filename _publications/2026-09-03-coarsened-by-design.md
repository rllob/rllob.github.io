---
title: "Coarsened by Design: Measurement Error Bias from Grouped Variables in Interacted Regressions"
collection: publications
permalink: /research/coarsened-by-design/
excerpt: "Social scientists theorize about continuous quantities such as income but often observe them only through a few ordered brackets, which they replace with category ranks or midpoints. I show that this practice induces a measurement error that can rescale a true interaction effect or fabricate a spurious one, and I develop a regularized interval regression with an empirical Bayes extension that corrects it. In six replications of published studies, the corrections change a published conclusion in five. Draft available upon request."
date: 2026-09-03
venue: "Working paper"
---

Social scientists theorize about continuous quantities, such as income, but often observe them only through a small number of ordered brackets, and they routinely estimate effects by treating category ranks or bracket midpoints as the observed values. This paper shows that these strategies generate coarsening-induced measurement error, which arises from the gap between the population mean within each bracket and the score that the imputation rule assigns to it. The consequences are most severe in regressions with interaction terms, the workhorse of conditional theories in political science: coarsening both rescales a true moderation effect and fabricates a spurious one whenever the proxy's accuracy drifts across levels of the moderator.

The paper then develops the correction. A regularized interval regression uses the observed bracket boundaries to construct a calibrated proxy for each latent value, with an empirical Bayes adjustment for the sparse upper tail, and a simulation-based correction propagates the uncertainty of the proxy into the outcome model. Monte Carlo experiments confirm the analytical results, and six replications of published studies show what is at stake: the corrections move headline estimates by a quarter to two thirds, widen standard errors by up to a factor of 2.5, and change a published conclusion in five of the six studies.

Earlier versions were presented at the 2025 meetings of the European Political Science Association and the American Political Science Association and as a poster at the 2026 Society for Political Methodology meeting. An open source R package implementing the estimators is in development.

Draft available upon request.
