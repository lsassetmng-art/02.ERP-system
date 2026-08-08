# ============================================================
# ERP EPM OBJECTIVE AND KPI CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-850
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.objective_and_kpi_contracts
component: epm-objective-and-kpi-contracts


# OBJECTIVE LIST REQUEST BODY

- objective_level_code_set
- objective_status_code_set
- objective_owner_user_id_set
- company_wide_mbo_flag
- page
- page_size


# OBJECTIVE LIST RESPONSE DATA

- items
  - object_id
  - object_type = epm_objective_node
  - company_id
  - status
  - objective_code
  - parent_objective_id
  - objective_name
  - objective_owner_user_id
  - objective_status_code
  - objective_start_date
  - objective_end_date
  - company_wide_mbo_flag
  - updated_at
- total_count
- page
- page_size


# KPI WRITE RULE

KPI definition update must be separate from
scorecard snapshot or forecast record creation.

