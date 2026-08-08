# ============================================================
# ERP CRM VS SFA BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2346
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_vs_sfa.boundary_rule
component: crm-vs-sfa-boundary-rule


# RULE

CRM owns:
- customer relationship foundation truth
- interaction continuity truth

SFA owns:
- lead and opportunity execution truth
- forecast and next-action truth

# CONSEQUENCE

An interaction case is not an opportunity record.
A relationship health snapshot is not forecast truth.

