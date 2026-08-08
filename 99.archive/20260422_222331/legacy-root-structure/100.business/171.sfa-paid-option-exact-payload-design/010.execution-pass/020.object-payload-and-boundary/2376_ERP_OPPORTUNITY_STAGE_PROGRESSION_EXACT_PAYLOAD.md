# ============================================================
# ERP OPPORTUNITY STAGE PROGRESSION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2376
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.opportunity_stage_progression.exact_payload
component: opportunity-stage-progression-exact-payload


# OBJECT

opportunity_stage_progression

Canonical payload:
- object_id
- company_id
- object_type = opportunity_stage_progression
- status
- opportunity_stage_progression_code
- progression_status_code
- linked_sales_opportunity_id
- from_stage_code
- to_stage_code
- progression_reason_code
- progressed_at
- progressed_by_reference_code
- blocked_flag
- created_at
- created_by
- updated_at
- updated_by

