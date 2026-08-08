# ============================================================
# ERP EPM EXACT PAYLOAD KPI AND PLAN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-844
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.exact_payload.kpi_and_plan
component: epm-exact-payload-kpi-and-plan


# OBJECT 1

epm_kpi_definition

Canonical payload:
- object_id
- company_id
- object_type = epm_kpi_definition
- status
- kpi_code
- linked_objective_id
- kpi_name
- metric_unit_code
- calculation_basis_code
- target_value
- threshold_warning_value
- threshold_critical_value
- kpi_status_code
- effective_from
- effective_to
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

epm_plan_cycle

Canonical payload:
- object_id
- company_id
- object_type = epm_plan_cycle
- status
- plan_cycle_code
- plan_cycle_name
- plan_scope_code
- plan_period_start
- plan_period_end
- plan_cycle_status_code
- cycle_owner_user_id
- locking_status_code
- created_at
- created_by
- updated_at
- updated_by


# RULE

KPI definition is not the same as period plan cycle.
Target value is not the same as measured actual.

