# ============================================================
# ERP TRUST DECAY VS TRUST SCORING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3301
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.trust_decay_vs_trust_scoring.boundary_rule
component: trust-decay-vs-trust-scoring-boundary-rule


# RULE

Trust scoring owns:
- trust band interpretation
- trust direction interpretation

Trust decay owns:
- time-based erosion interpretation
- inactivity penalty interpretation
- recovery-window interpretation

# CONSEQUENCE

A decay evaluation is not trust-score truth.
A decay profile may consume trust references,
but it does not replace trust-scoring-owned truth.

