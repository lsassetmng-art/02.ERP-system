# ============================================================
# ERP ANALYTICS LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1866
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.lifecycle_and_statusflow.rule
component: analytics-lifecycle-and-statusflow-rule


# DATASET MODEL STATUS SET

- draft
- active
- suspended
- retired
- archived


# METRIC CATALOG ENTRY STATUS SET

- draft
- active
- deprecated
- archived


# VIEW SNAPSHOT STATUS SET

- open
- published
- superseded
- archived


# INSIGHT RECORD STATUS SET

- open
- reviewed
- actioned
- archived


# SCENARIO SNAPSHOT STATUS SET

- open
- calculated
- compared
- archived

