# ============================================================
# ERP CUSTOMER SEGMENT ASSIGNMENT AND RELATIONSHIP HEALTH EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2345
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.customer_segment_assignment_and_relationship_health.exact_payload
component: customer-segment-assignment-and-relationship-health-exact-payload


# OBJECT 1

customer_segment_assignment

Canonical payload:
- object_id
- company_id
- object_type = customer_segment_assignment
- status
- customer_segment_assignment_code
- assignment_status_code
- linked_customer_account_id
- segment_code
- segment_basis_code
- assigned_at
- expires_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

customer_relationship_health_snapshot

Canonical payload:
- object_id
- company_id
- object_type = customer_relationship_health_snapshot
- status
- customer_relationship_health_snapshot_code
- health_status_code
- linked_customer_account_id
- snapshot_period_code
- engagement_score
- churn_risk_score
- expansion_potential_score
- snapshot_summary_text
- snapped_at
- created_at
- created_by
- updated_at
- updated_by

