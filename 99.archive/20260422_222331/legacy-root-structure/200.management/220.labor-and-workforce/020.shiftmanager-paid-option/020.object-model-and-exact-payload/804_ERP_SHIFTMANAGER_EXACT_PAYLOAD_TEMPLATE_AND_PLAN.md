# ============================================================
# ERP SHIFTMANAGER EXACT PAYLOAD TEMPLATE AND PLAN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-804
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.exact_payload.template_and_plan
component: shiftmanager-exact-payload-template-and-plan


# OBJECT 1

shift_template

Canonical payload:
- object_id
- company_id
- object_type = shift_template
- status
- template_code
- template_name
- department_code
- location_code
- slot_code_set
- planned_start_time
- planned_end_time
- break_rule_code
- active_flag
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

shift_plan

Canonical payload:
- object_id
- company_id
- object_type = shift_plan
- status
- plan_code
- target_period_start
- target_period_end
- department_code
- location_code
- plan_status_code
- staffing_target_summary
- planner_user_id
- publication_batch_id
- created_at
- created_by
- updated_at
- updated_by


# RULE

Template defines reusable structure.
Plan defines a concrete planning period and planning state.

