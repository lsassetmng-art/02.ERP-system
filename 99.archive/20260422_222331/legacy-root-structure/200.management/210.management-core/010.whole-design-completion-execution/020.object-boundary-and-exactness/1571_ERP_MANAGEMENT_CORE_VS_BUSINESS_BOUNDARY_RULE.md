# ============================================================
# ERP MANAGEMENT CORE VS BUSINESS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1571
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_core_vs_business.boundary_rule
component: management-core-vs-business-boundary-rule


# RULE

Business core owns operational business truth.

Management core owns:
- review-cycle meaning
- decision truth
- escalation truth
- directive truth
- watchlist visibility meaning

# CONSEQUENCE

Management may review, prioritize, escalate, or direct business actions,
but it must not overwrite business-owned operational truth.

