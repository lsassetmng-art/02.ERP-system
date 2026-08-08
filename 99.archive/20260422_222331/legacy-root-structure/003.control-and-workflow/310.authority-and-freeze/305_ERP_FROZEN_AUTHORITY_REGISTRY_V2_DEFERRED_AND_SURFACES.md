# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 DEFERRED AND SURFACES
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Separates remaining deferred entries
from projection/surface-only review entries in the v2 draft.

still_deferred:
- integration.integration_job
- system.approval_request
- notify.approval_request
- unresolved settlement extra header/base truth
- unresolved AR-side final scope split
- unresolved AP-side final scope split

surface_review_only:
- public.v_finance_payment_allocation
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match
- public.approval_request_with_url

rule:
Surface-side entries should not outrank stronger underlying base/truth objects.

conclusion:
The v2 draft remains selective by keeping deferred entries
and surface-side entries clearly separated.
