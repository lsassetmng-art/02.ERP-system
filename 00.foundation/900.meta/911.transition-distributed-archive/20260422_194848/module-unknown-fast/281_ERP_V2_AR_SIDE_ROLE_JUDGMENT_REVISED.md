# ============================================================
# ERP V2 AR SIDE ROLE JUDGMENT REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the revised role judgment
for the AR-side family.

current_role_judgment:
- sales.billing_header:
  - strongest current AR-side header truth anchor

- sales.billing_detail:
  - strongest current AR-side detail/base candidate

- public.v_sales_billing_detail:
  - writable projection/read surface over sales.billing_detail

implication_for_v2:
AR-side no longer needs broad rediscovery.
It now needs final truth-scope judgment between header truth and detail truth.

conclusion:
AR-side is now in truth-scope refinement mode,
not candidate discovery mode.
