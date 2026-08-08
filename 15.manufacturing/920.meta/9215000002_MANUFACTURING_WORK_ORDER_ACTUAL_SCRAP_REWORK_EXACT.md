# ============================================================
# MANUFACTURING WORK ORDER / ACTUAL / SCRAP / REWORK EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 15.manufacturing
related_modules:
- 16.production-planning
- 17.quality
- 12.inventory
- 13.warehouse
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define manufacturing execution truth for production orders, work orders,
operation actuals, material consumption observations, scrap, rework, and
handoffs to quality, inventory, costing, and BI.

canonical_role:
- manufacturing execution truth

# ============================================================
# 1. CORE MANUFACTURING OBJECTS
# ============================================================

core_objects:
- manufacturing_release_intake
- production_order
- work_order
- production_operation
- production_operation_actual
- manufacturing_material_consumption_observation
- manufacturing_output_confirmation
- manufacturing_scrap_event
- manufacturing_rework_event
- manufacturing_downtime_event
- manufacturing_exception
- manufacturing_actual_package
- manufacturing_to_quality_inspection_request
- manufacturing_to_inventory_production_confirmation
- manufacturing_to_costing_actual_input_package

# ============================================================
# 2. PLANNING RELEASE INTAKE
# ============================================================

accepted_input_object:
- planning_to_manufacturing_release_package

meaning:
- released execution basis from production planning

required_fields:
- release_package_id
- company_id
- source_module
- target_module
- planning_run_id
- planning_basis_snapshot_id
- production_plan_reference
- item_id
- plant_id
- planned_quantity
- quantity_uom
- planned_start_at
- planned_end_at
- routing_reference_or_null
- bom_reference_or_null
- material_requirement_reference_set_or_null
- capacity_requirement_reference_set_or_null
- release_status
- lineage_reference

acceptance_requires:
- source_module = 16.production-planning
- target_module = 15.manufacturing
- released status present
- item/plant/quantity/uom resolvable
- planning lineage present

reject_reason_codes:
- INVALID_SCHEMA
- PLAN_NOT_RELEASED
- ITEM_UNRESOLVABLE
- PLANT_UNRESOLVABLE
- QUANTITY_INVALID
- ROUTING_UNRESOLVABLE
- BOM_UNRESOLVABLE
- MISSING_LINEAGE
- DUPLICATE_RELEASE

rules:
- release package is not execution actual
- 15 may create production/work order from accepted release
- planning truth remains in 16

# ============================================================
# 3. PRODUCTION ORDER
# ============================================================

object_name:
- production_order

meaning:
- canonical manufacturing execution order

required_fields:
- production_order_id
- company_id
- production_order_number
- source_release_package_id_or_null
- item_id
- plant_id
- planned_quantity
- actual_completed_quantity_or_null
- quantity_uom
- production_order_status
- planned_start_at_or_null
- planned_end_at_or_null
- actual_start_at_or_null
- actual_end_at_or_null
- routing_reference_or_null
- bom_reference_or_null
- work_order_set_reference
- quality_required_flag
- inventory_confirmation_reference_or_null
- costing_input_package_reference_or_null
- lineage_reference

allowed_production_order_status:
- draft
- released
- in_progress
- partially_completed
- completed_pending_quality
- completed_pending_inventory
- completed
- closed
- cancelled
- suspended
- superseded

rules:
- production order belongs to 15
- production completion does not equal unrestricted inventory receipt when quality is required
- production order does not own cost rollup
- production order does not own stock ledger

# ============================================================
# 4. WORK ORDER / OPERATION
# ============================================================

object_name:
- work_order

required_fields:
- work_order_id
- company_id
- production_order_id
- work_center_id_or_null
- operation_sequence_reference_or_null
- work_order_status
- planned_start_at_or_null
- planned_end_at_or_null
- actual_start_at_or_null
- actual_end_at_or_null
- assigned_resource_reference_or_null
- operation_set_reference
- lineage_reference

allowed_work_order_status:
- created
- released
- in_progress
- paused
- completed
- completed_with_exception
- cancelled
- superseded

object_name:
- production_operation_actual

required_fields:
- operation_actual_id
- company_id
- production_order_id
- work_order_id
- operation_code_or_sequence
- work_center_id_or_null
- actual_start_at
- actual_end_at_or_null
- actual_labor_minutes_or_null
- actual_machine_minutes_or_null
- actual_output_quantity_or_null
- actual_scrap_quantity_or_null
- actual_rework_quantity_or_null
- operation_status
- recorded_by_or_system_actor
- lineage_reference

