# ============================================================
# ERP SALES BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2066
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.boundary_rule
component: sales-boundary-rule


# RULE

Sales order truth is not stock truth.
Sales invoice request truth is not accounting posting truth.
Sales approval visibility is not management decision ownership.

