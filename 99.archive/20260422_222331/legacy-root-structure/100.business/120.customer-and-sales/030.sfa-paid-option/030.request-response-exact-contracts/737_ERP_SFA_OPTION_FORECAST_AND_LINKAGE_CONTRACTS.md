# ============================================================
# ERP SFA OPTION FORECAST AND LINKAGE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-737
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.forecast_and_linkage_contracts
component: sfa-option-forecast-and-linkage-contracts


# FORECAST REQUEST BODY

- pipeline_code_set
- owner_scope_code
- forecast_window_code
- snapshot_basis_code


# FORECAST RESPONSE DATA

- snapshot_list
  - object_id
  - object_type = sfa_pipeline_forecast_snapshot
  - pipeline_code
  - snapshot_at
  - total_pipeline_amount
  - weighted_pipeline_amount
  - opportunity_count


# LINKAGE LOOKUP RESPONSE DATA

- sfa_option_enabled_flag
- linked_lead_exists_flag
- linked_opportunity_exists_flag
- linkage_status_code


# RULE

Forecast response is derived analytical data.
It must not be mistaken for opportunity source truth.

