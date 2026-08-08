# ============================================================
# BOM / ROUTING / ENGINEERING CHANGE BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 15.manufacturing
track: Track F
related_modules:
- 16.production-planning
- 52.master-data
- 12.inventory
- 17.quality
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define ownership boundary for BOM, routing, engineering change, planning usage,
manufacturing execution usage, item master references, and historical production
traceability.

canonical_role:
- manufacturing structure execution usage and production structure boundary

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- manufacturing_BOM
- manufacturing_BOM_line
- manufacturing_routing
- routing_operation
- engineering_change_request
- engineering_change_order
- engineering_change_effectivity
- BOM_routing_publication_package
- planning_BOM_routing_usage_snapshot
- production_BOM_routing_usage_snapshot

# ============================================================
# 2. BOM
# ============================================================

object_name:
- manufacturing_BOM

required_fields:
- BOM_id
- company_id
- parent_item_id
- BOM_code
- BOM_name
- BOM_type
- BOM_version
- BOM_status
- effective_from
- effective_to_or_null
- approval_reference_or_null
- lineage_reference

BOM_type_examples:
- production
- engineering
- planning
- costing_reference
- service
- phantom
- variant

allowed_BOM_status:
- draft
- review_pending
- approved
- active
- inactive
- superseded
- cancelled

object_name:
- manufacturing_BOM_line

required_fields:
- BOM_line_id
- BOM_id
- component_item_id
- component_quantity
- component_uom
- scrap_factor_or_null
- alternate_component_group_or_null
- issue_method_or_null
- line_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- item identity belongs to 52.master-data
- BOM structure belongs to manufacturing/planning boundary, with execution usage controlled by 15
- costing consumes BOM cost basis but does not own BOM
- historical production orders preserve BOM version snapshot

# ============================================================
# 3. ROUTING
# ============================================================

object_name:
- manufacturing_routing

required_fields:
- routing_id
- company_id
- item_id
- routing_code
- routing_name
- routing_version
- routing_status
- effective_from
- effective_to_or_null
- approval_reference_or_null
- lineage_reference

object_name:
- routing_operation

required_fields:
- routing_operation_id
- routing_id
- operation_sequence
- operation_code
- work_center_reference_or_null
- standard_labor_time_or_null
- standard_machine_time_or_null
- setup_time_or_null
- operation_uom_or_null
- quality_check_required_flag
- operation_status
- lineage_reference

rules:
- routing definition belongs to manufacturing/planning boundary
- work center/location references are master/source references
- actual operation execution belongs to 15.manufacturing
- routing change does not rewrite historical operation actuals

# ============================================================
# 4. ENGINEERING CHANGE
# ============================================================

object_name:
- engineering_change_request

required_fields:
- engineering_change_request_id
- company_id
- change_request_type
- affected_item_reference_set
- affected_BOM_reference_set_or_null
- affected_routing_reference_set_or_null
- change_reason
- requested_effective_date_or_null
- request_status
- requested_by
- requested_at
- lineage_reference

object_name:
- engineering_change_order

required_fields:
- engineering_change_order_id
- company_id
- source_request_id_or_null
- change_scope
- approved_change_summary
- affected_master_reference_set
- affected_BOM_reference_set_or_null
- affected_routing_reference_set_or_null
- effectivity_reference
- change_status
- approval_reference_or_null
- lineage_reference

allowed_change_status:
- draft
- impact_review
- approval_pending
- approved
- published
- effective
- cancelled
- superseded

rules:
- engineering change may affect item/BOM/routing references
- shared item identity correction goes through 52.master-data
- BOM/routing publication goes to planning/manufacturing/costing/quality as needed
- open production order handling must be explicit

# ============================================================
# 5. EFFECTIVITY / PUBLICATION
# ============================================================

object_name:
- engineering_change_effectivity

required_fields:
- effectivity_id
- engineering_change_order_id
- effectivity_type
- effective_from_date_or_lot_or_serial_or_order
- effective_to_or_null
- affected_scope_reference
- effectivity_status
- lineage_reference

effectivity_type_examples:
- date
- lot
- serial
- production_order
- plant
- customer_specific
- manual_release

object_name:
- BOM_routing_publication_package

required_fields:
- publication_package_id
- company_id
- engineering_change_order_id
- target_module_set
- BOM_reference_set
- routing_reference_set
- effectivity_reference
- publication_status
- created_at
- lineage_reference

target_module_examples:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 18.costing
- 12.inventory
- 60.business-intelligence

rules:
- publication does not rewrite already completed production history
- source modules acknowledge impact
- planning may create new planning snapshot
- manufacturing may apply to future/released orders according to policy

# ============================================================
# 6. USAGE SNAPSHOTS
# ============================================================

object_name:
- planning_BOM_routing_usage_snapshot

required_fields:
- planning_usage_snapshot_id
- company_id
- planning_run_id
- item_id
- BOM_id
- BOM_version
- routing_id_or_null
- routing_version_or_null
- snapshot_at
- lineage_reference

object_name:
- production_BOM_routing_usage_snapshot

required_fields:
- production_usage_snapshot_id
- company_id
- production_order_id
- item_id
- BOM_id
- BOM_version
- routing_id_or_null
- routing_version_or_null
- captured_at
- lineage_reference

rules:
- snapshots preserve historical explainability
- production order uses captured snapshot
- later BOM/routing change does not mutate old snapshot

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- BOM change rewriting historical production order
- routing change rewriting operation actual
- engineering change directly modifying item identity without 52 workflow
- planning MRP run changing BOM master directly
- costing standard cost changing BOM line
- BI dashboard approving engineering change
- open production orders silently switching BOM version without policy

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- BOM/routing/engineering change boundary fixed
- effectivity/publication rules fixed
- planning/production usage snapshots fixed
- historical traceability preserved

# ============================================================
