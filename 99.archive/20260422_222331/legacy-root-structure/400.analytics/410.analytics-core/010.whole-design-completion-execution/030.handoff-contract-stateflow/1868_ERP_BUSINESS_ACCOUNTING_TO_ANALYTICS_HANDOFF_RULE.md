# ============================================================
# ERP BUSINESS ACCOUNTING TO ANALYTICS HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1868
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business_accounting_to_analytics.handoff_rule
component: business-accounting-to-analytics-handoff-rule


# RULE

Business core and accounting core may hand off:
- source registry visibility
- operational actuals visibility
- posted financial actuals visibility
- close-cycle visibility
- freshness visibility

Analytics core creates new owned truths:
- dataset model
- metric catalog entry
- view snapshot
- insight record
- scenario snapshot

