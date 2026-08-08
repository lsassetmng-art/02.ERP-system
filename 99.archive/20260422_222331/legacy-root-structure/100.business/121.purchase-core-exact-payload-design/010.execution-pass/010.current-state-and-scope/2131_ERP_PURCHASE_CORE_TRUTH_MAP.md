# ============================================================
# ERP PURCHASE CORE TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2131
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_core.truth_map
component: purchase-core-truth-map


# PURCHASE CORE TRUTH MAP

Purchase owns:
- request truth
- order truth
- receipt expectation truth
- supplier invoice intake truth
- correction truth

Adjacent lines own:
- inventory = stock and receipt truth
- accounting = payable and posting truth
- management = review and approval truth

