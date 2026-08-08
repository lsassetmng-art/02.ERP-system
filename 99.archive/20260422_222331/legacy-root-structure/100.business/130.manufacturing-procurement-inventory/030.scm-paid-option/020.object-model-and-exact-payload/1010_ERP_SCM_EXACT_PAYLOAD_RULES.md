# ============================================================
# ERP SCM EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1010
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.exact_payload.rules
component: scm-exact-payload-rules


# COMMON RULES

Every SCM object should carry at minimum:
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
- node_status_code
- supplier_status_code
- lane_status_code
- supply_plan_status_code
- replenishment_status_code
- recommendation_status_code
- disruption_status_code
- resilience_status_code

