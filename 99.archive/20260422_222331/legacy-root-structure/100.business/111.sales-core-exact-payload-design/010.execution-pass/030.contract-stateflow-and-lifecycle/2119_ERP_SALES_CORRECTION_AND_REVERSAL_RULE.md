# ============================================================
# ERP SALES CORRECTION AND REVERSAL RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2119
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.correction_and_reversal.rule
component: sales-correction-and-reversal-rule


# RULE

Correction case may target quote, order,
fulfillment instruction, or invoice request references.

Correction application must preserve:
- original reference
- reason
- approval state
- downstream impact visibility

