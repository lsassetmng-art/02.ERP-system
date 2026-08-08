# ============================================================
# ERP MANAGEMENT REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1577
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.request_response.contracts
component: management-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

management_review_cycle write:
- review_scope_code
- review_period_code
- scheduled_review_at
- owner_role_code
- linked_summary_reference_code

management_decision_record write:
- decision_type_code
- decision_at
- linked_review_cycle_id
- decision_summary_text

management_escalation_case write:
- escalation_reason_code
- linked_source_module_code
- linked_source_object_reference_code
- escalated_at

management_action_directive write:
- directive_type_code
- linked_decision_record_id
- assigned_role_code
- due_at

management_watchlist_entry write:
- watchlist_category_code
- linked_source_module_code
- linked_source_object_reference_code
- watch_reason_code

