# ============================================================
# QUALITY INSPECTION / NONCONFORMANCE / DISPOSITION EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 17.quality
related_modules:
- 10.purchase
- 12.inventory
- 13.warehouse
- 15.manufacturing
- 18.costing
- 51.audit
- 60.business-intelligence

purpose:
Define quality inspection, nonconformance, disposition, release/hold/reject,
and quality feedback boundaries.

canonical_role:
- quality inspection / nonconformance / disposition truth

# ============================================================
# 1. CORE QUALITY OBJECTS
# ============================================================

core_objects:
- quality_inspection_plan
- quality_inspection_request
- quality_inspection_lot
- quality_inspection_result
- quality_measurement_result
- quality_disposition
- quality_hold_release
- quality_nonconformance
- quality_rework_recommendation
- quality_supplier_claim_basis
- quality_manufacturing_feedback
- quality_to_inventory_disposition_reference
- quality_to_costing_quality_cost_basis

# ============================================================
# 2. INSPECTION PLAN
# ============================================================

object_name:
- quality_inspection_plan

meaning:
- canonical inspection method and criteria definition

required_fields:
- inspection_plan_id
- company_id
- inspection_plan_code
- inspection_plan_name
- inspection_source_type
- item_id_or_family_id
- supplier_id_or_null
- plant_id_or_null
- process_reference_or_null
- inspection_characteristic_set
- sampling_rule_reference_or_null
- acceptance_criteria_reference
- effective_from
- effective_to_or_null
- plan_status
- version_id
- lineage_reference

inspection_source_type_examples:
- purchase_receipt
- production_completion
- in_process
- stock_transfer
- customer_return
- supplier_return
- audit_sample
- manual_inspection

allowed_plan_status:
- draft
- active
- inactive
- superseded
- cancelled

rules:
- inspection plan belongs to 17.quality
- item identity belongs to 52.master-data
- production/purchase/inventory source truth remains in source modules

# ============================================================
# 3. INSPECTION REQUEST
# ============================================================

object_name:
- quality_inspection_request

meaning:
- request for quality inspection from manufacturing, warehouse, inventory, purchase, or manual process

required_fields:
- inspection_request_id
- company_id
- source_module
- source_object_type
- source_object_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- quantity
- quantity_uom
- inspection_reason
- requested_disposition_due_at_or_null
- inspection_plan_id_or_null
- request_status
- requested_at
- requested_by_or_system_actor
- lineage_reference

inspection_reason_examples:
- purchase_receipt_required
- production_completion_required
- in_process_check
- nonconformance_followup
- customer_return_check
- supplier_issue_check
- manual_quality_review

allowed_request_status:
- received
- validated
- inspection_lot_created
- rejected
- cancelled
- superseded

acceptance_requires:
- source_module resolvable
- source object resolvable
- item/quantity/uom resolvable
- inspection plan resolvable or manual inspection allowed
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SOURCE_OBJECT_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- QUANTITY_INVALID
- UOM_UNRESOLVABLE
- INSPECTION_PLAN_UNRESOLVABLE
- MISSING_LINEAGE
- DUPLICATE_REQUEST

rules:
- request is not inspection result
- source module may request inspection, but 17 owns result/disposition
- rejected request must preserve evidence

# ============================================================
# 4. INSPECTION LOT
# ============================================================

object_name:
- quality_inspection_lot

meaning:
- controlled quality lot/sample to be inspected

required_fields:
- inspection_lot_id
- company_id
- inspection_request_id
- inspection_plan_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- inspection_quantity
- quantity_uom
- sample_size_or_null
- inspection_lot_status
- created_at
- created_by
- lineage_reference

allowed_inspection_lot_status:
- created
- sampling
- inspection_in_progress
- result_pending
- disposition_pending
- disposition_completed
- cancelled
- superseded

rules:
- inspection lot belongs to 17
- inspection lot may reference inventory/production/purchase lot
- inspection lot does not own stock balance

# ============================================================
# 5. INSPECTION RESULT
# ============================================================

object_name:
- quality_inspection_result

meaning:
- canonical quality inspection outcome

required_fields:
- inspection_result_id
- company_id
- inspection_lot_id
- inspection_request_id
- inspection_plan_id
- result_status
- overall_result
- measurement_result_set
- defect_summary_or_null
- inspected_quantity
- accepted_quantity_or_null
- rejected_quantity_or_null
- conditional_quantity_or_null
- inspected_at
- inspected_by
- evidence_reference_set_or_null
- lineage_reference

allowed_result_status:
- draft
- recorded
- review_pending
- approved
- rejected
- corrected
- superseded
- cancelled

overall_result_examples:
- pass
- fail
- conditional_pass
- partial_pass
- inconclusive
- not_applicable

rules:
- inspection result belongs to 17
- result approval may require 50.approval
- result does not directly change stock ledger
- correction requires new result version or corrected result event

# ============================================================
# 6. MEASUREMENT RESULT
# ============================================================

object_name:
- quality_measurement_result

