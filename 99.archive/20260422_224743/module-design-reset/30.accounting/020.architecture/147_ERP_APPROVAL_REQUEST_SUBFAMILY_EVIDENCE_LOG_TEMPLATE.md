# ============================================================
# ERP APPROVAL REQUEST SUBFAMILY EVIDENCE LOG TEMPLATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the template for logging approval_request-like evidence.

template_fields:
- evidence_id
- target_table_or_view
- evidence_source_type
- evidence_source_path_or_origin
- observed_operation_or_derivation
- inferred_subfamily
- inferred_role
- authority_signal
- confidence
- notes

value_guidance:

evidence_source_type_examples:
- repository_code
- workflow_handler
- approval_service
- governance_service
- notify_service
- ai_service
- sql_function
- trigger
- migration
- view_definition

observed_operation_or_derivation_examples:
- insert_request
- update_status
- attach_decision
- enqueue_notification
- render_read_projection
- mirror_copy
- ai_recommendation_write
- workflow_transition_write

inferred_subfamily_examples:
- true_approval_truth
- governance_control_request
- notify_support
- workflow_system_support
- ai_support
- projection_read_surface
- unresolved

inferred_role_examples:
- source_of_truth
- support
- history
- projection
- mirror
- unresolved

authority_signal_examples:
- first_insert_target
- status_update_target
- decision_write_target
- read_only_projection
- support_only
- unclear

confidence_values:
- high
- medium
- low
- unresolved

example_row:
- evidence_id: approval-evidence-001
- target_table_or_view: workflow.approval_request
- evidence_source_type: workflow_handler
- evidence_source_path_or_origin: approval workflow submit handler
- observed_operation_or_derivation: insert_request
- inferred_subfamily: true_approval_truth
- inferred_role: source_of_truth
- authority_signal: first_insert_target
- confidence: medium
- notes: needs decision update path confirmation

conclusion:
Use this template to keep approval subfamily evidence collection consistent.
