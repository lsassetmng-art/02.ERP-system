# ============================================================
# ERP ANALYTICS BUSINESS RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1892
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_business.reconciliation_rule
component: analytics-business-reconciliation-rule


# RULE

Business core owns:
- operational source truth
- transaction and process truth
- source-side status truth

Analytics core owns:
- derived model truth
- metric definition truth
- derived insight truth

# CONSEQUENCE

The chain must preserve:
- business-created source truth
- analytics-created derived interpretation truth

No node in this chain may silently overwrite another node's truth.

