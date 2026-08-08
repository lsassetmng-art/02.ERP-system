# ============================================================
# ERP SCM TRANSFER DISRUPTION RESILIENCE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1020
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.transfer_disruption_resilience_contracts
component: scm-transfer-disruption-resilience-contracts


# TRANSFER RECOMMENDATION WRITE REQUEST BODY

- linked_supply_plan_id
- origin_node_id
- destination_node_id
- item_reference_code
- recommended_ship_date
- recommended_arrival_date
- recommended_quantity
- recommendation_basis_code


# DISRUPTION EVENT WRITE REQUEST BODY

- affected_node_id
- affected_lane_id
- affected_supplier_profile_id
- disruption_type_code
- disruption_severity_code
- detected_at
- disruption_summary
- expected_recovery_date


# RESILIENCE ASSESSMENT WRITE REQUEST BODY

- assessed_node_id
- assessed_lane_id
- assessed_supplier_profile_id
- resilience_score
- single_source_flag
- alternate_path_flag
- assessed_at


# RULE

Transfer recommendation, disruption event, and resilience assessment
must remain separate contracts.

