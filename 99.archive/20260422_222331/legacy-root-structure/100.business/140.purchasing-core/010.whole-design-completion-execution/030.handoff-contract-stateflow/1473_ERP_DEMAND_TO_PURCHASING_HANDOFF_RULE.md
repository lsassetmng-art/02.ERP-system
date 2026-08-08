# ============================================================
# ERP DEMAND TO PURCHASING HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1473
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.demand_to_purchasing.handoff_rule
component: demand-to-purchasing-handoff-rule


# RULE

Inventory, manufacturing, MRP, and SCM may hand off:
- replenishment context
- production need context
- planning recommendation context
- network source context

Purchasing core creates new owned truths:
- purchase request
- purchase order
- receipt expectation
- supplier return request

