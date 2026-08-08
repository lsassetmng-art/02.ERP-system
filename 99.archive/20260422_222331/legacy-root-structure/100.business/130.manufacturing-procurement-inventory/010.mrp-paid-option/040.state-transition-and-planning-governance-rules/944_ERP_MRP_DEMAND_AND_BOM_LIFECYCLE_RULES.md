# ============================================================
# ERP MRP DEMAND AND BOM LIFECYCLE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-944
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.demand_and_bom.lifecycle_rules
component: mrp-demand-and-bom-lifecycle-rules


# DEMAND STATUS SET

- draft
- active
- frozen
- closed
- archived


# BOM STATUS SET

- draft
- active
- superseded
- retired
- archived


# RULE

Frozen demand and active BOM are not the same governance state.
Superseded BOM must remain historically visible with effective dates preserved.

