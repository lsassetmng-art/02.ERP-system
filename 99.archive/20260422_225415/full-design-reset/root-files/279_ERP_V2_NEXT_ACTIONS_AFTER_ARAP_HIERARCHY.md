# ============================================================
# ERP V2 NEXT ACTIONS AFTER AR/AP HIERARCHY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next actions after AR/AP candidate hierarchy confirmation.

next_actions:
1. compare sales.billing_header vs sales.billing_detail roles for AR-side truth
2. compare purchase.purchase_invoice vs purchase.purchase_invoice_detail vs purchase.purchase_three_way_match roles for AP-side truth
3. decide which AR/AP candidates are projection-only
4. decide which AR/AP candidates are strong enough for frozen-v2 candidacy
5. revise deferred queue and v2 shortlist again after those decisions

conclusion:
AR/AP is now ready for role-comparison work,
not broad rediscovery anymore.
