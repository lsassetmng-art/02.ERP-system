# ============================================================
# ERP V2 PRIORITY ORDER AFTER AR/AP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the revised v2 priority order
after AR/AP role-comparison results.

priority_order:
1. audit.approval_request vs system.approval_request final truth decision
2. system.exec_run_request final freeze review
3. finance.payment_allocation / public.v_finance_payment_allocation final freeze review
4. AR-side scope decision: billing_header vs billing_detail
5. AP-side scope decision: purchase_invoice vs purchase_invoice_detail vs purchase_three_way_match
6. projection-only surface freeze review
7. remaining lower-priority deferred families

why_this_order:
- approval still has the biggest truth-interpretation shift
- runtime and settlement are already close to promotion
- AR/AP now needs scope refinement, not rediscovery
- surface-only treatment can follow once base roles are clearer

conclusion:
The v2 frontier is now dominated by final role and scope decisions.
