# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 LAYERED SURFACES
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Separates layered surface entries
from main truth entries in v2 actual freeze treatment.

already layered-frozen in v2:
- public.v_finance_payment_allocation

surface entries not yet layered-frozen:
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match
- public.approval_request_with_url

rule:
A surface entry may be frozen later in layered form
only after its underlying base/truth object is sufficiently fixed.

conclusion:
V2 uses layered freeze conservatively,
starting with the strongest settlement writable surface only.
