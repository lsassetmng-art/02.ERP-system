# ============================================================
# ERP MANUFACTURING MANAGEMENT VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2570
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management_vs_management.boundary_rule
component: manufacturing-management-vs-management-boundary-rule


# RULE

Manufacturing management owns:
- production execution truth
- completion truth
- work-center load truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern manufacturing progression,
but management does not replace manufacturing-owned production truth.

