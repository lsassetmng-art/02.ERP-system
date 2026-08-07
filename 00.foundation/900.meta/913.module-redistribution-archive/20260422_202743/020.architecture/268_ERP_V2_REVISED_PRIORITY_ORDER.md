# ============================================================
# ERP V2 REVISED PRIORITY ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the revised priority order after actual-result updates.

priority_order:
1. audit.approval_request vs system.approval_request
2. system.exec_run_request final freeze review
3. finance.payment_allocation / public.v_finance_payment_allocation final freeze review
4. AR/AP semantic rediscovery
5. settlement extra header/base truth check
6. lower-priority deferred families

why_this_order:
- approval has the biggest interpretation correction
- runtime now looks close to promotion
- settlement now looks close to promotion
- AR/AP needs rediscovery before promotion discussion can mature

conclusion:
The revised order narrows the v2 frontier to the most promising and highest-impact work first.
