# ============================================================
# ERP ANALYTICS REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1865
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.request_response.contracts
component: analytics-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

analytics_dataset_model write:
- model_type_code
- model_scope_code
- refresh_frequency_code
- linked_source_registry_code
- owner_role_code

analytics_metric_catalog_entry write:
- linked_dataset_model_id
- metric_formula_code
- metric_unit_code
- aggregation_rule_code
- metric_owner_role_code

analytics_view_snapshot write:
- linked_dataset_model_id
- linked_metric_catalog_entry_id
- snapshot_period_code
- view_scope_code
- published_at

analytics_insight_record write:
- linked_view_snapshot_id
- insight_type_code
- insight_severity_code
- generated_at
- insight_summary_text

analytics_scenario_snapshot write:
- linked_dataset_model_id
- scenario_type_code
- scenario_period_code
- scenario_parameter_reference_code
- calculated_at

