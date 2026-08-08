# ============================================================
# INVENTORY STOCK TRUTH AND WAREHOUSE HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 12.inventory
related_modules:
- 13.warehouse
- 14.logistics
- 17.quality
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define inventory stock truth, inventory ledger ownership, and handoff boundaries
with warehouse and logistics modules.

canonical_role:
- stock quantity / stock ledger / availability truth

# ============================================================
# 1. CORE INVENTORY OBJECTS
# ============================================================

core_objects:
- inventory_item_balance
- inventory_stock_ledger
- inventory_reservation
- inventory_allocation
- inventory_availability_snapshot
- inventory_stock_status
- inventory_lot_serial_balance
- inventory_adjustment
- inventory_transfer
- inventory_count_result_acceptance
- inventory_movement_request
- inventory_movement_confirmation_intake
- inventory_issue_event
- inventory_receipt_event

# ============================================================
# 2. INVENTORY BALANCE
# ============================================================

object_name:
- inventory_item_balance

meaning:
- canonical stock balance by item / location / lot / serial / status grain

required_fields:
- inventory_balance_id
- company_id
- item_id
- location_id
- warehouse_id_or_null
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- stock_status
- on_hand_quantity
- reserved_quantity
- allocated_quantity
- available_quantity
- quantity_uom
- last_ledger_event_id
- balance_as_of_at
- version_id
- updated_at
- updated_by_system_actor

rules:
- balance is derived / controlled by stock ledger events
- available_quantity must be explainable from on_hand / reserved / allocated / status rules
- physical warehouse task alone is not final inventory balance truth until accepted into inventory ledger

# ============================================================
# 3. STOCK LEDGER
# ============================================================

object_name:
- inventory_stock_ledger

meaning:
- immutable stock movement ledger

required_fields:
- stock_ledger_event_id
- company_id
- event_type
- item_id
- location_id
- warehouse_id_or_null
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
- recorded_by_system_actor
- reversal_of_event_id_or_null
- correction_reason_or_null
- lineage_reference

event_type_examples:
- receipt
- issue
- transfer_in
- transfer_out
- adjustment_plus
- adjustment_minus
- reservation_create
- reservation_release
- allocation_create
- allocation_release
- status_change
- cycle_count_adjustment
- return_receipt

immutability_rules:
- ledger event is immutable
- correction requires reversal or correction event
- deletion is forbidden
- source reference must remain queryable

# ============================================================
# 4. RESERVATION / ALLOCATION
# ============================================================

object_name:
- inventory_reservation

required_fields:
- reservation_id
- company_id
- demand_source_module
- demand_source_object_type
- demand_source_object_id
- item_id
- location_id_or_null
- quantity
- quantity_uom
- reservation_status
- priority_class
- requested_fulfillment_date_or_null
- created_at
- released_at_or_null
- lineage_reference

allowed_reservation_status:
- requested
- active
- partially_released
- released
- expired
- cancelled

object_name:
- inventory_allocation

required_fields:
- allocation_id
- company_id
- reservation_id_or_null
- item_id
- warehouse_id
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- allocated_quantity
- quantity_uom
- allocation_status
- warehouse_task_reference_or_null
- created_at
- released_at_or_null
- lineage_reference

allowed_allocation_status:
- proposed
- allocated
- sent_to_warehouse
- partially_picked
- picked
- released
- cancelled
- short

rules:
- allocation is inventory-level commitment
- warehouse picking task remains 13 truth
- picked status requires warehouse confirmation evidence
- allocation does not equal delivery completion

# ============================================================
# 5. INVENTORY TO WAREHOUSE HANDOFF
# ============================================================

handoff_object_name:
- inventory_to_warehouse_movement_request

meaning:
- request from inventory side to warehouse side to execute physical movement

required_fields:
- movement_request_id
- company_id
- source_module
- target_module
- request_type
- item_id
- warehouse_id
- from_location_id_or_null
- to_location_id_or_null
- from_bin_id_or_null
- to_bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- requested_quantity
- quantity_uom
- priority_class
- requested_execution_window_start_or_null
- requested_execution_window_end_or_null
- source_reservation_id_or_null
- source_allocation_id_or_null
- request_status
- created_at
- created_by
- lineage_reference