allowed_operation_status:
- started
- in_progress
- paused
- completed
- completed_with_exception
- cancelled
- corrected
- superseded

rules:
- operation actual is execution truth
- correction requires successor/correction actual event
- costing may consume actual minutes/quantities but does not own execution actual

# ============================================================
# 5. MATERIAL CONSUMPTION OBSERVATION
# ============================================================

object_name:
- manufacturing_material_consumption_observation

meaning:
- manufacturing-side observation/request basis for component consumption

required_fields:
- consumption_observation_id
- company_id
- production_order_id
- work_order_id_or_null
- component_item_id
- observed_quantity
- quantity_uom
- source_location_reference_or_null
- lot_id_or_null
- serial_id_set_or_null
- observation_status
- observed_at
- observed_by_or_system_actor
- inventory_issue_reference_or_null
- lineage_reference

allowed_observation_status:
- observed
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- manufacturing observes consumption
- inventory owns stock issue ledger
- rejection by inventory must be preserved
- consumption observation is not final inventory issue

# ============================================================
# 6. OUTPUT CONFIRMATION
# ============================================================

object_name:
- manufacturing_output_confirmation

meaning:
- manufacturing-side confirmation of produced output

required_fields:
- output_confirmation_id
- company_id
- production_order_id
- item_id
- plant_id
- produced_quantity
- quantity_uom
- lot_id_or_null
- serial_id_set_or_null
- quality_required_flag
- output_status
- confirmed_at
- confirmed_by_or_system_actor
- quality_request_reference_or_null
- inventory_confirmation_reference_or_null
- lineage_reference

allowed_output_status:
- draft
- confirmed_pending_quality
- confirmed_pending_inventory
- sent_to_quality
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- output confirmation belongs to 15
- quality-required output must go through 17 disposition
- inventory owns finished goods receipt ledger
- output confirmation does not calculate cost

# ============================================================
# 7. SCRAP EVENT
# ============================================================

object_name:
- manufacturing_scrap_event

meaning:
- execution-side scrap event

required_fields:
- scrap_event_id
- company_id
- production_order_id
- work_order_id_or_null
- operation_actual_id_or_null
- item_id
- scrap_quantity
- quantity_uom
- scrap_reason_code
- scrap_status
- quality_nonconformance_reference_or_null
- inventory_effect_reference_or_null
- costing_effect_reference_or_null
- recorded_at
- recorded_by
- lineage_reference

scrap_reason_examples:
- process_defect
- material_defect
- setup_loss
- machine_issue
- operator_error
- quality_rejection
- trial_run
- unknown

allowed_scrap_status:
- recorded
- quality_review_required
- accepted_as_scrap
- sent_to_inventory
- accepted_by_inventory
- sent_to_costing
- closed
- corrected
- cancelled
- superseded

rules:
- scrap event belongs to 15
- quality owns defect/nonconformance/disposition when required
- inventory owns stock effect
- costing owns cost effect
- accounting owns journal

# ============================================================
# 8. REWORK EVENT
# ============================================================

object_name:
- manufacturing_rework_event

meaning:
- execution-side rework event or rework order basis

required_fields:
- rework_event_id
- company_id
- original_production_order_id
- rework_production_order_id_or_null
- quality_disposition_reference_or_null
- item_id
- rework_quantity
- quantity_uom
- rework_reason
- rework_status
- planned_rework_action_or_null
- actual_rework_result_or_null
- inventory_effect_reference_or_null
- costing_effect_reference_or_null
- recorded_at
- lineage_reference

allowed_rework_status:
- requested
- approved
- in_progress
- completed
- failed
- returned_to_quality
- closed
- cancelled
- superseded

rules:
- rework execution belongs to 15
- quality may require/recommend rework but does not execute it
- rework cost belongs to 18
- rework stock effect belongs to 12
- original order history must not be edited in place

# ============================================================
# 9. DOWNTIME / EXCEPTION
# ============================================================

object_name:
- manufacturing_downtime_event

required_fields:
- downtime_event_id
- company_id
- plant_id
- work_center_id_or_null
- production_order_id_or_null
- work_order_id_or_null
- downtime_reason
- downtime_start_at
- downtime_end_at_or_null
- downtime_minutes_or_null
- severity
- capacity_impact_flag
- planning_feedback_reference_or_null
- costing_effect_reference_or_null
- lineage_reference

