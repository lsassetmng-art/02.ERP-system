# ============================================================
# ERP EPM EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-842
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.exact_payload.rules
component: epm-exact-payload-rules


# COMMON RULES

Every EPM object should carry at minimum:
- object_id
- company_id
- object_type
- status
- created_at
- created_by
- updated_at
- updated_by

Soft-removable families should also carry:
- archived_at
- archived_by
- archive_reason

Derived display fields must not replace:
- objective_status_code
- kpi_status_code
- plan_cycle_status_code
- review_cycle_status_code
- forecast_status_code
- variance_status_code

