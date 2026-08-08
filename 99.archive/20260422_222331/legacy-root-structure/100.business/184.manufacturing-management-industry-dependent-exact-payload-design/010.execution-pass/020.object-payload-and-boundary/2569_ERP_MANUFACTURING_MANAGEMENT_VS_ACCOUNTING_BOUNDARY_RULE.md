# ============================================================
# ERP MANUFACTURING MANAGEMENT VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2569
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management_vs_accounting.boundary_rule
component: manufacturing-management-vs-accounting-boundary-rule


# RULE

Manufacturing management owns:
- production execution truth
- completion truth

Accounting owns:
- posting truth
- cost posting truth
- variance posting truth

# CONSEQUENCE

A production completion is not journal truth.
Accounting handoff state is not accounting-owned posting truth.
Manufacturing may expose cost-relevant visibility,
but it does not replace accounting-owned truth.

