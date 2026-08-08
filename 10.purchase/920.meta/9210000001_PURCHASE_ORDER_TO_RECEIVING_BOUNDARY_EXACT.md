# ============================================================
# PURCHASE ORDER TO RECEIVING BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 10.purchase
related_modules:
- 11.procurement
- 13.warehouse
- 12.inventory
- 17.quality
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define purchase order truth and the exact receiving expectation handoff from
purchase to warehouse, preserving purchase order ownership separately from
warehouse receiving and inventory stock truth.

canonical_role:
- purchase order / supplier order / commercial purchasing document truth

# ============================================================
# 1. CORE PURCHASE OBJECTS
# ============================================================

core_objects:
- purchase_order
- purchase_order_line
- supplier_order_confirmation
- purchase_order_change
- purchase_order_cancellation
- purchase_delivery_schedule
- purchase_receiving_expectation
- purchase_receipt_matching_basis
- purchase_return_request
- purchase_supplier_claim_basis

# ============================================================
# 2. PURCHASE ORDER
# ============================================================

object_name:
- purchase_order

meaning:
- canonical commercial purchasing document issued to supplier

required_fields:
- purchase_order_id
- company_id
- supplier_id
- buyer_reference
- procurement_package_reference_or_null
- purchase_order_number
- purchase_order_status
- order_date
- currency_code
- payment_terms_reference_or_null
- incoterms_or_delivery_terms_or_null
- ship_to_location_id
- bill_to_reference_or_null
- purchase_order_line_set
- total_order_amount_or_null
- approval_reference_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

allowed_purchase_order_status:
- draft
- approval_pending
- approved
- issued
- supplier_confirmed
- partially_received
- fully_received
- closed
- cancelled
- superseded

rules:
- issued PO is purchase truth
- supplier confirmation updates purchase-side commitment truth
- receiving operation belongs to 13.warehouse
- stock receipt effect belongs to 12.inventory
- accounting posting belongs to 30.accounting

# ============================================================
# 3. PURCHASE ORDER LINE
# ============================================================

object_name:
- purchase_order_line

required_fields:
- purchase_order_line_id
- purchase_order_id
- line_number
- item_id_or_service_id
- ordered_quantity
- quantity_uom
- unit_price_or_null
- currency_code
- requested_delivery_date_or_null
- promised_delivery_date_or_null
- ship_to_location_id
- receiving_required_flag
- quality_inspection_required_flag
- line_status
- lineage_reference

allowed_line_status:
- draft
- approved
- issued
- supplier_confirmed
- partially_received
- fully_received
- closed
- cancelled
- superseded

rules:
- PO line ordered quantity is not received quantity
- received quantity must come from warehouse receiving / inventory workflow
- quality requirement must be visible to warehouse and quality modules

# ============================================================
# 4. SUPPLIER ORDER CONFIRMATION
# ============================================================

object_name:
- supplier_order_confirmation

required_fields:
- supplier_order_confirmation_id
- company_id
- purchase_order_id
- supplier_id
- confirmation_status
- confirmed_line_set
- confirmed_at
- received_from_supplier_actor_or_system
- promised_delivery_update_set_or_null
- exception_reference_or_null
- lineage_reference

allowed_confirmation_status:
- received
- accepted
- accepted_with_difference
- rejected
- superseded

rules:
- supplier confirmation is purchasing commitment evidence
- supplier confirmation is not physical receipt
- delivery date updates may change receiving expectation through purchase workflow

# ============================================================
# 5. PURCHASE TO WAREHOUSE RECEIVING EXPECTATION
# ============================================================

handoff_object_name:
- purchase_to_warehouse_receiving_expectation

meaning:
- controlled receiving expectation sent from purchase to warehouse

required_fields:
- receiving_expectation_id
- company_id
- source_module
- target_module
- purchase_order_id
- supplier_id
- expected_receipt_location_id
- expected_receipt_window_start_or_null
- expected_receipt_window_end_or_null
- receiving_expectation_line_set
- quality_requirement_reference_set_or_null
- handling_instruction_or_null
- receiving_status
- created_at
- created_by
- lineage_reference

receiving_expectation_line_required_fields:
- receiving_expectation_line_id
- purchase_order_line_id
- item_id_or_service_id
- expected_quantity
- quantity_uom
- expected_lot_or_serial_requirement_or_null
- quality_inspection_required_flag
- warehouse_instruction_or_null

allowed_receiving_status:
- building
- handoff_ready
- handed_off_to_warehouse
- accepted_by_warehouse
- rejected_by_warehouse
- partially_received
- fully_received
- cancelled
- superseded

rules:
- source_module must be 10.purchase
- target_module must be 13.warehouse
- receiving expectation is not physical receipt
- warehouse may accept/reject based on operational readiness
- receiving updates from warehouse must not rewrite PO ordered quantity in place

# ============================================================
# 6. PURCHASE RECEIPT MATCHING BASIS
# ============================================================

object_name:
- purchase_receipt_matching_basis

meaning:
- purchase-side basis for matching PO, receipt, quality, and invoice where applicable

required_fields:
- matching_basis_id
- company_id
- purchase_order_id
- purchase_order_line_id_or_null
- warehouse_receiving_reference_set
- inventory_receipt_reference_set
- quality_result_reference_set_or_null
- invoice_reference_set_or_null
- matching_status
- variance_summary_or_null
- created_at
- lineage_reference

allowed_matching_status:
- not_started
- awaiting_receipt
- awaiting_quality
- awaiting_invoice
- matched
- variance_detected
- exception_review
- closed
- cancelled

rules:
- matching basis does not own stock ledger
- invoice/accounting posting belongs to 30.accounting or AP module when defined
- quality acceptance belongs to 17.quality
- receipt quantity source comes through warehouse/inventory references

# ============================================================
# 7. FEEDBACK FROM WAREHOUSE / INVENTORY / QUALITY
# ============================================================

allowed_feedback:
- warehouse receiving accepted/rejected
- warehouse received quantity observation
- warehouse discrepancy observation
- inventory receipt accepted/rejected
- quality accepted/rejected/conditional
- receiving completion status

rules:
- purchase may update PO line received status from accepted receipt references
- purchase may open supplier claim / return process
- purchase may not directly edit stock ledger
- purchase may not decide quality acceptance

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- PO issued status treated as received
- supplier confirmation treated as warehouse receipt
- purchase module directly creating inventory ledger receipt
- warehouse receiving discrepancy directly editing PO ordered quantity
- inventory stock correction directly editing purchase order commercial terms
- BI dashboard used as receipt matching source
- quality rejection ignored when matching purchase receipt

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If it is supplier order/commercial PO truth, 10 owns it.
- If it is sourcing/authorized buying basis, 11 owns it.
- If it is physical receiving, 13 owns it.
- If it is stock receipt, 12 owns it.
- If it is quality acceptance, 17 owns it.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- purchase order truth fixed
- PO to warehouse receiving expectation fixed
- receipt matching basis fixed
- purchase feedback boundaries fixed

# ============================================================
