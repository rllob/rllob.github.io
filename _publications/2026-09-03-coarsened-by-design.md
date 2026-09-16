---
title: "Coarsened by Design: Measurement Error Bias from Grouped Variables in Interacted Regressions"
collection: publications
permalink: /research/coarsened-by-design/
excerpt: "Social scientists theorize about continuous quantities such as income but often observe them only through a few ordered brackets, which they replace with category ranks or midpoints. I show that this practice induces a measurement error that can rescale a true interaction effect or fabricate a spurious one, and I develop a regularized interval regression with an empirical Bayes extension that corrects it. Five reanalyses of published studies show what a scoring rule contributes to a substantive comparison. Draft available upon request."
date: 2026-09-03
venue: "Working paper"
posterurl: "https://rllob.github.io/files/llobet_coarsening_poster_polmeth2026.pdf"
---

Social scientists theorize about continuous quantities, such as income, but often observe them only through a small number of ordered brackets, and they routinely estimate effects by treating category ranks or bracket midpoints as the observed values. This paper shows that these strategies generate coarsening-induced measurement error, which arises from the gap between the population mean within each bracket and the score that the imputation rule assigns to it. The consequences are most severe in regressions with interaction terms, the workhorse of conditional theories in political science: coarsening both rescales a true moderation effect and fabricates a spurious one whenever the proxy's accuracy drifts across levels of the moderator.

The paper then develops the correction. A regularized interval regression uses the observed bracket boundaries to construct a calibrated proxy for each latent value, with an empirical Bayes adjustment for the sparse upper tail, and a simulation-based correction propagates the uncertainty of the proxy into the outcome model. Monte Carlo experiments confirm the analytical results, with calibrated intervals recovering close to nominal coverage where midpoint scoring does not. Five reanalyses of published studies, in South Korea, Chile, Spain, Belgium, and the United States, then show what a scoring rule contributes to a substantive comparison. The Chilean study is the most informative, because exact incomes can be coarsened for the same respondents, giving a fixed target against which alternative reconstructions are judged.

Earlier versions were presented at the 2025 meetings of the European Political Science Association and the American Political Science Association. An open source R package implementing the estimators is in development, and is described on the [Software](/software/) page.

## Poster

Presented at the 2026 Society for Political Methodology meeting (PolMeth XLIII), Michigan State University, July 2026.

<ul class="pdf-embed__links">
  <li><a href="https://rllob.github.io/files/llobet_coarsening_poster_polmeth2026.pdf" target="_blank" rel="noopener">View</a></li>
  <li><a href="https://rllob.github.io/files/llobet_coarsening_poster_polmeth2026.pdf" download>Download</a></li>
</ul>

Draft available upon request.
