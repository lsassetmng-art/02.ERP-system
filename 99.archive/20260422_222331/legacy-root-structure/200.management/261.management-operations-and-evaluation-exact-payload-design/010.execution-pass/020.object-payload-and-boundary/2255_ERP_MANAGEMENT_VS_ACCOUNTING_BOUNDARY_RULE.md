# ============================================================
# ERP MANAGEMENT VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2255
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_vs_accounting.boundary_rule
component: management-vs-accounting-boundary-rule


# RULE

Management owns:
- review truth
- approval truth
- exception escalation truth

Accounting owns:
- posting truth
- financial position truth
- close-cycle truth

# CONSEQUENCE

A close-cycle review is not close-cycle ownership.
Management approval visibility does not replace accounting-owned posting truth.

