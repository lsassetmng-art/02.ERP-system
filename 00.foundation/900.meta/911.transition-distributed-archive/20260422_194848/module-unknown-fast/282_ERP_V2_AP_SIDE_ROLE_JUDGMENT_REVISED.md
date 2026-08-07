# ============================================================
# ERP V2 AP SIDE ROLE JUDGMENT REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the revised role judgment
for the AP-side family.

current_role_judgment:
- purchase.purchase_invoice:
  - strongest current invoice/header anchor

- purchase.purchase_invoice_detail:
  - strongest current detail/base candidate

- purchase.purchase_three_way_match:
  - strongest current reconciliation/match candidate

- public.v_purchase_purchase_three_way_match:
  - writable projection/read surface over purchase.purchase_three_way_match

implication_for_v2:
AP-side no longer needs broad rediscovery.
It now needs final role judgment across:
- invoice truth
- detail truth
- match/reconciliation role

conclusion:
AP-side is now in role-hierarchy refinement mode,
not candidate discovery mode.
