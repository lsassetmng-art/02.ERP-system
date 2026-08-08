# ============================================================
# ERP PURCHASE TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2071
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.truth_map
component: purchase-truth-map


# PURCHASE TRUTH MAP

Purchase owns:
- request truth
- order truth
- receipt expectation truth
- supplier invoice intake truth

Adjacent lines own:
- inventory = receipt and stock truth
- accounting = payable posting truth
- management = approval truth

