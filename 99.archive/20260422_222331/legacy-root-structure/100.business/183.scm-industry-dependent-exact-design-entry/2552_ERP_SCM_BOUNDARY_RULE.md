# ============================================================
# ERP SCM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2552
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.boundary_rule
component: scm-boundary-rule


# RULE

SCM owns:
- network coordination truth
- transfer planning truth
- supply risk truth

Purchase owns:
- sourcing commitment truth

Sales owns:
- demand commitment truth

WMS owns:
- warehouse execution truth

Inventory owns:
- stock truth

# CONSEQUENCE

A transfer plan is not a warehouse task.
A supply commitment coordination case is not a purchase order.
SCM may coordinate across modules,
but it does not replace downstream execution truths.

