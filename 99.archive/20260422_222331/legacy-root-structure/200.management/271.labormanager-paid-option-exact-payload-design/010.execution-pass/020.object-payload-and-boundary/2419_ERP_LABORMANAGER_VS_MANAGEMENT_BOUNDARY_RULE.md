# ============================================================
# ERP LABORMANAGER VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2419
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_management.boundary_rule
component: labormanager-vs-management-boundary-rule


# RULE

LaborManager owns:
- labor governance truth
- attendance and leave truth
- compliance truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern labor progression,
but management does not replace LaborManager-owned labor truth.

