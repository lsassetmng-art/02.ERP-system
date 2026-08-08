# ============================================================
# ERP MRP RUN AND PLANNED ORDER RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-945
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.run_and_planned_order.rules
component: mrp-run-and-planned-order-rules


# RUN STATUS SET

- draft
- submitted
- executed
- completed
- canceled
- archived


# PLANNED ORDER STATUS SET

- proposed
- released
- converted
- canceled
- archived


# RULE

Executed run is not completed review of results.
Released planned order is not converted execution document.

