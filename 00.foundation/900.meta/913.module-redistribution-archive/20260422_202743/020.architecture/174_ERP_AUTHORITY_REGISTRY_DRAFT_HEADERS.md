# ============================================================
# ERP AUTHORITY REGISTRY DRAFT HEADERS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current header/document-side authority registry draft.

header_registry:

  sales.order_header:
    semantic_owner:
    - 100.business / 110.sales
    working_role:
    - operational write-authority candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - high

  public.order_header:
    semantic_owner:
    - shared read exposure for sales order
    working_role:
    - public view-based read surface
    registry_class:
    - projection_or_view
    confidence:
    - high

  purchase.purchase_order_header:
    semantic_owner:
    - 100.business / 120.purchase
    working_role:
    - operational write-authority candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - high

  public.purchase_order_header:
    semantic_owner:
    - shared read exposure for purchase order
    working_role:
    - public view-based read surface
    registry_class:
    - projection_or_view
    confidence:
    - high

  sales.billing_header:
    semantic_owner:
    - business billing/accounting-adjacent truth
    working_role:
    - operational write-authority candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - high

  public.billing_header:
    semantic_owner:
    - shared read exposure for billing
    working_role:
    - public view-based read surface
    registry_class:
    - projection_or_view
    confidence:
    - high

  sales.return_header:
    semantic_owner:
    - sales / fulfillment return truth
    working_role:
    - operational write-authority candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - high

  public.return_header:
    semantic_owner:
    - shared read exposure for return
    working_role:
    - public view-based read surface
    registry_class:
    - projection_or_view
    confidence:
    - high

  sales.shipping_header:
    semantic_owner:
    - shipping / fulfillment truth
    working_role:
    - operational write-authority candidate
    registry_class:
    - source_of_truth_candidate
    confidence:
    - high

  public.shipping_header:
    semantic_owner:
    - shared read exposure for shipping
    working_role:
    - public view-based read surface
    registry_class:
    - projection_or_view
    confidence:
    - high

conclusion:
Header registry draft now strongly favors
domain-side authority and public-side view/projection interpretation.
