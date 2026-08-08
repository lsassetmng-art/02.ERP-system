# ============================================================
# ERP QUALITY MANAGEMENT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2729
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.request_response.contracts
component: quality-management-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

quality_inspection_case write:
- inspection_scope_code
- linked_production_execution_case_id
- linked_purchase_receipt_reference_code
- inspected_item_reference_code
- inspection_lot_reference_code
- sample_quantity
- accepted_quantity
- rejected_quantity
- inspected_at
- inspector_reference_code

quality_nonconformance_case write:
- linked_quality_inspection_case_id
- nonconformance_type_code
- nonconformance_severity_code
- affected_item_reference_code
- affected_quantity
- disposition_code
- discovered_at
- nonconformance_summary_text

quality_hold_case write:
- linked_quality_nonconformance_case_id
- linked_inventory_hold_reference_code
- hold_scope_code
- held_item_reference_code
- held_quantity
- hold_started_at
- hold_reason_code

corrective_action_case write:
- linked_quality_nonconformance_case_id
- corrective_action_type_code
- owner_reference_code
- due_at
- completed_at
- verification_state_code
- corrective_action_summary_text

quality_release_decision_case write:
- linked_quality_hold_case_id
- linked_quality_inspection_case_id
- release_decision_code
- release_scope_code
- release_effective_at
- released_by_reference_code
- override_flag
- release_summary_text

