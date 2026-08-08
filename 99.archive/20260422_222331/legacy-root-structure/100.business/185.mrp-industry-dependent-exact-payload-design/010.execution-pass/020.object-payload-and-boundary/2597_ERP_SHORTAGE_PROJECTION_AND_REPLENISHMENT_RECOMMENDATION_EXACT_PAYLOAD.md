# ============================================================
# ERP SHORTAGE PROJECTION AND REPLENISHMENT RECOMMENDATION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2597
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.shortage_projection_and_replenishment_recommendation.exact_payload
component: shortage-projection-and-replenishment-recommendation-exact-payload


# OBJECT 1

shortage_projection_snapshot

Canonical payload:
- object_id
- company_id
- object_type = shortage_projection_snapshot
- status
- shortage_projection_snapshot_code
- shortage_status_code
- projected_item_reference_code
- projection_period_code
- projected_available_quantity
- projected_shortage_quantity
- shortage_date
- shortage_reason_summary_text
- snapped_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

replenishment_recommendation_case

Canonical payload:
- object_id
- company_id
- object_type = replenishment_recommendation_case
- status
- replenishment_recommendation_case_code
- recommendation_status_code
- linked_shortage_projection_snapshot_id
- recommendation_type_code
- recommended_item_reference_code
- recommended_quantity
- recommended_due_date
- downstream_handoff_target_code
- recommendation_summary_text
- created_at
- created_by
- updated_at
- updated_by

