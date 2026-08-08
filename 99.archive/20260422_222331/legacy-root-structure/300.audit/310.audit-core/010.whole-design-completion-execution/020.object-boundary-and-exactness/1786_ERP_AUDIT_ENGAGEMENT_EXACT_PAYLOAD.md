# ============================================================
# ERP AUDIT ENGAGEMENT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1786
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.engagement.exact_payload
component: audit-engagement-exact-payload


# OBJECT

audit_engagement

Canonical payload:
- object_id
- company_id
- object_type = audit_engagement
- status
- audit_engagement_code
- engagement_status_code
- audit_scope_code
- audit_period_code
- planned_start_at
- planned_end_at
- audit_owner_role_code
- linked_plan_reference_code
- created_at
- created_by
- updated_at
- updated_by

