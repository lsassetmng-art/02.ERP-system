# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V1
# HEADERS AND PROJECTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records frozen v1 entries for header truth families
and public projection/view families.

frozen_truth_entries:

  sales.order_header:
    semantic_owner:
    - 100.business / 110.sales
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strong operational evidence
    - public counterpart confirmed as view

  purchase.purchase_order_header:
    semantic_owner:
    - 100.business / 120.purchase
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strong purchase-side operational evidence
    - public counterpart projection-side

  sales.billing_header:
    semantic_owner:
    - business billing/accounting-adjacent truth
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strong operational evidence
    - public counterpart projection-side

  sales.return_header:
    semantic_owner:
    - sales / fulfillment return truth
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strong operational evidence
    - public counterpart reads from sales.return_header

  sales.shipping_header:
    semantic_owner:
    - shipping / fulfillment truth
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    rationale:
    - strong operational evidence
    - public counterpart reads from sales.shipping_header

frozen_projection_entries:

  public.order_header:
    semantic_owner:
    - shared read exposure for sales order
    registry_class:
    - projection_or_view
    freeze_status:
    - frozen
    rationale:
    - CREATE VIEW evidence
    - read-surface role strongly supported

  public.purchase_order_header:
    semantic_owner:
    - shared read exposure for purchase order
    registry_class:
    - projection_or_view
    freeze_status:
    - frozen
    rationale:
    - CREATE VIEW evidence pattern strongly supports role

  public.billing_header:
    semantic_owner:
    - shared read exposure for billing
    registry_class:
    - projection_or_view
    freeze_status:
    - frozen
    rationale:
    - CREATE VIEW evidence

  public.return_header:
    semantic_owner:
    - shared read exposure for return
    registry_class:
    - projection_or_view
    freeze_status:
    - frozen
    rationale:
    - CREATE VIEW evidence
    - FROM sales.return_header evidence

  public.shipping_header:
    semantic_owner:
    - shared read exposure for shipping
    registry_class:
    - projection_or_view
    freeze_status:
    - frozen
    rationale:
    - CREATE VIEW evidence
    - FROM sales.shipping_header evidence

conclusion:
Header-side truth/projection split is strong enough
to be frozen in v1.
