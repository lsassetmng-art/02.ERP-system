# ============================================================
# ERP V3 CANDIDATE RESURFACING EVALUATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the evaluation rule
for resurfacing v3 candidates.

evaluation_axes:
- cross-domain importance
- structural leverage
- unresolved impact
- maturity of current evidence
- dependency on existing connected sets
- usefulness as next-stage design driver

priority_rule:
Prefer candidates that:
- connect multiple domains
- unlock second-stage refinement
- are already strongly implied by current outputs
- reduce future architectural ambiguity

deprioritize:
- speculative candidates with weak grounding
- implementation-only items
- candidates already effectively covered by current connected sets

conclusion:
The resurfacing pass should elevate candidates
with high leverage and high architectural relevance.
