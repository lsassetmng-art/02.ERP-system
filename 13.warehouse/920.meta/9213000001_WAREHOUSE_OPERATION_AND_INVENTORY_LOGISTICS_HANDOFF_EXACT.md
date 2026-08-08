# ============================================================
# WAREHOUSE OPERATION AND INVENTORY / LOGISTICS HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 13.warehouse
related_modules:
- 12.inventory
- 14.logistics
- 17.quality
- 60.business-intelligence

purpose:
Define warehouse operation truth and the exact handoff boundaries with inventory
and logistics.

canonical_role:
- physical warehouse operation truth

# ============================================================
# 1. CORE WAREHOUSE OBJECTS
# ============================================================

core_objects:
- warehouse_receiving_operation
- warehouse_putaway_task
- warehouse_replenishment_task
- warehouse_pick_task
- warehouse_pack_task
- warehouse_stage_task
- warehouse_shipping_operation
- warehouse_internal_move_task
- warehouse_cycle_count_task
- warehouse_exception
- warehouse_task_assignment
- warehouse_operation_confirmation
- warehouse_shipping_to_logistics_handoff

# ============================================================
# 2. WAREHOUSE TASK
# ============================================================

object_name:
- warehouse_task

meaning:
- physical work task inside warehouse

required_fields:
- warehouse_task_id
- company_id
- warehouse_id
- task_type
- task_status
- item_id_or_null
- from_bin_id_or_null
- to_bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- requested_quantity_or_null
- confirmed_quantity_or_null
- quantity_uom_or_null
- source_module
- source_object_type
- source_object_id
- assigned_to_or_null
- assigned_at_or_null
- started_at_or_null
- completed_at_or_null
- exception_reference_or_null
- lineage_reference

task_type_examples:
- receive
- putaway
- replenish
- pick
- pack
- stage
- ship
- internal_move
- cycle_count
- quarantine_move
- hold_release_move

allowed_task_status:
- created
- assigned
- in_progress
- completed
- completed_with_exception
- cancelled
- rejected
- superseded

rules:
- task completion is warehouse operation truth
- task completion may emit confirmation to inventory or logistics
- task completion alone is not final inventory ledger truth

# ============================================================
# 3. RECEIVING OPERATION
# ============================================================

object_name:
- warehouse_receiving_operation

required_fields:
- receiving_operation_id
- company_id
- warehouse_id
- source_document_module
- source_document_type
- source_document_id
- received_item_lines
- receiving_status
- received_at_or_null
- received_by_or_null
- quality_required_flag
- quality_reference_or_null
- inventory_confirmation_reference_or_null
- lineage_reference

allowed_receiving_status:
- expected
- receiving_in_progress
- received_pending_quality
- received_pending_inventory
- confirmed_to_inventory
- rejected
- cancelled

rules:
- 13 owns receiving operation
- 17 owns quality decision where required
- 12 owns stock receipt ledger after accepted confirmation
- received_pending_quality cannot become available stock without quality/inventory workflow where required

# ============================================================
# 4. PICK / PACK / SHIP OPERATION
# ============================================================

object_name:
- warehouse_outbound_operation

required_fields:
- outbound_operation_id
- company_id
- warehouse_id
- demand_source_module
- demand_source_object_type
- demand_source_object_id
- inventory_allocation_reference_or_null
- pick_task_set
- pack_task_set
- stage_task_set
- shipping_operation_reference_or_null
- outbound_status
- short_pick_flag
- exception_reference_set
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
- pick / pack / stage are warehouse truth
- shipped_from_warehouse is warehouse outbound handoff evidence
- customer delivery completion belongs to 14.logistics
- inventory issue must be recorded through 12 inventory workflow

# ============================================================
# 5. WAREHOUSE TO INVENTORY CONFIRMATION
# ============================================================

handoff_object_name:
- warehouse_to_inventory_operation_confirmation

