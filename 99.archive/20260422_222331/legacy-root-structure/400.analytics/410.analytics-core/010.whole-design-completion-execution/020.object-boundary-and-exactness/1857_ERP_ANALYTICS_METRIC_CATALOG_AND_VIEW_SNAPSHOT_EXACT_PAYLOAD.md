# ============================================================
# ERP ANALYTICS METRIC CATALOG AND VIEW SNAPSHOT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1857
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.metric_catalog_and_view_snapshot.exact_payload
component: analytics-metric-catalog-and-view-snapshot-exact-payload


# OBJECT 1

analytics_metric_catalog_entry

Canonical payload:
- object_id
- company_id
- object_type = analytics_metric_catalog_entry
- status
- metric_catalog_entry_code
- metric_status_code
- linked_dataset_model_id
- metric_formula_code
- metric_unit_code
- aggregation_rule_code
- metric_owner_role_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

analytics_view_snapshot

Canonical payload:
- object_id
- company_id
- object_type = analytics_view_snapshot
- status
- view_snapshot_code
- view_snapshot_status_code
- linked_dataset_model_id
- linked_metric_catalog_entry_id
- snapshot_period_code
- view_scope_code
- published_at
- created_at
- created_by
- updated_at
- updated_by

