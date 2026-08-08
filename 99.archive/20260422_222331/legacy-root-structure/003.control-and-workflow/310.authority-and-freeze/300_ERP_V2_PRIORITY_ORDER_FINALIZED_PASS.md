# ============================================================
# ERP V2 PRIORITY ORDER FINALIZED PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the revised priority order after approval clarification.

priority_order:
1. audit.approval_request frozen-v2 candidate review
2. system.exec_run_request frozen-v2 candidate review
3. finance.payment_allocation frozen-v2 candidate review
4. AR-side scope decision: billing_header vs billing_detail
5. AP-side scope decision: purchase_invoice vs purchase_invoice_detail vs purchase_three_way_match
6. surface-only freeze review
7. remaining weaker operational competitors

conclusion:
The v2 path is now dominated by final scope and layered freeze decisions,
not broad uncertainty.
