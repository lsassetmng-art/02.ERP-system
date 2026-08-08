# ============================================================
# ERP ACCOUNTING VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2208
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_vs_management.boundary_rule
component: accounting-vs-management-boundary-rule


# RULE

Accounting owns:
- posting truth
- financial position truth
- close-cycle truth

Management owns:
- approval truth
- review truth
- escalation truth

# CONSEQUENCE

Approval visibility may constrain accounting progression,
but management does not replace accounting-owned posting truth.

