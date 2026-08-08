# ============================================================
# ERP V2 RUNTIME AND SETTLEMENT PROMOTION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records promotion-relevant strengthening
for runtime and settlement after actual results.

runtime_promotion_note:
- system.exec_run_request now has materially stronger promotion footing
- integration.integration_job remains real but weaker for active truth

settlement_promotion_note:
- finance.payment_allocation now has materially stronger promotion footing
- public.v_finance_payment_allocation is now better understood as writable-view surface over the base table

remaining_caution:
- runtime final freezing still should consider remaining topology ambiguity
- settlement still should consider whether additional header/base truth exists

conclusion:
Runtime and settlement are both closer to frozen-v2 candidacy than before.
