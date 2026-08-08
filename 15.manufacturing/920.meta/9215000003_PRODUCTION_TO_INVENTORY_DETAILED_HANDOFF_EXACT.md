# ============================================================
# PRODUCTION TO INVENTORY DETAILED HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 15.manufacturing
target_module: 12.inventory
related_modules:
- 17.quality
- 18.costing
- 60.business-intelligence

purpose:
Define exact manufacturing-to-inventory handoff for finished goods receipt,
component consumption, scrap, rework, and inventory status effects without
allowing manufacturing to own stock ledger truth.

canonical_role:
- 15.manufacturing owns production execution evidence
- 12.inventory owns stock ledger / stock balance truth

# ============================================================
# 1. HANDOFF TYPES
# ============================================================

handoff_types:
- production_finished_goods_receipt_basis
- production_component_consumption_basis
- production_scrap_inventory_effect_basis
- production_rework_inventory_effect_basis
- production_return_to_stock_basis
- production_correction_inventory_basis

rules:
- every handoff is evidence/basis only
- inventory accepts/rejects and creates ledger effects
- quality disposition must be referenced when quality gate applies

# ============================================================
# 2. FINISHED GOODS RECEIPT BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_production_receipt_basis

meaning:
- manufacturing-side basis for inventory to record finished goods receipt

required_fields:
- production_receipt_basis_id
- company_id
- source_module
- target_module
- production_order_id
- work_order_id_or_null
- output_confirmation_id
- item_id
- plant_id
- warehouse_id_or_location_id
- lot_id_or_null
- serial_id_set_or_null
- completed_quantity
- quantity_uom
- quality_required_flag
- quality_disposition_reference_or_null
- suggested_stock_status
- receipt_basis_status
- created_at
- created_by_or_system_actor
- lineage_reference

allowed_receipt_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

acceptance_preconditions_for_inventory:
- source_module = 15.manufacturing
- target_module = 12.inventory
- production_order_id present
- output_confirmation_id present
- item / location / quantity / uom resolvable
- quality disposition present when quality_required_flag = true
- lineage_reference present

rules:
- handoff_ready means manufacturing evidence is ready
- accepted_by_inventory means inventory has accepted basis, not that manufacturing owns ledger
- unrestricted stock status is forbidden when required quality disposition is missing

# ============================================================
# 3. COMPONENT CONSUMPTION BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_component_consumption_basis

meaning:
- manufacturing-side observation/basis for inventory component issue

required_fields:
- component_consumption_basis_id
- company_id
- source_module
- target_module
- production_order_id
- work_order_id_or_null
- operation_actual_id_or_null
- component_item_id
- plant_id
- source_warehouse_id_or_location_id
- source_bin_id_or_null
- lot_id_or_null
- serial_id_set_or_null
- observed_consumed_quantity
- quantity_uom
- consumption_reason
- consumption_basis_status
- observed_at
- observed_by_or_system_actor
- lineage_reference

consumption_reason_examples:
- normal_production
- setup_loss
- scrap
- rework
- trial_run
- correction
- manual_adjustment_request

allowed_consumption_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- corrected
- cancelled
- superseded

rules:
- manufacturing observes consumption
- inventory creates component issue ledger
- rejected consumption must be corrected through successor basis or inventory workflow
- consumption basis does not directly reduce stock

# ============================================================
# 4. SCRAP INVENTORY EFFECT BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_scrap_effect_basis

required_fields:
- scrap_effect_basis_id
- company_id
- source_module
- target_module
- scrap_event_id
- production_order_id
- item_id
- plant_id
- location_id_or_null
- scrap_quantity
- quantity_uom
- scrap_reason_code
- quality_nonconformance_reference_or_null
- quality_disposition_reference_or_null
- suggested_inventory_effect
- basis_status
- created_at
- lineage_reference

suggested_inventory_effect_examples:
- scrap_issue
- blocked_stock_move
- quarantine_stock_move
- return_to_component_stock
- no_inventory_effect

rules:
- manufacturing owns scrap event
- inventory owns stock effect
- quality owns defect/disposition where required
- costing owns cost effect

# ============================================================
# 5. REWORK INVENTORY EFFECT BASIS
# ============================================================

handoff_object_name:
- manufacturing_to_inventory_rework_effect_basis

required_fields:
- rework_effect_basis_id
- company_id
- source_module
- target_module
- rework_event_id
- original_production_order_id
- rework_production_order_id_or_null
- item_id
- rework_quantity
- quantity_uom
- quality_disposition_reference_or_null
- suggested_inventory_effect
- basis_status
- created_at
- lineage_reference

suggested_inventory_effect_examples:
- move_to_rework_stock
- move_from_rework_to_available
- move_to_quarantine
- issue_to_rework_order
- no_inventory_effect

rules:
- rework event belongs to 15
- inventory stock status/effect belongs to 12
- quality disposition may be required before release

# ============================================================
# 6. INVENTORY ACCEPTANCE / REJECTION FEEDBACK
# ============================================================

feedback_object_name:
- inventory_to_manufacturing_inventory_effect_feedback

required_fields:
- inventory_effect_feedback_id
- company_id
- source_module
- target_module
- source_basis_object_type
- source_basis_object_id
- inventory_ledger_event_id_or_null
- inventory_receipt_or_issue_event_id_or_null
- feedback_status
- rejection_reason_code_or_null
- rejection_detail_or_null
- feedback_at
- lineage_reference

allowed_feedback_status:
- accepted_and_recorded
- accepted_pending_quality_or_status
- rejected
- corrected
- reversed
- superseded

rules:
- feedback references inventory result
- manufacturing may update execution status from feedback
- manufacturing may not alter inventory result

# ============================================================
# 7. CORRECTION / REVERSAL
# ============================================================

correction_rules:
- manufacturing basis cannot be edited after accepted_by_inventory
- correction requires successor basis
- inventory ledger correction requires 12 reversal/correction event
- original production evidence remains traceable
- quality/costing/accounting must be notified if correction affects them

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- manufacturing receipt basis directly becoming stock ledger
- component consumption basis directly reducing inventory
- scrap event directly posting scrap ledger without inventory acceptance
- rework event directly moving stock status
- missing quality disposition while setting unrestricted available stock
- BI dashboard correcting production receipt quantity

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- production-to-inventory detailed handoff fixed
- finished goods receipt basis fixed
- component consumption basis fixed
- scrap/rework inventory effect basis fixed
- inventory feedback and correction rules fixed

# ============================================================
