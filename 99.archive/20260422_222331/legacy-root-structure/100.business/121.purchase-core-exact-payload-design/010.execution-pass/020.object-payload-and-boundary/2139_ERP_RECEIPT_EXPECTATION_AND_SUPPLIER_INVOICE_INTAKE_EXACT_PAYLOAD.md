# ============================================================
# ERP RECEIPT EXPECTATION AND SUPPLIER INVOICE INTAKE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2139
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.receipt_expectation_and_supplier_invoice_intake.exact_payload
component: receipt-expectation-and-supplier-invoice-intake-exact-payload


# OBJECT 1

receipt_expectation

Canonical payload:
- object_id
- company_id
- object_type = receipt_expectation
- status
- receipt_expectation_code
- receipt_expectation_status_code
- linked_purchase_order_id
- expected_receiving_location_reference_code
- expected_receipt_date
- receiving_priority_code
- receipt_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

supplier_invoice_intake

Canonical payload:
- object_id
- company_id
- object_type = supplier_invoice_intake
- status
- supplier_invoice_intake_code
- supplier_invoice_status_code
- linked_purchase_order_id
- linked_receipt_expectation_id
- supplier_invoice_reference_code
- payable_basis_code
- bill_from_reference_code
- invoice_currency_code
- invoice_received_at
- accounting_handoff_state_code
- created_at
- created_by
- updated_at
- updated_by

