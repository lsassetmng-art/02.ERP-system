# ============================================================
# ERP CRM VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2348
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_vs_management.boundary_rule
component: crm-vs-management-boundary-rule


# RULE

CRM owns:
- customer relationship truth
- interaction continuity truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern CRM progression,
but management does not replace CRM-owned customer relationship truth.

