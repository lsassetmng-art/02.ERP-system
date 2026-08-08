# ============================================================
# ERP CONCRETE CANDIDATE TABLES DOCUMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the concrete currently observed candidate table names
for document-family review.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED CONCRETE CANDIDATES
# ============================================================

observed_concrete_candidates:
- ai.approval_request
- audit.approval_request
- audit.entity_status_history
- core.document_sequence
- core.journal_source_link
- core.status_history
- finance.bank_statement_header
- finance.bank_statement_line
- govern.approval_request
- governance.approval_request
- governance.contract_header
- governance.document_archive
- governance.document_category
- hr.leave_request
- notify.approval_request
- ops.document_file
- ops.document_send_history
- ops.document_send_queue
- ops.document_type_master
- public.approval_request_with_url
- public.billing_header
- public.document_sequence
- public.leave_request
- public.order_header
- public.purchase_order_header
- public.return_header
- public.shipping_header
- public.status_history
- purchase.purchase_order_header
- sales.billing_header
- sales.order_header
- sales.return_header
- sales.shipping_header
- shipping.shipment_line
- system.approval_request
- system.exec_run_request
- workflow.approval_request

# ============================================================
# 2. WORKING FILTER
# ============================================================

highest_priority_document_truth_candidates:
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header
- sales.order_header
- sales.billing_header
- sales.return_header
- sales.shipping_header
- purchase.purchase_order_header

history_and_support_candidates:
- core.document_sequence
- public.document_sequence
- core.status_history
- public.status_history
- governance.document_archive
- ops.document_file
- ops.document_type_master
- ops.document_send_history

approval-request-like mixed candidates:
- ai.approval_request
- audit.approval_request
- govern.approval_request
- governance.approval_request
- notify.approval_request
- system.approval_request
- workflow.approval_request

# ============================================================
# 3. CURRENT JUDGMENT
# ============================================================

current_judgment:
The document-family is not one simple shared-table family.

Strong pattern:
- domain-specific header truth exists
- sequence/history/support families exist
- approval_request-like family overlaps with document-facing review/control concerns

working implication:
Generic document contracts may need to resolve
through a union/read-model approach rather than one shared document base table.

# ============================================================
# 4. NEXT CHECK
# ============================================================

next_check:
Inspect columns for:
- whether header tables share common structural envelope
- whether status_history is generic or domain-specific
- whether document_sequence is shared support
- whether document_archive is final archive support or active truth

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Document-family now has enough concrete candidates
to move into domain-header vs shared-support classification.
