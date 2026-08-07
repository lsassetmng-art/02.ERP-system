# ============================================================
# ERP SETTLEMENT AND AR AP EVIDENCE LOG TEMPLATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the template for logging settlement and AR/AP evidence.

template_fields:
- evidence_id
- family
- target_table_or_view
- evidence_source_type
- evidence_source_path_or_origin
- observed_operation_or_derivation
- inferred_role
- source_linkage
- target_linkage
- confidence
- notes

value_guidance:

family_examples:
- settlement
- receivable
- payable
- ar_ap_projection

evidence_source_type_examples:
- repository_code
- sql_function
- trigger
- migration
- view_definition
- script
- posting_flow

observed_operation_or_derivation_examples:
- insert_application_row
- update_balance
- derive_preview
- join_to_billing
- join_to_journal
- join_to_payment
- read_only_projection

inferred_role_examples:
- source_of_truth
- line_application_truth
- header_truth
- projection
- support
- unresolved

confidence_values:
- high
- medium
- low
- unresolved

example_row:
- evidence_id: settlement-evidence-001
- family: settlement
- target_table_or_view: finance.payment_allocation
- evidence_source_type: repository_code
- evidence_source_path_or_origin: payment allocation apply flow
- observed_operation_or_derivation: insert_application_row
- inferred_role: line_application_truth
- source_linkage: payment/receipt
- target_linkage: receivable/payable
- confidence: medium
- notes: header table still unresolved

conclusion:
Use this template to keep settlement and AR/AP evidence collection consistent.
