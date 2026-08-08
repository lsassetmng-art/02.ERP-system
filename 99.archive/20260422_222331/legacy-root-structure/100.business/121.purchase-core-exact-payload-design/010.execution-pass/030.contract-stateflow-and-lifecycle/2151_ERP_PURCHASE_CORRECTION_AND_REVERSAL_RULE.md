# ============================================================
# ERP PURCHASE CORRECTION AND REVERSAL RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2151
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.correction_and_reversal.rule
component: purchase-correction-and-reversal-rule


# RULE

Correction case may target request, order,
receipt expectation, or supplier invoice intake references.

Correction application must preserve:
- original reference
- reason
- approval state
- downstream impact visibility

