# ============================================================
# ERP MANAGEMENT REVIEW CYCLE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1568
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.review_cycle.exact_payload
component: management-review-cycle-exact-payload


# OBJECT

management_review_cycle

Canonical payload:
- object_id
- company_id
- object_type = management_review_cycle
- status
- review_cycle_code
- review_scope_code
- review_status_code
- review_period_code
- scheduled_review_at
- owner_role_code
- linked_summary_reference_code
- created_at
- created_by
- updated_at
- updated_by

