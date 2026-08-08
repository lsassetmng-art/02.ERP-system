# ============================================================
# ERP EVIDENCE_WEIGHTING VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3044
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.evidence_weighting_vs_management.boundary_rule
component: evidence-weighting-vs-management-boundary-rule


# RULE

Evidence weighting owns:
- evidence weight interpretation
- contradiction penalty interpretation
- freshness multiplier interpretation

Management owns:
- higher-order approval and policy truth

# CONSEQUENCE

A weighting profile is not management policy truth.
Weighting interpretation may require management visibility,
but it does not replace management-owned truth.

