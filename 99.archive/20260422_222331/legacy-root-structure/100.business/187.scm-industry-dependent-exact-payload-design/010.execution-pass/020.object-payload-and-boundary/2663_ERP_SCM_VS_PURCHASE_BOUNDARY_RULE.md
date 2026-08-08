# ============================================================
# ERP SCM VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2663
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_vs_purchase.boundary_rule
component: scm-vs-purchase-boundary-rule


# RULE

SCM owns:
- coordination truth
- transfer planning truth
- supply-risk truth

Purchase owns:
- sourcing commitment truth
- supplier execution truth

# CONSEQUENCE

A supply commitment coordination case is not a purchase order.
A transfer plan is not supplier commitment truth.
SCM may consume purchase visibility,
but it does not replace purchase-owned truth.

