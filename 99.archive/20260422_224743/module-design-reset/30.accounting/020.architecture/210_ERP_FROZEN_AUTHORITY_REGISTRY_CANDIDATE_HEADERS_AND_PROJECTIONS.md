# ============================================================
# ERP FROZEN AUTHORITY REGISTRY CANDIDATE
# HEADERS AND PROJECTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the first frozen-registry candidates
for header authority and public projection families.

candidate_registry:

  sales.order_header:
    semantic_owner:
    - 100.business / 110.sales
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strong domain-side operational evidence
    - public counterpart confirmed as CREATE VIEW read surface

  public.order_header:
    semantic_owner:
    - shared read exposure for sales order
    registry_class:
    - projection_or_view
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - CREATE VIEW evidence
    - public read-surface role strongly supported

  purchase.purchase_order_header:
    semantic_owner:
    - 100.business / 120.purchase
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strong purchase-side operational evidence
    - public counterpart strongly projection-side

  public.purchase_order_header:
    semantic_owner:
    - shared read exposure for purchase order
    registry_class:
    - projection_or_view
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - CREATE VIEW evidence pattern strongly supports role

  sales.billing_header:
    semantic_owner:
    - business billing/accounting-adjacent truth
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strong operational evidence
    - public counterpart strongly projection-side

  public.billing_header:
    semantic_owner:
    - shared read exposure for billing
    registry_class:
    - projection_or_view
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - CREATE VIEW evidence

  sales.return_header:
    semantic_owner:
    - sales / fulfillment return truth
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strong operational evidence
    - public counterpart reads from sales.return_header

  public.return_header:
    semantic_owner:
    - shared read exposure for return
    registry_class:
    - projection_or_view
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - CREATE VIEW evidence
    - FROM sales.return_header evidence

  sales.shipping_header:
    semantic_owner:
    - shipping / fulfillment truth
    registry_class:
    - source_of_truth_candidate
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - strong operational evidence
    - public counterpart reads from sales.shipping_header

  public.shipping_header:
    semantic_owner:
    - shared read exposure for shipping
    registry_class:
    - projection_or_view
    promotion_status:
    - frozen_candidate_ready
    reasons:
    - CREATE VIEW evidence
    - FROM sales.shipping_header evidence

conclusion:
Header-side authority and projection families are now
among the best candidates for near-freeze promotion.
