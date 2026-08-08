# ============================================================
# ERP EPM EXACT PAYLOAD OBJECTIVE HIERARCHY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-843
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.exact_payload.objective_hierarchy
component: epm-exact-payload-objective-hierarchy


# OBJECT

epm_objective_node


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = epm_objective_node
- status
- objective_code
- parent_objective_id
- objective_level_code
- objective_name
- objective_owner_user_id
- objective_scope_code
- objective_status_code
- objective_start_date
- objective_end_date
- linked_plan_cycle_id
- company_wide_mbo_flag
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# RULE

Objective hierarchy must preserve parent-child relation explicitly.
company_wide_mbo_flag does not replace hierarchy ownership fields.

