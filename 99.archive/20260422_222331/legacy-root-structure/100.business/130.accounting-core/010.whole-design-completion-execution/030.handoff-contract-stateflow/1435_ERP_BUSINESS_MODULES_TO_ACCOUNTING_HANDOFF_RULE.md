# ============================================================
# ERP BUSINESS MODULES TO ACCOUNTING HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1435
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business_modules_to_accounting.handoff_rule
component: business-modules-to-accounting-handoff-rule


# RULE

Sales, inventory, purchasing, and manufacturing may hand off:
- commercial billing context
- inventory valuation or adjustment context
- sourcing and receipt context
- production consumption/output context

Accounting core creates new owned truths:
- journal entry
- ledger posting
- correction request
- reversal entry
- close-cycle control

