# ============================================================
# ERP MRP EXACT PAYLOAD ALLOCATION AND EXCEPTION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-934
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.exact_payload.allocation_and_exception
component: mrp-exact-payload-allocation-and-exception


# OBJECT 1

mrp_inventory_allocation_rule

Canonical payload:
- object_id
- company_id
- object_type = mrp_inventory_allocation_rule
- status
- allocation_rule_code
- item_reference_code
- site_reference_code
- allocation_priority_code
- reservation_policy_code
- effective_from
- effective_to
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

mrp_planning_exception_record

Canonical payload:
- object_id
- company_id
- object_type = mrp_planning_exception_record
- status
- linked_run_id
- exception_status_code
- exception_type_code
- item_reference_code
- site_reference_code
- exception_severity_code
- exception_summary
- required_action_code
- detected_at
- created_at
- created_by
- updated_at
- updated_by


# RULE

Allocation rule is planning policy.
Planning exception record is run-detected exception visibility.

