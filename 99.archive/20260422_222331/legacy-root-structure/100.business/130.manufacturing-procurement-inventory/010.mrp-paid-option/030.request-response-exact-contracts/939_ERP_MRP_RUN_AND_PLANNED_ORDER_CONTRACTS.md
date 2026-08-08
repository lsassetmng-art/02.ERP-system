# ============================================================
# ERP MRP RUN AND PLANNED ORDER CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-939
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.run_and_planned_order_contracts
component: mrp-run-and-planned-order-contracts


# RUN EXECUTION REQUEST BODY

- planning_horizon_start
- planning_horizon_end
- run_basis_code
- included_item_scope_code
- included_site_scope_code


# RUN RESPONSE DATA

- written_object
  - full mrp_material_requirement_run canonical payload
- generated_planned_order_count
- generated_purchase_recommendation_count
- shortage_count
- audit_context


# PLANNED ORDER WRITE RULE

Planned order conversion or cancellation must remain
separate from ordinary planned order edit.

