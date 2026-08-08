# ============================================================
# ERP MAINTENANCE MANAGEMENT VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2758
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management_vs_management.boundary_rule
component: maintenance-management-vs-management-boundary-rule


# RULE

Maintenance management owns:
- preventive plan truth
- maintenance execution truth
- downtime truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern maintenance progression,
but management does not replace maintenance-owned truth.

