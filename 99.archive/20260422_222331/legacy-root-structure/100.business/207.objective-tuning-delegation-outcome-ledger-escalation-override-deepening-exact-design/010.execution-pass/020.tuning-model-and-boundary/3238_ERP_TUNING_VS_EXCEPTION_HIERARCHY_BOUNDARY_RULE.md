# ============================================================
# ERP TUNING VS EXCEPTION HIERARCHY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3238
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.tuning_vs_exception_hierarchy.boundary_rule
component: tuning-vs-exception-hierarchy-boundary-rule


# RULE

Exception hierarchy owns:
- route selection interpretation
- critical escalation interpretation

Tuning owns:
- post-route adjustment interpretation
- tuning evidence interpretation

# CONSEQUENCE

A tuning session is not exception-route truth.
A tuning result may consume resolution references,
but it does not replace exception-hierarchy-owned truth.

