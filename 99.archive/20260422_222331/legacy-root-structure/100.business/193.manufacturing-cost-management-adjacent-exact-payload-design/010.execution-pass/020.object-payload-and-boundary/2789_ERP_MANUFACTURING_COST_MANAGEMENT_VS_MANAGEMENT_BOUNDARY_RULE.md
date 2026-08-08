# ============================================================
# ERP MANUFACTURING COST MANAGEMENT VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2789
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management_vs_management.boundary_rule
component: manufacturing-cost-management-vs-management-boundary-rule


# RULE

Manufacturing cost management owns:
- standard-cost snapshot truth
- variance interpretation truth
- cost-closure truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern cost closure progression,
but management does not replace cost-management-owned truth.

