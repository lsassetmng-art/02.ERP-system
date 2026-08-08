# ============================================================
# ERP PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2073
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.boundary_rule
component: purchase-boundary-rule


# RULE

Purchase order truth is not inventory receipt truth.
Supplier invoice intake truth is not accounting payable posting truth.
Purchase approval visibility is not management decision ownership.

