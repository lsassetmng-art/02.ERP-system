# ============================================================
# PURCHASE RECEIVING INTAKE EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 13.warehouse
producer_module: 10.purchase
related_modules:
- 12.inventory
- 17.quality

purpose:
Define how warehouse receives purchase receiving expectations and executes
physical inbound receiving without taking over purchase order or stock ledger
ownership.

accepted_input_object:
- purchase_to_warehouse_receiving_expectation

canonical_role:
- physical warehouse receiving operation truth

# ============================================================
# 1. INTAKE PIPELINE
# ============================================================

intake_pipeline:
- receive_expectation
- schema_validate
- warehouse_scope_validate
- item_location_validate
- quality_requirement_detect
- receiving_plan_create
- receiving_operation_execute
- confirmation_emit_to_inventory
- quality_handoff_if_required

allowed_intake_status:
- received
- validated
- accepted_by_warehouse
- rejected_by_warehouse
- receiving_planned
- receiving_in_progress
- received_pending_quality
- received_pending_inventory
- confirmed_to_inventory
- closed
- cancelled
- superseded

rules:
- warehouse intake acceptance does not mean goods physically arrived
- physical receiving must be recorded separately
- stock effect requires 12 inventory acceptance
- quality decision requires 17 quality workflow where applicable

# ============================================================
# 2. ACCEPTANCE REQUIREMENTS
# ============================================================

acceptance_requires:
- source_module = 10.purchase
- target_module = 13.warehouse
- purchase_order_id present
- supplier_id present
- expected receipt location resolvable
- receiving expectation lines present
- item / quantity / uom resolvable
- quality requirement flags declared
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- PURCHASE_ORDER_UNRESOLVABLE
- SUPPLIER_UNRESOLVABLE
- WAREHOUSE_SCOPE_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- UOM_UNRESOLVABLE
- EXPECTED_QUANTITY_INVALID
- QUALITY_REQUIREMENT_UNCLEAR
- MISSING_LINEAGE
- DUPLICATE_EXPECTATION
- EXPECTATION_NOT_READY

# ============================================================
# 3. RECEIVING OPERATION
# ============================================================

object_name:
- purchase_receiving_operation

meaning:
- physical receiving operation against purchase receiving expectation

required_fields:
- purchase_receiving_operation_id
- company_id
- warehouse_id
- receiving_expectation_id
- purchase_order_id
- supplier_id
- receiving_status
- receiving_line_set
- discrepancy_reference_set_or_null
- quality_required_flag
- quality_handoff_reference_or_null
- inventory_confirmation_reference_or_null
- received_at_or_null
- received_by_or_null
- lineage_reference

allowed_receiving_status:
- planned
- receiving_in_progress
- received_with_no_discrepancy
- received_with_discrepancy
- received_pending_quality
- received_pending_inventory
- confirmed_to_inventory
- rejected
- cancelled
- superseded

receiving_line_required_fields:
- receiving_line_id
- receiving_expectation_line_id
- purchase_order_line_id
- item_id_or_service_id
- expected_quantity
- observed_quantity
- accepted_physical_quantity_or_null
- damaged_quantity_or_null
- shortage_quantity_or_null
- overage_quantity_or_null
- quantity_uom
- lot_id_or_null
- serial_id_set_or_null
- receiving_line_status
- note_or_null

rules:
- observed quantity is warehouse truth
- accepted inventory receipt quantity is 12 truth after intake
- quality acceptance is 17 truth where required
- overage / shortage may feed back to purchase

# ============================================================
# 4. DISCREPANCY
# ============================================================

object_name:
- warehouse_receiving_discrepancy

required_fields:
- discrepancy_id
- company_id
- purchase_receiving_operation_id
- purchase_order_id
- purchase_order_line_id_or_null
- discrepancy_type
- severity
- expected_quantity_or_null
- observed_quantity_or_null
- quantity_uom_or_null
- summary
- detected_at
- detected_by
- resolution_status
- linked_purchase_feedback_reference_or_null
- lineage_reference

discrepancy_type_examples:
- shortage
- overage
- damaged
- wrong_item
- missing_document
- lot_serial_mismatch
- quality_hold_required
- supplier_label_issue

allowed_resolution_status:
- open
- notified_purchase
- under_review
- resolved
- closed
- cancelled

rules:
- discrepancy is warehouse observation truth
- purchase decides supplier commercial action
- inventory decides stock effect after accepted confirmation
- quality decides inspection disposition where applicable

# ============================================================
# 5. WAREHOUSE TO INVENTORY RECEIPT CONFIRMATION
# ============================================================

handoff_object_name:
- warehouse_to_inventory_purchase_receipt_confirmation

required_fields:
- confirmation_id
- company_id
- source_module
- target_module
- purchase_receiving_operation_id
- receiving_expectation_id
- purchase_order_id
- supplier_id
- warehouse_id
- confirmation_line_set
- quality_required_flag
- quality_result_reference_or_null
- confirmation_status
- confirmed_at
- confirmed_by
- lineage_reference

confirmation_line_required_fields:
- confirmation_line_id
- purchase_order_line_id
- item_id_or_service_id
- confirmed_quantity_for_inventory
- quantity_uom
- warehouse_id
- bin_id_or_null
- lot_id_or_null
- serial_id_set_or_null
- stock_status_suggestion
- quality_result_reference_or_null
- discrepancy_reference_or_null

allowed_confirmation_status:
- building
- validation_pending
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- superseded
- cancelled

rules:
- target_module must be 12.inventory
- sent confirmation is not stock ledger truth until accepted by 12
- rejected confirmation must retain reason and evidence
- correction requires successor confirmation

# ============================================================
# 6. QUALITY HANDOFF
# ============================================================

quality_handoff_required_when:
- quality_inspection_required_flag = true
- supplier/item policy requires inspection
- damaged / contamination / compliance issue detected
- lot / serial condition requires quality decision

quality_rules:
- warehouse may hold goods physically
- 17 owns inspection result and disposition
- inventory stock status must reference quality result where required
- purchase may use quality rejection for supplier claim/return

# ============================================================
# 7. FEEDBACK TO PURCHASE
# ============================================================

allowed_feedback_to_purchase:
- receiving accepted by warehouse
- receiving rejected by warehouse
- discrepancy detected
- shortage / overage observed
- damaged goods observed
- quality handoff required
- receiving completed
- inventory rejected confirmation

rules:
- purchase may update PO receipt status from accepted receipt references
- purchase may open supplier claim or return
- warehouse cannot change PO commercial terms directly

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- receiving expectation treated as physical receipt
- observed quantity treated as inventory balance without 12 intake
- warehouse discrepancy editing PO order quantity directly
- warehouse quality hold treated as quality rejection
- warehouse receiving completion treated as invoice approval
- BI dashboard completing receiving operation

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If it is physical receiving observation, 13 owns it.
- If it is PO commercial truth, 10 owns it.
- If it is stock ledger receipt, 12 owns it.
- If it is inspection decision, 17 owns it.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- purchase receiving intake fixed
- receiving operation truth fixed
- discrepancy ownership fixed
- warehouse to inventory receipt confirmation fixed
- purchase / quality feedback boundaries fixed

# ============================================================
