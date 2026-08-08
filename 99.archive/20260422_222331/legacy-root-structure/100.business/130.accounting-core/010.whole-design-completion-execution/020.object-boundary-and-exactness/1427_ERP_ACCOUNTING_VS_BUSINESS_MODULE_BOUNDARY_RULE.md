# ============================================================
# ERP ACCOUNTING VS BUSINESS MODULE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1427
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_vs_business_module.boundary_rule
component: accounting-vs-business-module-boundary-rule


# RULE

Sales, inventory, purchasing, and manufacturing
own their own operational truths.

Accounting owns posting and close truth.

# CONSEQUENCE

Operational events may trigger accounting behavior,
but they do not replace accounting posting ownership.
Accounting posting does not replace operational source truth.

