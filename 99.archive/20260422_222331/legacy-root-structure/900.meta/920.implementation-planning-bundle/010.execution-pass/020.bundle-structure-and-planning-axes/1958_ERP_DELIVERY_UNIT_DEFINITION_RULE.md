# ============================================================
# ERP DELIVERY UNIT DEFINITION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1958
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.delivery_unit_definition.rule
component: delivery-unit-definition-rule


# RULE

A delivery unit should be small enough to:
- verify independently
- preserve upstream contracts
- fail without corrupting unrelated domains

A delivery unit should be large enough to:
- represent one coherent implementation objective
- reduce needless context switching