emitted_for:
- receiving confirmation
- putaway confirmation
- internal move confirmation
- pick confirmation
- ship confirmation
- cycle count observation
- quarantine / hold / release physical move

required_fields:
- confirmation_id
- company_id
- source_module
- target_module
- warehouse_task_id
- warehouse_operation_type
- item_id
- warehouse_id
- from_bin_id_or_null
- to_bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- confirmed_quantity
- quantity_uom
- confirmed_at
- confirmed_by
- exception_reference_or_null
- lineage_reference

rules:
- source_module must be 13.warehouse
- target_module must be 12.inventory
- inventory may accept or reject confirmation
- warehouse does not write stock ledger directly

# ============================================================
# 6. WAREHOUSE TO LOGISTICS HANDOFF
# ============================================================

handoff_object_name:
- warehouse_shipping_to_logistics_handoff

meaning:
- warehouse confirms shipment readiness or outbound transfer to logistics

required_fields:
- handoff_id
- company_id
- source_module
- target_module
- warehouse_id
- outbound_operation_id
- shipping_operation_id
- shipment_unit_set
- package_set
- staged_location_id_or_null
- handoff_status
- handoff_ready_at
- handed_off_at_or_null
- handed_off_by_or_null
- carrier_requirement_or_null
- route_requirement_or_null
- temperature_requirement_or_null
- hazardous_material_flag
- document_reference_set
- lineage_reference

shipment_unit_required_fields:
- shipment_unit_id
- package_id_or_null
- item_line_reference_set
- quantity_summary
- weight_or_null
- volume_or_null
- handling_instruction_or_null

allowed_handoff_status:
- building
- handoff_ready
- handed_off_to_logistics
- accepted_by_logistics
- rejected_by_logistics
- cancelled
- superseded

rules:
- handoff_ready means warehouse shipment is ready for transport planning or dispatch
- handed_off_to_logistics does not mean customer delivery completed
- 14 accepts or rejects logistics intake
- 13 remains owner of warehouse shipping operation truth

# ============================================================
# 7. CYCLE COUNT BOUNDARY
# ============================================================

cycle_count_rules:
- 13 owns physical counting task and observation
- 12 owns approved inventory adjustment
- 51.audit may audit cycle count controls
- discrepancy observation is not final stock correction until 12 accepts adjustment workflow

# ============================================================
# 8. QUALITY BOUNDARY
# ============================================================

quality_rules:
- 13 may move goods to quarantine / inspection area
- 17 owns inspection result and disposition
- 12 updates stock status from approved quality disposition
- 13 cannot decide product quality acceptance by warehouse task alone

# ============================================================
# 9. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- warehouse task status snapshot
- receiving operation snapshot
- putaway performance snapshot
- picking accuracy snapshot
- packing / staging / shipping performance snapshot
- warehouse exception snapshot
- cycle count operation snapshot

rules:
- BI projection does not change warehouse task status
- BI dashboard does not complete warehouse tasks
- BI dashboard does not correct inventory

# ============================================================
# 10. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- warehouse completion directly mutating stock ledger without 12 acceptance
- warehouse shipping confirmation treated as delivery proof
- warehouse deciding quality acceptance
- warehouse cycle count observation directly changing stock balance without inventory adjustment workflow
- logistics carrier tracking completing warehouse pick task
- BI dashboard completing warehouse task

# ============================================================
# 11. DECISION TEST
# ============================================================

decision_test:
- If it is physical warehouse work, 13 owns it.
- If it is stock quantity truth, 12 owns it.
- If it is transport / delivery truth, 14 owns it.
- If it is quality disposition, 17 owns it.

# ============================================================
# 12. COMPLETION STATE
# ============================================================

completion_state:
- warehouse operation truth fixed
- warehouse to inventory confirmation fixed
- warehouse to logistics handoff fixed
- receiving / picking / cycle count boundaries fixed

# ============================================================
