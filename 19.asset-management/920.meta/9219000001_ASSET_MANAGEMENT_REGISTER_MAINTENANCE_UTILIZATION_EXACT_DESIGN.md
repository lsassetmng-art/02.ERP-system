# ============================================================
# ASSET MANAGEMENT REGISTER / MAINTENANCE / UTILIZATION EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 19.asset-management
track: Track B
related_modules:
- 33.fixed-assets
- 10.purchase
- 12.inventory
- 13.warehouse
- 30.accounting
- 34.cash-management
- 60.business-intelligence

purpose:
Define operational asset management truth for asset register, custody,
location, maintenance planning, maintenance execution, utilization, downtime,
condition, and capitalization candidate handoff to fixed assets.

canonical_role:
- operational asset register / maintenance / utilization truth

# ============================================================
# 1. CORE ASSET MANAGEMENT OBJECTS
# ============================================================

core_objects:
- operational_asset_register
- operational_asset_component
- asset_assignment
- asset_location_custody
- maintenance_plan
- maintenance_schedule
- maintenance_work_order
- maintenance_execution_result
- maintenance_material_request
- maintenance_service_purchase_request
- asset_condition_record
- asset_utilization_record
- asset_downtime_event
- asset_lifecycle_event
- asset_capitalization_candidate_basis
- asset_to_fixed_asset_reference

# ============================================================
# 2. OPERATIONAL ASSET REGISTER
# ============================================================

object_name:
- operational_asset_register

meaning:
- canonical operational asset record used for maintenance/utilization/custody

required_fields:
- operational_asset_id
- company_id
- operational_asset_code
- asset_name
- asset_category
- asset_status
- fixed_asset_id_or_null
- item_id_or_null
- serial_id_or_null
- location_reference_or_null
- responsible_department_or_null
- custodian_reference_or_null
- acquisition_source_reference_or_null
- warranty_reference_or_null
- created_at
- updated_at
- lineage_reference

asset_category_examples:
- machine
- vehicle
- equipment
- tool
- facility
- IT_device
- fixture
- production_line
- building_equipment

allowed_asset_status:
- planned
- active
- under_maintenance
- idle
- transferred
- retired_operationally
- disposed_operationally
- lost
- cancelled
- superseded

rules:
- operational asset register belongs to 19
- fixed asset accounting register belongs to 33
- one operational asset may reference fixed_asset_id when capitalized
- operational retirement does not equal accounting disposal unless 33 processes disposal

# ============================================================
# 3. OPERATIONAL ASSET COMPONENT
# ============================================================

object_name:
- operational_asset_component

required_fields:
- operational_asset_component_id
- operational_asset_id
- component_name
- component_type
- component_status
- serial_id_or_null
- install_date_or_null
- removal_date_or_null
- maintenance_required_flag
- lineage_reference

allowed_component_status:
- active
- replaced
- removed
- under_maintenance
- failed
- cancelled
- superseded

rules:
- component maintenance belongs to 19
- accounting componentization belongs to 33 if capitalized separately
- component replacement may create capitalization candidate if policy requires

# ============================================================
# 4. ASSET ASSIGNMENT / LOCATION / CUSTODY
# ============================================================

object_name:
- asset_assignment

required_fields:
- asset_assignment_id
- company_id
- operational_asset_id
- assigned_to_department_or_person_or_location
- assignment_type
- effective_from
- effective_to_or_null
- assignment_status
- approval_reference_or_null
- lineage_reference

assignment_type_examples:
- department
- person
- location
- project
- plant
- cost_center
- work_center

allowed_assignment_status:
- draft
- active
- ended
- cancelled
- superseded

object_name:
- asset_location_custody

required_fields:
- asset_location_custody_id
- company_id
- operational_asset_id
- location_reference
- custodian_reference_or_null
- custody_start_at
- custody_end_at_or_null
- custody_status
- evidence_reference_or_null
- lineage_reference

rules:
- operational location/custody belongs to 19
- accounting location/cost center impact may be sent to 33/30 where needed
- location change does not automatically change fixed asset accounting without 33 workflow

# ============================================================
# 5. MAINTENANCE PLAN / SCHEDULE
# ============================================================

object_name:
- maintenance_plan

required_fields:
- maintenance_plan_id
- company_id
- operational_asset_id
- plan_code
- plan_name
- maintenance_type
- trigger_type
- interval_definition_or_null
- condition_trigger_definition_or_null
- required_skill_or_vendor_or_null
- plan_status
- effective_from
- effective_to_or_null
- lineage_reference

