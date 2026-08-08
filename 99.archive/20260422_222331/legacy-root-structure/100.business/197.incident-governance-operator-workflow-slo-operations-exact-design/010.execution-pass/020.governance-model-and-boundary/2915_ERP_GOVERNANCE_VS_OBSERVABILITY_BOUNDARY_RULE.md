# ============================================================
# ERP GOVERNANCE VS OBSERVABILITY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2915
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_vs_observability.boundary_rule
component: governance-vs-observability-boundary-rule


# RULE

Observability owns:
- detection and alert interpretation truth

Incident governance owns:
- incident opening, triage, and operating decision truth

# CONSEQUENCE

An alert event is not an incident decision truth.
An incident case may consume observability references,
but it does not replace observability-owned interpretation.

