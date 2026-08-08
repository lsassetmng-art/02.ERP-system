# ============================================================
# SUPPLIER INVOICE MATCHING EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 10.purchase
track: Track F
related_modules:
- 11.procurement
- 12.inventory
- 13.warehouse
- 17.quality
- 30.accounting
- 34.cash-management
- 52.master-data
- 60.business-intelligence

purpose:
Define supplier invoice matching, including PO / receipt / quality / invoice
matching, discrepancy handling, AP posting basis, and payment basis.

canonical_role:
- supplier commercial invoice matching workflow truth

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- supplier_invoice_intake
- supplier_invoice_line
- supplier_invoice_matching_run
- supplier_invoice_match_result
- supplier_invoice_match_discrepancy
- supplier_invoice_resolution
- supplier_invoice_to_accounting_basis
- supplier_invoice_to_cash_payment_basis

# ============================================================
# 2. SUPPLIER INVOICE INTAKE
# ============================================================

object_name:
- supplier_invoice_intake

required_fields:
- supplier_invoice_id
- company_id
- supplier_id
- supplier_invoice_number
- invoice_date
- received_at
- currency_code
- invoice_amount
- tax_amount_or_null
- purchase_order_reference_set_or_null
- receipt_reference_set_or_null
- supplier_invoice_status
- source_document_reference_or_null
- lineage_reference

allowed_supplier_invoice_status:
- received
- validation_pending
- matched
- matched_with_warning
- discrepancy_open
- approved_for_accounting
- rejected
- cancelled
- superseded

rules:
- supplier invoice intake belongs to 10.purchase
- AP entry belongs to 30.accounting
- payment execution belongs to 34.cash-management
- supplier identity belongs to 52.master-data

# ============================================================
# 3. SUPPLIER INVOICE LINE
# ============================================================

object_name:
- supplier_invoice_line

required_fields:
- supplier_invoice_line_id
- supplier_invoice_id
- line_number
- item_id_or_service_reference_or_null
- purchase_order_line_id_or_null
- receipt_line_reference_or_null
- invoiced_quantity_or_null
- quantity_uom_or_null
- invoiced_unit_price_or_null
- line_amount
- tax_code_reference_or_null
- line_status
- lineage_reference

rules:
- invoice line belongs to purchase matching workflow
- item identity belongs to 52.master-data
- receipt truth belongs to 13.warehouse / 12.inventory depending object
- tax posting belongs to 30.accounting

# ============================================================
# 4. MATCHING RUN
# ============================================================

object_name:
- supplier_invoice_matching_run

required_fields:
- matching_run_id
- company_id
- supplier_invoice_id
- matching_type
- matching_policy_reference
- run_status
- started_at
- completed_at_or_null
- matched_line_count
- discrepancy_count
- lineage_reference

matching_type_examples:
- two_way_PO_invoice
- three_way_PO_receipt_invoice
- four_way_PO_receipt_quality_invoice
- service_acceptance_invoice
- manual_exception_match

allowed_run_status:
- queued
- running
- completed
- completed_with_discrepancy
- failed
- cancelled
- superseded

rules:
- matching run belongs to 10.purchase
- match consumes PO, receipt, quality, and invoice references
- matching does not change receipt, quality, or PO truth directly

# ============================================================
# 5. MATCH RESULT / DISCREPANCY
# ============================================================

object_name:
- supplier_invoice_match_result

required_fields:
- match_result_id
- matching_run_id
- supplier_invoice_line_id
- purchase_order_line_id_or_null
- receipt_line_reference_or_null
- quality_disposition_reference_or_null
- match_status
- matched_quantity_or_null
- matched_amount_or_null
- variance_quantity_or_null
- variance_amount_or_null
- lineage_reference

match_status_examples:
- matched
- matched_with_tolerance
- quantity_variance
- price_variance
- tax_variance
- missing_PO
- missing_receipt
- quality_hold
- duplicate_invoice
- blocked
- manual_review_required

object_name:
- supplier_invoice_match_discrepancy

required_fields:
- discrepancy_id
- company_id
- supplier_invoice_id
- supplier_invoice_line_id_or_null
- discrepancy_type
- discrepancy_amount_or_quantity_or_null
- severity
- discrepancy_status
- owner_module_or_role
- resolution_reference_or_null
- created_at
- lineage_reference

discrepancy_type_examples:
- price_variance
- quantity_variance
- tax_variance
- missing_receipt
- missing_PO
- quality_rejection
- duplicate_invoice
- supplier_master_mismatch
- currency_mismatch
- tolerance_exceeded

allowed_discrepancy_status:
- open
- under_review
- accepted_variance
- corrected_by_supplier
- corrected_by_purchase
- rejected
- resolved
- cancelled
- superseded

rules:
- discrepancy belongs to 10.purchase
- source correction must be done by source module owner
- accepted variance may create accounting basis
- unresolved discrepancy blocks accounting/payment according to policy

# ============================================================
# 6. RESOLUTION
# ============================================================

object_name:
- supplier_invoice_resolution

required_fields:
- supplier_invoice_resolution_id
- company_id
- supplier_invoice_id
- discrepancy_reference_set_or_null
- resolution_type
- resolution_status
- approved_amount
- currency_code
- accounting_basis_reference_or_null
- payment_basis_reference_or_null
- approval_reference_or_null
- resolved_at_or_null
- lineage_reference

resolution_type_examples:
- approve_as_matched
- approve_with_tolerance
- supplier_credit_expected
- request_supplier_correction
- reject_invoice
- hold_payment
- partial_approval
- manual_adjustment

allowed_resolution_status:
- draft
- approval_pending
- approved
- sent_to_accounting
- sent_to_cash_management
- rejected
- cancelled
- superseded

rules:
- resolution belongs to purchase
- accounting basis goes to 30
- payment basis goes to 34
- payment may be held while discrepancy is open

# ============================================================
# 7. ACCOUNTING / CASH HANDOFF
# ============================================================

handoff_object_name:
- supplier_invoice_to_accounting_basis

required_fields:
- supplier_invoice_accounting_basis_id
- company_id
- source_module
- target_module
- supplier_invoice_id
- supplier_invoice_resolution_id
- supplier_id
- approved_amount
- currency_code
- tax_basis_reference_or_null
- posting_basis_status
- created_at
- lineage_reference

rules:
- target_module must be 30.accounting
- basis is not AP entry or GL journal
- accounting owns AP and GL

handoff_object_name:
- supplier_invoice_to_cash_payment_basis

required_fields:
- supplier_invoice_cash_payment_basis_id
- company_id
- source_module
- target_module
- supplier_invoice_id
- supplier_invoice_resolution_id
- supplier_id
- payable_reference_or_null
- approved_payment_amount
- currency_code
- requested_payment_date_or_null
- payment_hold_flag
- payment_basis_status
- created_at
- lineage_reference

rules:
- target_module must be 34.cash-management
- basis is not payment execution
- cash management owns payment execution

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- supplier invoice treated as AP journal
- invoice match result changing warehouse receipt directly
- invoice match result changing quality disposition directly
- discrepancy resolution posting GL journal directly
- payment basis treated as bank transfer
- matched status deleting discrepancy history
- BI dashboard approving invoice match

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- supplier invoice matching exact design fixed
- PO/receipt/quality/invoice matching boundary fixed
- discrepancy and resolution lifecycle fixed
- accounting/cash handoff fixed

# ============================================================