object_name:
- manufacturing_exception

required_fields:
- manufacturing_exception_id
- company_id
- production_order_id_or_null
- work_order_id_or_null
- exception_type
- severity
- exception_summary
- detected_at
- resolution_status
- linked_quality_reference_or_null
- linked_inventory_reference_or_null
- linked_planning_feedback_reference_or_null
- lineage_reference

rules:
- downtime/exception belongs to manufacturing execution
- planning may receive feedback
- costing may consume cost impact
- BI may visualize

# ============================================================
# 10. MANUFACTURING TO QUALITY INSPECTION REQUEST
# ============================================================

handoff_object_name:
- manufacturing_to_quality_inspection_request

required_fields:
- inspection_request_handoff_id
- company_id
- source_module
- target_module
- production_order_id
- output_confirmation_id_or_null
- item_id
- lot_id_or_null
- serial_id_set_or_null
- quantity
- quantity_uom
- inspection_reason
- quality_required_flag
- handoff_status
- created_at
- lineage_reference

allowed_handoff_status:
- building
- handoff_ready
- sent_to_quality
- accepted_by_quality
- rejected_by_quality
- cancelled
- superseded

rules:
- source_module must be 15.manufacturing
- target_module must be 17.quality
- quality owns result/disposition
- manufacturing request is not quality result

# ============================================================
# 11. MANUFACTURING TO INVENTORY PRODUCTION CONFIRMATION
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_production_confirmation

required_fields:
- production_confirmation_id
- company_id
- source_module
- target_module
- production_order_id
- output_confirmation_id
- quality_disposition_reference_or_null
- item_id
- plant_id
- warehouse_id_or_location_id_or_null
- lot_id_or_null
- serial_id_set_or_null
- confirmed_quantity_for_inventory
- quantity_uom
- suggested_stock_status
- handoff_status
- created_at
- lineage_reference

allowed_handoff_status:
- building
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- target_module must be 12.inventory
- accepted confirmation may create stock ledger receipt
- manufacturing does not write stock ledger
- quality disposition required when quality_required_flag applies

# ============================================================
# 12. MANUFACTURING TO COSTING ACTUAL INPUT
# ============================================================

handoff_object_name:
- manufacturing_to_costing_actual_input_package

required_fields:
- manufacturing_actual_input_package_id
- company_id
- source_module
- target_module
- production_order_id
- work_order_set_reference
- operation_actual_set_reference
- material_consumption_observation_set_reference
- output_confirmation_set_reference
- scrap_event_set_reference
- rework_event_set_reference
- downtime_event_set_reference
- quality_reference_set_or_null
- package_status
- created_at
- lineage_reference

allowed_package_status:
- building
- handoff_ready
- sent_to_costing
- accepted_by_costing
- rejected_by_costing
- corrected
- cancelled
- superseded

rules:
- costing consumes actuals
- costing does not rewrite manufacturing actuals
- package correction requires successor package or corrected source events

# ============================================================
# 13. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- production order status snapshot
- work order actual snapshot
- output confirmation snapshot
- scrap/rework snapshot
- downtime/exception snapshot
- manufacturing actual package snapshot

rules:
- BI projection does not correct execution actual
- BI dashboard does not complete work order

# ============================================================
# 14. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- planning release treated as manufacturing actual
- production completion treated as quality acceptance
- manufacturing output directly creating unrestricted inventory without quality gate
- manufacturing observation directly writing stock ledger
- costing modifying manufacturing actual
- accounting journal modifying production order
- BI dashboard completing work order
- rework overwriting original execution history in place

# ============================================================
# 15. DECISION TEST
# ============================================================

decision_test:
- If it is production/work order execution actual, 15 owns it.
- If it is production plan/schedule/MRP/CRP, 16 owns it.
- If it is quality result/disposition, 17 owns it.
- If it is stock ledger, 12 owns it.
- If it is cost calculation, 18 owns it.

# ============================================================
# 16. COMPLETION STATE
# ============================================================

completion_state:
- manufacturing execution exact design fixed
- production order/work order actual fixed
- scrap/rework/downtime ownership fixed
- quality/inventory/costing handoffs fixed
- forbidden shortcuts fixed

# ============================================================
