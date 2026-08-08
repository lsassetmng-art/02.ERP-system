# ============================================================
# ERP ANALYTICS PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1873
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.permission_and_audit.rule
component: analytics-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- analytics_read
- analytics_model_write
- analytics_metric_manage
- analytics_view_publish
- analytics_insight_review
- analytics_scenario_run
- analytics_export
- analytics_audit_read
- analytics_override

# RULE

Analytics model write does not imply view publish.
Insight review does not imply analytics override.
Read does not imply export.

