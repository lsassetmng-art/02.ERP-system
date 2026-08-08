# ============================================================
# ERP ANALYTICS SCREEN_INVENTORY_AND_NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1874
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.screen_inventory_and_navigation
component: analytics-screen-inventory-and-navigation


# PRIMARY SCREENS

- analytics_dataset_model_screen
- analytics_metric_catalog_entry_screen
- analytics_view_snapshot_screen
- analytics_insight_record_screen
- analytics_scenario_snapshot_screen
- analytics_permission_denied_screen

# PRIMARY ENTRY FLOW

analytics entry
-> dataset model / metric
-> view / insight
-> scenario subflows