maintenance_type_examples:
- preventive
- corrective
- predictive
- inspection
- calibration
- overhaul
- emergency

trigger_type_examples:
- calendar
- usage_hours
- production_cycles
- condition_threshold
- manual
- failure_event

allowed_plan_status:
- draft
- active
- suspended
- retired
- cancelled
- superseded

object_name:
- maintenance_schedule

required_fields:
- maintenance_schedule_id
- company_id
- maintenance_plan_id
- operational_asset_id
- scheduled_start_at
- scheduled_end_at_or_null
- schedule_status
- generated_at
- lineage_reference

allowed_schedule_status:
- planned
- due
- overdue
- converted_to_work_order
- skipped
- cancelled
- superseded

rules:
- maintenance plan/schedule belongs to 19
- production planning may consume availability impact but does not own maintenance plan
- fixed assets does not own maintenance schedule

# ============================================================
# 6. MAINTENANCE WORK ORDER
# ============================================================

object_name:
- maintenance_work_order

meaning:
- operational maintenance execution order

required_fields:
- maintenance_work_order_id
- company_id
- operational_asset_id
- maintenance_plan_id_or_null
- maintenance_schedule_id_or_null
- work_order_type
- work_order_status
- problem_summary_or_null
- planned_start_at_or_null
- planned_end_at_or_null
- actual_start_at_or_null
- actual_end_at_or_null
- assigned_worker_or_vendor_or_null
- material_request_reference_set_or_null
- service_purchase_request_reference_or_null
- execution_result_reference_or_null
- lineage_reference

work_order_type_examples:
- preventive
- corrective
- emergency
- inspection
- calibration
- overhaul
- replacement

allowed_work_order_status:
- draft
- approved
- scheduled
- in_progress
- completed
- completed_with_exception
- cancelled
- deferred
- superseded

rules:
- maintenance work order belongs to 19
- purchase request for service/material follows 11/10 workflow
- inventory issue for spare parts follows 12 workflow
- accounting capitalization/expense decision follows 33/30 workflow where required

# ============================================================
# 7. MAINTENANCE EXECUTION RESULT
# ============================================================

object_name:
- maintenance_execution_result

required_fields:
- maintenance_execution_result_id
- company_id
- maintenance_work_order_id
- operational_asset_id
- result_status
- work_performed_summary
- actual_labor_minutes_or_null
- actual_service_cost_basis_reference_or_null
- spare_part_consumption_reference_set_or_null
- condition_after_maintenance
- downtime_reference_or_null
- completed_at
- completed_by_or_vendor
- lineage_reference

allowed_result_status:
- draft
- recorded
- review_pending
- approved
- corrected
- cancelled
- superseded

rules:
- execution result belongs to 19
- spare part inventory effect belongs to 12
- vendor purchase/service invoice belongs to purchase/billing/accounting workflows as applicable
- capitalization of major maintenance belongs to 33 if applicable

# ============================================================
# 8. MAINTENANCE MATERIAL / SERVICE REQUEST
# ============================================================

handoff_object_name:
- asset_maintenance_material_request

required_fields:
- maintenance_material_request_id
- company_id
- source_module
- target_module
- maintenance_work_order_id
- operational_asset_id
- item_id
- requested_quantity
- quantity_uom
- requested_location_or_warehouse_or_null
- request_status
- created_at
- lineage_reference

target_module:
- 12.inventory or 11.procurement depending stock vs procurement requirement

rules:
- 19 requests material/service
- inventory/procurement/purchase owns fulfillment workflow
- maintenance does not directly change stock ledger or PO

handoff_object_name:
- asset_maintenance_service_purchase_request

required_fields:
- maintenance_service_purchase_request_id
- company_id
- source_module
- target_module
- maintenance_work_order_id
- operational_asset_id
- service_scope
- requested_supplier_or_skill_or_null
- estimated_amount_or_null
- currency_code_or_null
- request_status
- created_at
- lineage_reference

target_module:
- 11.procurement

rules:
- procurement/purchase owns supplier/service sourcing and PO
- 19 owns maintenance need and completion result

# ============================================================
# 9. ASSET CONDITION / UTILIZATION / DOWNTIME
# ============================================================

object_name:
- asset_condition_record

