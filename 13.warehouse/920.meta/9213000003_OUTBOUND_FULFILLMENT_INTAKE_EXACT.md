# ============================================================
# OUTBOUND FULFILLMENT INTAKE EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 13.warehouse
related_modules:
- 12.inventory
- 04.order-management
- 14.logistics

purpose:
Define warehouse outbound fulfillment intake from inventory allocation and the
handoff to logistics without taking over stock ledger, order, or delivery truth.

canonical_role:
- physical outbound warehouse operation truth

# ============================================================
# 1. ACCEPTED INPUT
# ============================================================

accepted_input_object:
- inventory_to_warehouse_fulfillment_request

acceptance_requires:
- source_module = 12.inventory
- target_module = 13.warehouse
- sales_order_id present
- allocation references present
- warehouse_id resolvable
- item / quantity / uom resolvable
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- ALLOCATION_UNRESOLVABLE
- WAREHOUSE_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- UOM_UNRESOLVABLE
- QUANTITY_INVALID
- MISSING_LINEAGE
- DUPLICATE_REQUEST

# ============================================================
# 2. OUTBOUND OPERATION
# ============================================================

object_name:
- warehouse_outbound_fulfillment_operation

required_fields:
- outbound_fulfillment_operation_id
- company_id
- warehouse_id
- fulfillment_request_id
- sales_order_id
- pick_task_set
- pack_task_set
- stage_task_set
- shipping_operation_reference_or_null
- outbound_status
- short_pick_flag
- exception_reference_set
- created_at
- lineage_reference

allowed_outbound_status:
- planned
- picking
- picked
- packing
- packed
- staged
- shipped_from_warehouse
- short
- cancelled
- superseded

rules:
- warehouse owns physical pick / pack / stage / ship-from-warehouse
- inventory owns stock issue
- logistics owns transport / delivery after handoff
- order management owns orchestration status

# ============================================================
# 3. PICK / PACK / SHIP TASKS
# ============================================================

task_required_fields:
- warehouse_task_id
- company_id
- warehouse_id
- task_type
- task_status
- sales_order_id
- sales_order_line_id_or_null
- item_id_or_null
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- requested_quantity_or_null
- confirmed_quantity_or_null
- quantity_uom_or_null
- assigned_to_or_null
- started_at_or_null
- completed_at_or_null
- exception_reference_or_null
- lineage_reference

task_type_examples:
- pick
- pack
- stage
- ship

allowed_task_status:
- created
- assigned
- in_progress
- completed
- completed_with_exception
- cancelled
- short
- superseded

# ============================================================
# 4. WAREHOUSE TO INVENTORY OUTBOUND CONFIRMATION
# ============================================================

handoff_object_name:
- warehouse_to_inventory_outbound_confirmation

required_fields:
- confirmation_id
- company_id
- source_module
- target_module
- outbound_fulfillment_operation_id
- fulfillment_request_id
- sales_order_id
- warehouse_id
- confirmation_line_set
- confirmation_status
- confirmed_at
- confirmed_by
- lineage_reference

confirmation_line_required_fields:
- confirmation_line_id
- sales_order_line_id
- item_id
- picked_quantity
- shipped_from_warehouse_quantity_or_null
- quantity_uom
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- exception_reference_or_null

allowed_confirmation_status:
- building
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- superseded
- cancelled

rules:
- target_module must be 12.inventory
- accepted confirmation may create inventory issue
- warehouse does not write stock ledger directly

# ============================================================
# 5. WAREHOUSE TO LOGISTICS HANDOFF
# ============================================================

handoff_object_name:
- warehouse_shipping_to_logistics_handoff

required_fields:
- handoff_id
- company_id
- source_module
- target_module
- outbound_fulfillment_operation_id
- sales_order_id
- shipment_unit_set
- package_set
- staged_location_id_or_null
- handoff_status
- handoff_ready_at
- handed_off_at_or_null
- carrier_requirement_or_null
- handling_instruction_or_null
- document_reference_set
- lineage_reference

allowed_handoff_status:
- building
- handoff_ready
- handed_off_to_logistics
- accepted_by_logistics
- rejected_by_logistics
- cancelled
- superseded

rules:
- handoff to logistics is not proof of delivery
- logistics may accept/reject shipment intake
- warehouse remains owner of ship-from-warehouse operation

# ============================================================
# 6. FEEDBACK TO ORDER MANAGEMENT
# ============================================================

allowed_feedback_to_order:
- pick started
- picked
- short pick
- packed
- staged
- shipped_from_warehouse
- warehouse exception

rules:
- order may update fulfillment orchestration status
- order may not rewrite warehouse task truth
- warehouse may not rewrite order line truth

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- warehouse picked status treated as customer delivery
- warehouse shipped status treated as invoice
- warehouse task directly changing order quantity
- warehouse task directly writing stock ledger
- logistics tracking completing warehouse pick task
- BI dashboard completing outbound operation

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_test:
- If it is physical outbound warehouse work, 13 owns it.
- If it is allocation or stock issue, 12 owns it.
- If it is order orchestration, 04 owns it.
- If it is transport/delivery, 14 owns it.
- If it is invoice, 05 owns it.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- outbound warehouse fulfillment fixed
- warehouse to inventory confirmation fixed
- warehouse to logistics handoff fixed
- order feedback boundary fixed

# ============================================================
