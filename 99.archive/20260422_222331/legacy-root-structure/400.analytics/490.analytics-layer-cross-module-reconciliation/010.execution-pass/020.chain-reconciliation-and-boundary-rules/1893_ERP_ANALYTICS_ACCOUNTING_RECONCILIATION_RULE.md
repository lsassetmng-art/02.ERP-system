# ============================================================
# ERP ANALYTICS ACCOUNTING RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1893
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_accounting.reconciliation_rule
component: analytics-accounting-reconciliation-rule


# RULE

Accounting core owns:
- posting truth
- correction truth
- close-cycle truth

Analytics core owns:
- derived financial model truth
- derived financial metric truth
- comparative and scenario interpretation truth

# CONSEQUENCE

The chain must preserve:
- accounting-created posting truth
- analytics-created derived interpretation truth