required_fields:
- asset_condition_record_id
- company_id
- operational_asset_id
- condition_status
- condition_score_or_null
- observed_at
- observed_by_or_system
- evidence_reference_or_null
- related_maintenance_work_order_id_or_null
- lineage_reference

condition_status_examples:
- good
- warning
- degraded
- failed
- under_repair
- unsafe
- retired_operationally

object_name:
- asset_utilization_record

required_fields:
- asset_utilization_record_id
- company_id
- operational_asset_id
- utilization_period_start
- utilization_period_end
- usage_hours_or_cycles_or_units
- utilization_uom
- source_meter_or_system_or_null
- utilization_status
- lineage_reference

object_name:
- asset_downtime_event

required_fields:
- asset_downtime_event_id
- company_id
- operational_asset_id
- downtime_start_at
- downtime_end_at_or_null
- downtime_reason
- production_impact_flag
- maintenance_work_order_id_or_null
- severity
- lineage_reference

rules:
- condition/utilization/downtime belongs to 19
- depreciation may consume utilization if method allows through 33 workflow
- production planning may consume availability impact through planning workflow
- BI may visualize utilization/downtime

# ============================================================
# 10. CAPITALIZATION CANDIDATE TO FIXED ASSETS
# ============================================================

handoff_object_name:
- asset_management_to_fixed_assets_capitalization_candidate_basis

meaning:
- operational asset basis that may become fixed asset accounting record

required_fields:
- asset_capitalization_candidate_basis_id
- company_id
- source_module
- target_module
- operational_asset_id
- candidate_description
- acquisition_or_completion_date
- estimated_or_actual_capitalizable_amount
- currency_code
- asset_class_candidate_or_null
- location_reference_or_null
- project_reference_or_null
- purchase_reference_or_null
- maintenance_work_order_reference_or_null
- basis_status
- created_at
- lineage_reference

allowed_basis_status:
- building
- handoff_ready
- sent_to_fixed_assets
- accepted_by_fixed_assets
- rejected_by_fixed_assets
- cancelled
- superseded

rules:
- source_module must be 19.asset-management
- target_module must be 33.fixed-assets
- basis is not fixed asset register
- 33 decides capitalization
- 19 remains owner of operational asset record

# ============================================================
# 11. FIXED ASSET REFERENCE FEEDBACK
# ============================================================

feedback_object_name:
- fixed_assets_to_asset_management_reference_feedback

required_fields:
- fixed_asset_reference_feedback_id
- company_id
- source_module
- target_module
- operational_asset_id
- fixed_asset_id_or_null
- capitalization_status
- rejection_reason_or_null
- feedback_at
- lineage_reference

allowed_capitalization_status:
- accepted_and_capitalized
- rejected
- pending_more_information
- cancelled
- superseded

rules:
- 19 may store fixed_asset_id reference
- 19 does not own fixed asset accounting register
- 33 does not own maintenance execution

# ============================================================
# 12. OUTPUT TO BI / ACCOUNTING
# ============================================================

BI_consumable_outputs:
- operational asset snapshot
- maintenance plan/schedule/work order snapshot
- maintenance execution snapshot
- utilization snapshot
- downtime snapshot
- condition snapshot
- capitalization candidate snapshot

accounting_relationship:
- ordinary maintenance expense posting belongs to 30 via source purchase/accounting workflow
- capitalized maintenance belongs to 33 capitalization workflow
- cash payment belongs to 34
- 19 does not post GL journals

# ============================================================
# 13. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- operational asset record treated as fixed asset accounting register
- maintenance work order directly creating fixed asset
- maintenance execution directly posting GL journal
- utilization record directly changing depreciation without 33 workflow
- asset downtime directly changing production schedule without planning workflow
- BI dashboard closing maintenance work order
- fixed asset disposal directly deleting operational asset history

# ============================================================
# 14. DECISION TEST
# ============================================================

decision_test:
- If it is maintenance/utilization/custody/operational condition, 19 owns it.
- If it is capitalization/depreciation/disposal accounting, 33 owns it.
- If it is GL journal, 30 owns it.
- If it is cash payment, 34 owns it.
- If it is inventory spare part movement, 12 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 15. COMPLETION STATE
# ============================================================

completion_state:
- asset management exact design fixed
- operational asset register fixed
- maintenance/utilization/downtime ownership fixed
- capitalization candidate handoff fixed
- fixed asset feedback boundary fixed

# ============================================================