required_fields:
- measurement_result_id
- inspection_result_id
- characteristic_code
- measured_value_or_text
- measurement_uom_or_null
- target_value_or_range_or_null
- tolerance_reference_or_null
- pass_fail_result
- measured_at
- measured_by_or_device
- evidence_reference_or_null
- lineage_reference

pass_fail_result_examples:
- pass
- fail
- warning
- not_measured
- not_applicable

rules:
- measurement result supports inspection result
- measurement does not equal final disposition until disposition is issued

# ============================================================
# 7. DISPOSITION
# ============================================================

object_name:
- quality_disposition

meaning:
- canonical quality decision for inspected goods/process/output

required_fields:
- quality_disposition_id
- company_id
- inspection_result_id
- source_module
- source_object_type
- source_object_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- disposition_type
- disposition_quantity
- quantity_uom
- disposition_status
- decided_at
- decided_by
- approval_reference_or_null
- inventory_status_suggestion_or_null
- manufacturing_action_suggestion_or_null
- supplier_action_suggestion_or_null
- costing_quality_cost_reference_or_null
- lineage_reference

disposition_type_examples:
- accept
- reject
- conditional_release
- quarantine
- hold
- release_from_hold
- rework_required
- scrap_required
- return_to_supplier
- sort_required
- use_as_is
- downgrade
- investigate

allowed_disposition_status:
- draft
- review_pending
- approved
- sent_to_inventory
- sent_to_manufacturing
- sent_to_purchase
- applied_by_source
- rejected_by_source
- corrected
- superseded
- cancelled

rules:
- disposition belongs to 17
- inventory applies stock status/ledger effect through 12 workflow
- manufacturing applies rework/scrap through 15 workflow
- purchase handles supplier claim/return through 10 workflow
- costing consumes quality cost basis through 18 workflow
- disposition does not directly mutate source records

# ============================================================
# 8. QUALITY TO INVENTORY DISPOSITION REFERENCE
# ============================================================

handoff_object_name:
- quality_to_inventory_disposition_reference

required_fields:
- disposition_reference_id
- company_id
- source_module
- target_module
- quality_disposition_id
- inspection_result_id
- item_id
- lot_id_or_null
- serial_id_set_or_null
- disposition_type
- disposition_quantity
- quantity_uom
- suggested_stock_status
- source_object_reference
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
- superseded
- cancelled

rules:
- source_module must be 17.quality
- target_module must be 12.inventory
- inventory decides stock ledger/status application
- quality disposition is not inventory ledger

# ============================================================
# 9. NONCONFORMANCE
# ============================================================

object_name:
- quality_nonconformance

meaning:
- canonical quality issue record

required_fields:
- nonconformance_id
- company_id
- source_module
- source_object_type
- source_object_id
- inspection_result_id_or_null
- item_id_or_null
- lot_id_or_null
- defect_type
- severity
- nonconformance_summary
- detected_at
- detected_by
- containment_action_or_null
- root_cause_reference_or_null
- corrective_action_reference_or_null
- disposition_reference_or_null
- nonconformance_status
- lineage_reference

defect_type_examples:
- dimensional_defect
- functional_defect
- contamination
- wrong_material
- labeling_error
- packaging_defect
- process_deviation
- documentation_gap
- supplier_defect
- customer_return_defect

allowed_severity:
- informational
- low
- medium
- high
- critical

allowed_nonconformance_status:
- draft
- open
- containment_pending
- investigation
- disposition_pending
- corrective_action_pending
- closed
- reopened
- cancelled
- superseded

rules:
- nonconformance belongs to 17
- audit finding may reference nonconformance but does not own it
- remediation/CAPA ownership must be explicit if split later
- nonconformance closure does not automatically correct inventory/cost/accounting

# ============================================================
# 10. QUALITY FEEDBACK
# ============================================================

allowed_feedback:
- to 15.manufacturing: rework/scrap/investigation recommendation
- to 12.inventory: stock status/disposition reference
- to 10.purchase: supplier defect / return / claim basis
- to 18.costing: quality cost / scrap / rework / yield impact basis
- to 51.audit: quality control issue evidence where audited
- to 60.business-intelligence: quality KPI snapshot

rules:
- feedback is evidence or request
- target module applies its own business workflow
- quality does not directly mutate source canon outside 17

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- manufacturing deciding quality acceptance directly
- inventory accepting restricted stock without required quality disposition
- quality disposition directly writing stock ledger
- quality result directly posting accounting journal
- BI dashboard changing inspection result
- audit finding replacing quality nonconformance
- supplier claim closing nonconformance without quality closure
- inspection measurement treated as final disposition without disposition object

# ============================================================
# 12. DECISION TEST
# ============================================================

decision_test:
- If it is inspection plan/result/disposition/nonconformance, 17 owns it.
- If it is manufacturing execution, 15 owns it.
- If it is stock status/ledger application, 12 owns it.
- If it is cost calculation, 18 owns it.
- If it is audit finding, 51 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- quality inspection exact design fixed
- disposition and inventory handoff fixed
- nonconformance ownership fixed
- quality feedback boundaries fixed
- forbidden shortcuts fixed

# ============================================================
