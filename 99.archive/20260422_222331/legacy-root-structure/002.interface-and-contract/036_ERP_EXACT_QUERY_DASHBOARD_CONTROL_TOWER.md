# ============================================================
# ERP EXACT QUERY DASHBOARD CONTROL TOWER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for dashboard control tower.

endpoint:
GET /erp/dashboard/control-tower

semantic_owner:
- layer: 300.analytics
- module: 330.dashboard

query_parameters:
- company_id optional
- scope_mode optional
- as_of optional

response_payload_shape:
- correlation_id
- freshness
- summary_sections
- warnings
- errors

summary_sections_item_shape:
- section_code
- section_title
- metrics
- alert_summary optional

metrics_item_shape:
- metric_code
- metric_value
- metric_unit optional

response_notes:
- freshness belongs to dashboard freshness family
- summary_sections are analytical summaries, not transactional source-of-truth
- query is read-only and visibility-scoped

non_goals:
- business source-of-truth replacement
- approval mutation
- accounting mutation
