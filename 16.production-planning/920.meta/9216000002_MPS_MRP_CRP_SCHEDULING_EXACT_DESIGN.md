# ============================================================
# MPS / MRP / CRP / SCHEDULING EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 16.production-planning
related_modules:
- 07.sop-consensus
- 15.manufacturing
- 12.inventory
- 18.costing
- 60.business-intelligence

purpose:
Define executable production planning truth for MPS, MRP, CRP, scheduling,
planned orders, planning exceptions, and release package to manufacturing.

canonical_role:
- executable planning truth

# ============================================================
# 1. CORE PLANNING OBJECTS
# ============================================================

core_objects:
- production_planning_basis_snapshot
- master_production_schedule
- mrp_run
- mrp_requirement_line
- crp_run
- crp_capacity_line
- production_schedule
- planned_order
- planning_exception
- planning_release_package
- planning_to_manufacturing_release_package

# ============================================================
# 2. PLANNING BASIS SNAPSHOT
# ============================================================

object_name:
- production_planning_basis_snapshot

required_fields:
- planning_basis_snapshot_id
- company_id
- source_sop_handoff_id
- sop_cycle_id
- consensus_version_id
- planning_area_id
- horizon_start_date
- horizon_end_date
- time_bucket
- demand_basis_reference
- supply_policy_basis_reference
- capacity_basis_reference
- inventory_policy_basis_reference
- accepted_risk_reference_or_null
- snapshot_status
- created_at
- lineage_reference

allowed_snapshot_status:
- building
- accepted
- superseded
- cancelled

rules:
- snapshot is 16 intake truth derived from 07
- 16 does not own 07 consensus truth
- snapshot is immutable after accepted

# ============================================================
# 3. MASTER PRODUCTION SCHEDULE
# ============================================================

object_name:
- master_production_schedule

required_fields:
- mps_id
- company_id
- planning_basis_snapshot_id
- planning_area_id
- item_id_or_family_id
- period_start
- period_end
- scheduled_quantity
- quantity_uom
- schedule_status
- source_demand_reference
- created_at
- lineage_reference

allowed_schedule_status:
- draft
- calculated
- reviewed
- approved_for_mrp
- superseded
- cancelled

rules:
- MPS belongs to 16
- MPS is not manufacturing execution
- approved MPS may seed MRP

# ============================================================
# 4. MRP RUN
# ============================================================

object_name:
- mrp_run

meaning:
- material requirements planning run

required_fields:
- mrp_run_id
- company_id
- planning_basis_snapshot_id
- mps_reference_set
- run_status
- horizon_start_date
- horizon_end_date
- run_started_at
- run_completed_at_or_null
- generated_requirement_count
- exception_count
- run_by_system_actor
- lineage_reference

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- cancelled
- superseded

object_name:
- mrp_requirement_line

required_fields:
- mrp_requirement_line_id
- mrp_run_id
- item_id
- plant_id_or_location_id
- requirement_date
- gross_requirement_quantity
- available_supply_quantity_or_null
- net_requirement_quantity
- quantity_uom
- suggested_supply_type
- suggested_order_reference_or_null
- shortage_flag
- exception_reference_or_null
- lineage_reference

suggested_supply_type_examples:
- produce
- purchase
- transfer
- use_stock
- expedite
- reschedule_in
- reschedule_out

rules:
- MRP output is planning truth
- purchase/production/transfer execution belongs to downstream modules
- MRP line does not directly create PO or work order without release workflow

# ============================================================
# 5. CRP RUN
# ============================================================

object_name:
- crp_run

meaning:
- capacity requirements planning run

required_fields:
- crp_run_id
- company_id
- planning_basis_snapshot_id
- run_status
- horizon_start_date
- horizon_end_date
- run_started_at
- run_completed_at_or_null
- capacity_line_count
- exception_count
- lineage_reference

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- cancelled
- superseded

object_name:
- crp_capacity_line

required_fields:
- crp_capacity_line_id
- crp_run_id
- plant_id
- work_center_id_or_group_id
- period_start
- period_end
- required_capacity_hours
- available_capacity_hours
- overload_hours_or_null
- underload_hours_or_null
- capacity_status
- exception_reference_or_null
- lineage_reference

capacity_status_examples:
- feasible
- overloaded
- underloaded
- constrained
- unresolved

rules:
- CRP belongs to 16
- capacity actual belongs to 15 after execution
- CRP output does not change manufacturing actual

# ============================================================
# 6. PRODUCTION SCHEDULE
# ============================================================

object_name:
- production_schedule

required_fields:
- production_schedule_id
- company_id
- planning_basis_snapshot_id
- mrp_run_id_or_null
- crp_run_id_or_null
- schedule_status
- schedule_line_set
- created_at
- approved_at_or_null
- approved_by_or_null
- lineage_reference

