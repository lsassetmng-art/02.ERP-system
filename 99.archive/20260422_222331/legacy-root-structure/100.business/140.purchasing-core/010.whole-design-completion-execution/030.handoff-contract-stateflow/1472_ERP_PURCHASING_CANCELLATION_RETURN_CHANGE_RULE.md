# ============================================================
# ERP PURCHASING CANCELLATION RETURN CHANGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1472
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.cancellation_return_change.rule
component: purchasing-cancellation-return-change-rule


# RULE

Purchasing cancellation, supplier return, and order change semantics must remain distinct.

Representative distinctions:
- canceled order is not supplier return
- supplier return request is not warehouse outbound execution
- changed order is not new independent sourcing truth without linkage

# CONSEQUENCE

Every cancellation-class, return-class, or change-class action must preserve:
- original purchasing object reference
- reason
- actor
- timestamp
- downstream handoff visibility

