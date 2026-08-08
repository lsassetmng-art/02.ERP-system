# ============================================================
# ERP V2 NEXT ACTIONS AFTER ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next actions after the new v2 actual results.

next_actions:
1. promote system.exec_run_request toward frozen-v2 candidate review
2. promote audit.approval_request toward frozen-v2 candidate review
3. promote finance.payment_allocation and public.v_finance_payment_allocation toward stronger candidate review
4. perform AR/AP semantic rediscovery
5. revise deferred-entry queue to reflect the new strongest candidates

expected_effect:
- smaller unresolved set
- stronger v2 candidate shortlist
- less dependence on older provisional assumptions

conclusion:
The v2 path is now clearer than before:
runtime, settlement, and approval have stronger anchors,
while AR/AP remains the main rediscovery target.
