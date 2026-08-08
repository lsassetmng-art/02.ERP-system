# ============================================================
# ERP ANALYTICS MANAGEMENT RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1894
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_management.reconciliation_rule
component: analytics-management-reconciliation-rule


# RULE

Analytics core owns:
- derived analytical visibility
- insight truth
- scenario truth

Management core owns:
- review truth
- decision truth
- directive truth

# CONSEQUENCE

Management may consume analytics visibility,
but analytics output must remain distinguishable from management-owned decision truth.

