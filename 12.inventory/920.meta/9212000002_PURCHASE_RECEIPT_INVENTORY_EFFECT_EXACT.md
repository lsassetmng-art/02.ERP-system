# ============================================================
# PURCHASE RECEIPT INVENTORY EFFECT EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 12.inventory
producer_module: 13.warehouse
related_modules:
- 10.purchase
- 17.quality
- 18.costing
- 30.accounting

purpose:
Define how inventory accepts warehouse purchase receipt confirmations and
records stock ledger receipt effects without owning purchase order or warehouse
receiving truth.

accepted_input_object:
- warehouse_to_inventory_purchase_receipt_confirmation

canonical_role:
- stock receipt / inventory ledger / inventory balance truth

# ============================================================
# 1. INTAKE PIPELINE
# ============================================================

intake_pipeline:
- receive_confirmation
- schema_validate
- item_location_validate
- quantity_validate
- quality_reference_validate
- duplicate_check
- stock_ledger_event_create
- balance_update
- feedback_emit

allowed_intake_status:
- received
- validation_pending
- accepted_to_inventory
- rejected_by_inventory
- ledger_recorded
- balance_updated
- superseded
- cancelled

rules:
- accepted_to_inventory may create stock ledger receipt event
- ledger event is immutable
- correction requires reversal/correction event
- purchase order remains 10 truth
- warehouse receiving remains 13 truth

# ============================================================
# 2. ACCEPTANCE REQUIREMENTS
# ============================================================

acceptance_requires:
- source_module = 13.warehouse
- target_module = 12.inventory
- purchase_receiving_operation_id present
- purchase_order_id present
- item_id_or_service_id resolvable as stock item where applicable
- warehouse / bin / location resolvable
- confirmed_quantity_for_inventory valid
- quantity_uom resolvable
- quality result present when quality_required_flag = true
- lineage_reference present
- duplicate confirmation not already accepted

reject_reason_codes:
- INVALID_SCHEMA
- ILLEGAL_SOURCE_MODULE
- PURCHASE_RECEIVING_OPERATION_MISSING
- ITEM_UNRESOLVABLE
- NON_STOCK_ITEM_NOT_ALLOWED
- LOCATION_UNRESOLVABLE
- QUANTITY_INVALID
- UOM_UNRESOLVABLE
- QUALITY_RESULT_REQUIRED
- QUALITY_RESULT_REJECTED
- DUPLICATE_CONFIRMATION
- MISSING_LINEAGE

# ============================================================
# 3. INVENTORY RECEIPT EVENT
# ============================================================

object_name:
- inventory_purchase_receipt_event

meaning:
- inventory-side accepted receipt effect from purchase receiving confirmation

required_fields:
- inventory_receipt_event_id
- company_id
- source_module
- source_confirmation_id
- purchase_receiving_operation_id
- purchase_order_id
- purchase_order_line_id_or_null
- supplier_id
- item_id
- warehouse_id
- location_id
- bin_id_or_null
- lot_id_or_null
- serial_id_set_or_null
- receipt_quantity
- quantity_uom
- stock_status
- quality_result_reference_or_null
- stock_ledger_event_id
- receipt_status
- recorded_at
- recorded_by_system_actor
- lineage_reference

allowed_receipt_status:
- pending
- ledger_recorded
- reversed
- corrected
- superseded

rules:
- receipt event belongs to 12.inventory
- receipt event references warehouse confirmation and PO
- receipt event does not rewrite PO ordered quantity
- receipt event does not rewrite warehouse observed quantity

# ============================================================
# 4. STOCK LEDGER RECEIPT
# ============================================================

ledger_event_type:
- receipt

required_stock_ledger_fields:
- stock_ledger_event_id
- company_id
- event_type
- item_id
- location_id
- warehouse_id
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- quantity_delta
- quantity_uom
- stock_status_before_or_null
- stock_status_after_or_null
- source_module
- source_object_type
- source_object_id
- source_event_id
- event_occurred_at
- recorded_at
- lineage_reference

rules:
- quantity_delta must be positive for normal receipt
- reversal requires separate reversal event
- correction requires correction event
- source references must include warehouse confirmation and PO reference where applicable

# ============================================================
# 5. QUALITY-DEPENDENT STOCK STATUS
# ============================================================

quality_status_rules:
- if quality inspection is not required, stock may become available according to inventory policy
- if quality inspection is required and accepted, stock may become available or conditional according to quality result
- if quality inspection is pending, stock status must be pending_quality / quarantine / blocked as policy defines
- if quality rejected, normal available stock receipt is forbidden unless return/claim workflow explicitly allows blocked stock tracking

stock_status_examples:
- available
- pending_quality
- quarantine
- blocked
- rejected
- returned_pending
- restricted_use

rules:
- 17 owns quality disposition
- 12 owns inventory status representation and stock ledger effect
- 13 owns physical location/holding task

# ============================================================
# 6. FEEDBACK EMISSION
# ============================================================

allowed_feedback:
- to 13.warehouse: confirmation accepted / rejected by inventory
- to 10.purchase: inventory receipt accepted / rejected / partial receipt status
- to 17.quality: quality reference consumed / status pending if needed
- to 18.costing: receipt cost basis candidate
- to 30.accounting: receipt accounting basis candidate
- to 60.business-intelligence: receipt snapshot / inventory movement snapshot

rules:
- feedback to purchase may update PO received status through purchase workflow
- feedback to costing/accounting is basis, not posting itself
- BI receives snapshot only

# ============================================================
# 7. CORRECTION / REVERSAL
# ============================================================

correction_rules:
- accepted receipt cannot be edited in place
- reversal creates negative ledger event referencing original
- correction creates new correction event with reason
- warehouse may issue successor confirmation if physical observation correction is needed
- purchase may issue commercial correction separately if PO terms/quantity need change
- accounting correction belongs to 30.accounting

required_correction_fields:
- correction_event_id
- original_inventory_receipt_event_id
- correction_type
- correction_reason
- corrected_quantity_delta_or_null
- approved_by_or_null
- recorded_at
- lineage_reference

correction_type_examples:
- reversal
- quantity_correction
- location_correction
- lot_serial_correction
- stock_status_correction

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- inventory receipt event changing PO ordered quantity
- inventory receipt event changing supplier confirmation
- inventory receipt event completing warehouse receiving task
- accepting quality-required receipt as available without quality result
- editing stock ledger receipt in place
- BI dashboard correcting receipt quantity
- accounting posting treated as stock receipt event

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If it is accepted stock receipt / inventory balance effect, 12 owns it.
- If it is physical receiving observation, 13 owns it.
- If it is PO commercial truth, 10 owns it.
- If it is quality disposition, 17 owns it.
- If it is accounting posting, 30 owns it.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- purchase receipt inventory effect fixed
- inventory intake validation fixed
- quality-dependent stock status fixed
- correction / reversal boundary fixed
- feedback to purchase / warehouse / costing / accounting / BI fixed

# ============================================================
