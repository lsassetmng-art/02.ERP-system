# ============================================================
# ERP SERVICE LEVEL EXCEPTION AND SUPPLY RISK EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2662
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.service_level_exception_and_supply_risk.exact_payload
component: service-level-exception-and-supply-risk-exact-payload


# OBJECT 1

service_level_exception_case

Canonical payload:
- object_id
- company_id
- object_type = service_level_exception_case
- status
- service_level_exception_case_code
- service_level_exception_status_code
- linked_transfer_plan_case_id
- linked_supply_commitment_coordination_case_id
- exception_type_code
- exception_severity_code
- impacted_service_level_code
- exception_occurred_at
- resolution_state_code
- exception_summary_text
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

supply_risk_snapshot

Canonical payload:
- object_id
- company_id
- object_type = supply_risk_snapshot
- status
- supply_risk_snapshot_code
- risk_snapshot_status_code
- risk_scope_code
- linked_node_reference_code
- linked_item_reference_code
- risk_category_code
- risk_severity_code
- expected_impact_summary_text
- mitigation_summary_text
- snapped_at
- created_at
- created_by
- updated_at
- updated_by

