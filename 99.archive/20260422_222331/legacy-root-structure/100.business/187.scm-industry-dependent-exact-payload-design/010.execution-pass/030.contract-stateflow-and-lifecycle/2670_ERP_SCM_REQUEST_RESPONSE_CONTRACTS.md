# ============================================================
# ERP SCM REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2670
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.request_response.contracts
component: scm-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

supply_network_node_registry write:
- node_type_code
- node_reference_code
- node_region_code
- node_capacity_summary_text
- node_service_level_code
- upstream_node_reference_code
- downstream_node_reference_code

inter_node_transfer_plan_case write:
- from_node_reference_code
- to_node_reference_code
- transferred_item_reference_code
- planned_transfer_quantity
- planned_ship_at
- planned_arrive_at
- linked_wms_transfer_reference_code
- transfer_priority_code

supply_commitment_coordination_case write:
- coordination_scope_code
- linked_purchase_reference_code
- linked_sales_demand_reference_code
- linked_transfer_plan_case_id
- committed_supply_quantity
- committed_due_date
- coordination_summary_text

service_level_exception_case write:
- linked_transfer_plan_case_id
- linked_supply_commitment_coordination_case_id
- exception_type_code
- exception_severity_code
- impacted_service_level_code
- exception_occurred_at
- resolution_state_code
- exception_summary_text

supply_risk_snapshot write:
- risk_scope_code
- linked_node_reference_code
- linked_item_reference_code
- risk_category_code
- risk_severity_code
- expected_impact_summary_text
- mitigation_summary_text
- snapped_at

