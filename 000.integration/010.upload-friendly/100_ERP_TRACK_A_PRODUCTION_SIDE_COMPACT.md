# ============================================================
# ERP TRACK A PRODUCTION-SIDE COMPACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track A
scope:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 12.inventory
- 18.costing
- 10.purchase
- 11.procurement
- 30.accounting
- 60.business-intelligence

# 1. Ownership

ownership:
- 16.production-planning owns MPS / MRP / CRP / schedule / planned order / release package.
- 15.manufacturing owns production order / work order / actual / scrap / rework / downtime.
- 17.quality owns inspection / result / disposition / nonconformance.
- 12.inventory owns stock ledger and stock status application.
- 18.costing owns standard cost / actual cost rollup / variance.
- 10.purchase owns supplier claim and purchase return commercial workflow.
- 11.procurement owns supplier evaluation / sourcing impact.
- 30.accounting owns GL journal.
- 60.business-intelligence owns analytical projection only.

# 2. Canonical flow

flow:
- 07.sop-consensus
- -> 16.production-planning
- -> 15.manufacturing
- -> 17.quality when inspection/disposition is required
- -> 12.inventory
- -> 18.costing
- -> 30.accounting
- -> 60.business-intelligence

# 3. Fixed objects

production_planning:
- production_planning_basis_snapshot
- master_production_schedule
- mrp_run
- mrp_requirement_line
- crp_run
- crp_capacity_line
- production_schedule
- planned_order
- planning_exception
- planning_to_manufacturing_release_package

manufacturing:
- production_order
- work_order
- production_operation_actual
- manufacturing_material_consumption_observation
- manufacturing_output_confirmation
- manufacturing_scrap_event
- manufacturing_rework_event
- manufacturing_downtime_event
- manufacturing_exception
- manufacturing_to_quality_inspection_request
- manufacturing_to_inventory_production_receipt_basis
- manufacturing_to_inventory_component_consumption_basis
- manufacturing_to_costing_actual_input_package

quality:
- quality_inspection_plan
- quality_inspection_request
- quality_inspection_lot
- quality_inspection_result
- quality_measurement_result
- quality_disposition
- quality_nonconformance
- quality_to_inventory_disposition_reference
- quality_to_purchase_supplier_claim_basis
- quality_to_procurement_supplier_evaluation_feedback

costing:
- costing_standard_cost_version
- costing_cost_component_structure
- costing_actual_cost_input_package
- costing_production_actual_cost_rollup
- costing_cost_variance_package
- costing_to_accounting_production_actual_cost_posting_basis
- costing_to_accounting_production_variance_posting_basis

# 4. Forbidden shortcuts

forbidden:
- production schedule treated as manufacturing actual
- manufacturing completion directly writing stock ledger
- component consumption observation directly reducing inventory
- quality result directly writing inventory ledger
- quality disposition directly creating supplier claim
- costing posting basis treated as GL journal
- costing modifying manufacturing actual
- accounting journal rewriting costing rollup
- BI dashboard correcting production / quality / inventory / costing / accounting truth

# 5. Remaining gaps

remaining_gaps:
- CAPA full lifecycle and audit remediation boundary
- lot/serial genealogy
- WIP inventory / WIP costing
- production order close package
- subcontract manufacturing
- standard cost activation / costing close
- production accounting posting rules
- supplier corrective action request lifecycle
- customer return quality path

# 6. Key source docs

source_docs:
- 9200000317_PRODUCTION_QUALITY_INVENTORY_COSTING_BOUNDARY_MEMO.md
- 9217000001_QUALITY_INSPECTION_NONCONFORMANCE_DISPOSITION_EXACT.md
- 9215000002_MANUFACTURING_WORK_ORDER_ACTUAL_SCRAP_REWORK_EXACT.md
- 9216000002_MPS_MRP_CRP_SCHEDULING_EXACT_DESIGN.md
- 9218000002_PRODUCTION_ACTUAL_COST_ROLLUP_VARIANCE_EXACT.md
- 9200000318_PRODUCTION_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
- 9200000319_TRACK_A_PRODUCTION_SIDE_DEEPENING_INDEX.md
- 9200000320_TRACK_A_PRODUCTION_SIDE_COVERAGE_LEDGER.md

# ============================================================
