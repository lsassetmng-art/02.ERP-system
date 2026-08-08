# ============================================================
# ERP HEADER WRITE EVIDENCE LOG TEMPLATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the template for logging header write-path evidence.

template_fields:
- evidence_id
- target_pair
- target_table
- evidence_source_type
- evidence_source_path_or_origin
- observed_operation
- write_timing
- inferred_role
- confidence
- notes

value_guidance:

target_pair_examples:
- public.order_header vs sales.order_header
- public.purchase_order_header vs purchase.purchase_order_header
- public.billing_header vs sales.billing_header
- public.return_header vs sales.return_header
- public.shipping_header vs sales.shipping_header

evidence_source_type_examples:
- repository_code
- sql_function
- trigger
- migration
- script
- job_runner
- view_definition

observed_operation_examples:
- insert
- update_status
- sync_copy
- mirror_refresh
- dual_write
- read_only_projection

inferred_role_examples:
- write_authority
- mirror
- transitional
- active_parallel_write
- unresolved

confidence_values:
- high
- medium
- low
- unresolved

example_row:
- evidence_id: header-evidence-001
- target_pair: public.order_header vs sales.order_header
- target_table: sales.order_header
- evidence_source_type: repository_code
- evidence_source_path_or_origin: sales order create command
- observed_operation: insert
- write_timing: first write on order creation
- inferred_role: write_authority
- confidence: medium
- notes: public side still needs sync-path confirmation

conclusion:
Use this template to keep header evidence collection consistent.
