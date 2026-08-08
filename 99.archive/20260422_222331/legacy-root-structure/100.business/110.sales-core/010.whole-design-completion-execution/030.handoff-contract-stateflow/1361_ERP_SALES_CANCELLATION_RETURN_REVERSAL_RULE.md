# ============================================================
# ERP SALES CANCELLATION RETURN REVERSAL RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1361
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.cancellation_return_reversal.rule
component: sales-cancellation-return-reversal-rule


# RULE

Sales cancellation, return, and reversal semantics must remain distinct.

Representative distinctions:
- canceled order is not received return
- return request is not accounting reversal
- billing cancellation is not journal correction

# CONSEQUENCE

Every reversal-class action must preserve:
- original sales object reference
- reversal or cancellation reason
- actor
- timestamp
- downstream handoff visibility

