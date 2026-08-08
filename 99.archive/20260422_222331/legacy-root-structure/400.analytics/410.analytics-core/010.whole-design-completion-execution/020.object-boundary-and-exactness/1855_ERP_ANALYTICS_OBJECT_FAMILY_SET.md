# ============================================================
# ERP ANALYTICS OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1855
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.object_family_set
component: analytics-object-family-set


# PRIMARY OBJECT FAMILIES

- analytics_dataset_model
- analytics_metric_catalog_entry
- analytics_view_snapshot
- analytics_insight_record
- analytics_scenario_snapshot

# RULE

Dataset model is not metric catalog entry.
Metric catalog entry is not view snapshot.
View snapshot is not insight record.
Insight record is not scenario snapshot.

