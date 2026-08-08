# ============================================================
# ERP MRP DEMAND AND BOM CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-938
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.demand_and_bom_contracts
component: mrp-demand-and-bom-contracts


# DEMAND LIST REQUEST BODY

- item_reference_code_set
- planning_period_start_from
- planning_period_end_to
- demand_status_code_set
- demand_source_code_set
- page
- page_size


# DEMAND LIST RESPONSE DATA

- items
  - object_id
  - object_type = mrp_demand_program
  - company_id
  - status
  - demand_program_code
  - item_reference_code
  - planning_period_start
  - planning_period_end
  - demand_status_code
  - demand_quantity
  - demand_source_code
  - updated_at
- total_count
- page
- page_size


# BOM WRITE RULE

BOM version change must be separate from ordinary
descriptive field patch.