request_type_examples:
- putaway
- replenish
- pick
- move
- count
- quarantine_move
- release_from_hold
- transfer_prepare

allowed_request_status:
- draft
- requested
- accepted_by_warehouse
- rejected_by_warehouse
- in_progress
- confirmed_by_warehouse
- cancelled
- superseded

rules:
- 13 decides warehouse task feasibility and execution
- 12 tracks inventory-side request and resulting stock effect
- confirmed_by_warehouse is evidence, not automatic ledger mutation unless accepted by inventory workflow

# ============================================================
# 6. WAREHOUSE TO INVENTORY CONFIRMATION INTAKE
# ============================================================

intake_object_name:
- warehouse_to_inventory_operation_confirmation

required_fields:
- confirmation_id
- company_id
- source_module
- target_module
- warehouse_task_id
- movement_request_id_or_null
- warehouse_operation_type
- item_id
- warehouse_id
- from_location_id_or_null
- to_location_id_or_null
- from_bin_id_or_null
- to_bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- confirmed_quantity
- quantity_uom
- confirmation_status
- confirmed_at
- confirmed_by
- exception_reference_or_null
- lineage_reference

allowed_confirmation_status:
- received
- validation_pending
- accepted_to_inventory
- rejected_by_inventory
- superseded

acceptance_requires:
- source_module = 13.warehouse
- target_module = 12.inventory
- warehouse_task_id present
- item / location / quantity resolvable
- quantity_uom resolvable
- lineage present

reject_reason_codes:
- INVALID_SCHEMA
- ITEM_UNRESOLVABLE
- LOCATION_UNRESOLVABLE
- QUANTITY_MISMATCH
- UOM_UNRESOLVABLE
- MISSING_WAREHOUSE_TASK
- MISSING_LINEAGE
- ILLEGAL_SOURCE_MODULE
- DUPLICATE_CONFIRMATION

rules:
- accepted confirmation may create stock ledger event
- rejected confirmation does not update stock ledger
- correction requires successor confirmation or inventory correction workflow

# ============================================================
# 7. QUALITY BOUNDARY
# ============================================================

quality_rules:
- inspection decision belongs to 17.quality
- inventory stock status may reflect quality disposition
- quarantine / blocked / released status changes require quality reference where applicable
- warehouse may physically move goods to hold area, but quality acceptance truth stays in 17

# ============================================================
# 8. LOGISTICS BOUNDARY
# ============================================================

logistics_rules:
- 14 may notify delivery status
- delivery completion does not automatically change stock ledger unless defined return / custody workflow requires it
- inventory issue should be based on inventory / warehouse shipment workflow, not proof of delivery alone
- logistics exception may trigger investigation, not direct stock correction

# ============================================================
# 9. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- inventory balance snapshot
- stock ledger snapshot
- reservation / allocation status snapshot
- stock status snapshot
- aging / availability snapshot
- adjustment summary
- cycle count variance summary

rules:
- 60 consumes snapshots only
- 60 may not correct stock
- 60 dashboard values are not inventory ledger events

# ============================================================
# 10. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- warehouse task completion directly treated as final inventory balance without intake validation
- logistics POD directly decrementing inventory
- BI dashboard directly correcting stock
- audit finding directly adjusting stock
- quality result omitted when stock status depends on inspection
- deleting stock ledger events
- editing completed stock ledger events in place

# ============================================================
# 11. DECISION TEST
# ============================================================

decision_test:
- If it changes or explains stock quantity, 12 owns it.
- If it explains physical warehouse work, 13 owns it.
- If it explains transport or delivery, 14 owns it.
- If it explains quality decision, 17 owns it.

# ============================================================
# 12. COMPLETION STATE
# ============================================================

completion_state:
- inventory stock truth fixed
- stock ledger immutability fixed
- warehouse request / confirmation handoff fixed
- quality / logistics / BI boundaries fixed

# ============================================================