allowed_schedule_status:
- draft
- calculated
- feasibility_review
- approved
- release_pending
- released
- superseded
- cancelled

schedule_line_required_fields:
- schedule_line_id
- item_id
- plant_id
- work_center_id_or_null
- planned_order_id_or_null
- planned_start_at
- planned_end_at
- planned_quantity
- quantity_uom
- material_feasibility_status
- capacity_feasibility_status
- release_eligibility_status
- lineage_reference

rules:
- schedule belongs to 16
- released schedule may seed manufacturing release package
- manufacturing execution belongs to 15

# ============================================================
# 7. PLANNED ORDER
# ============================================================

object_name:
- planned_order

required_fields:
- planned_order_id
- company_id
- planning_basis_snapshot_id
- item_id
- plant_id
- planned_quantity
- quantity_uom
- planned_start_at
- planned_end_at
- planned_order_type
- planned_order_status
- source_mrp_line_reference_or_null
- source_schedule_line_reference_or_null
- release_package_reference_or_null
- lineage_reference

planned_order_type_examples:
- production
- purchase_requisition_candidate
- transfer_candidate
- subcontract_candidate

allowed_planned_order_status:
- proposed
- reviewed
- approved_for_release
- released
- cancelled
- superseded

rules:
- planned order is planning truth
- production planned order release creates handoff to 15
- purchase candidate must go through procurement/purchase workflow
- transfer candidate must go through inventory/logistics workflow as applicable

# ============================================================
# 8. PLANNING EXCEPTION
# ============================================================

object_name:
- planning_exception

required_fields:
- planning_exception_id
- company_id
- planning_basis_snapshot_id
- source_run_type
- source_run_id
- exception_type
- severity
- exception_summary
- affected_item_id_or_family_id
- affected_location_or_plant_id_or_null
- affected_period_start
- affected_period_end
- recommended_action
- exception_status
- created_at
- lineage_reference

exception_type_examples:
- material_shortage
- capacity_overload
- infeasible_schedule
- late_supply
- excess_inventory
- conflicting_policy
- unresolved_sop_risk
- master_data_issue

allowed_exception_status:
- open
- under_review
- resolved_in_plan
- accepted_risk
- escalated_to_sop
- sent_to_source_module
- cancelled
- superseded

rules:
- planning exception belongs to 16
- material/inventory correction belongs to 12 or source module
- capacity execution feedback may come from 15
- S&OP escalation returns to 07 workflow

# ============================================================
# 9. PLANNING TO MANUFACTURING RELEASE PACKAGE
# ============================================================

handoff_object_name:
- planning_to_manufacturing_release_package

required_fields:
- release_package_id
- company_id
- source_module
- target_module
- planning_basis_snapshot_id
- production_schedule_id
- planned_order_id
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
- quality_requirement_reference_or_null
- release_status
- created_at
- created_by
- lineage_reference

allowed_release_status:
- building
- validation_pending
- handoff_ready
- sent_to_manufacturing
- accepted_by_manufacturing
- rejected_by_manufacturing
- cancelled
- superseded

rules:
- source_module must be 16.production-planning
- target_module must be 15.manufacturing
- only handoff_ready may be accepted by 15
- manufacturing owns execution after acceptance
- 16 retains planning lineage

# ============================================================
# 10. FEEDBACK FROM MANUFACTURING
# ============================================================

accepted_feedback_examples:
- manufacturing_variance_feedback
- execution_disruption_feedback
- execution_capacity_realization_feedback
- replanning_candidate_feedback

rules:
- feedback does not rewrite released plan in place
- material change requires new planning version/snapshot/run
- old plan remains traceable
- manufacturing actual remains 15 truth

# ============================================================
# 11. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- MPS snapshot
- MRP run summary
- CRP run summary
- production schedule snapshot
- planned order status snapshot
- planning exception snapshot
- release package status snapshot

rules:
- BI consumes snapshots
- BI does not release plan
- BI does not correct MRP/CRP output

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- MRP line directly creating PO without procurement/purchase workflow
- planned order directly becoming manufacturing actual
- schedule release directly changing inventory
- CRP result directly changing capacity actual
- BI dashboard releasing production plan
- manufacturing actual rewriting released planning version in place

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it is MPS/MRP/CRP/schedule/planned order/planning exception, 16 owns it.
- If it is production execution, 15 owns it.
- If it is stock effect, 12 owns it.
- If it is cost calculation, 18 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- MPS/MRP/CRP/scheduling exact design fixed
- planning release package fixed
- planning exception ownership fixed
- manufacturing feedback boundary fixed

# ============================================================
