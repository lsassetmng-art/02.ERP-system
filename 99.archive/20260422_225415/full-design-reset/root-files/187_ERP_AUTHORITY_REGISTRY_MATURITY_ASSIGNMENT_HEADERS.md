# ============================================================
# ERP AUTHORITY REGISTRY MATURITY ASSIGNMENT HEADERS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Assigns current authority maturity levels
to header/document-side registry entries.

header_maturity_assignment:

  sales.order_header:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - frozen_candidate
    rationale:
    - strong domain-side operational evidence
    - public counterpart confirmed as view-based read surface

  public.order_header:
    registry_class:
    - projection_or_view
    maturity:
    - frozen_candidate
    rationale:
    - direct CREATE VIEW evidence
    - read-surface interpretation strongly supported

  purchase.purchase_order_header:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - frozen_candidate
    rationale:
    - strong purchase-side operational evidence
    - public counterpart strongly treated as view-side exposure

  public.purchase_order_header:
    registry_class:
    - projection_or_view
    maturity:
    - frozen_candidate
    rationale:
    - direct CREATE VIEW evidence pattern strongly supports role

  sales.billing_header:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - frozen_candidate
    rationale:
    - strong operational/domain evidence
    - public counterpart confirmed as view family

  public.billing_header:
    registry_class:
    - projection_or_view
    maturity:
    - frozen_candidate
    rationale:
    - direct CREATE VIEW evidence

  sales.return_header:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - frozen_candidate
    rationale:
    - strong operational/domain evidence
    - public counterpart reads from sales.return_header

  public.return_header:
    registry_class:
    - projection_or_view
    maturity:
    - frozen_candidate
    rationale:
    - CREATE VIEW evidence
    - FROM sales.return_header evidence

  sales.shipping_header:
    registry_class:
    - source_of_truth_candidate
    maturity:
    - frozen_candidate
    rationale:
    - strong operational/domain evidence
    - public counterpart reads from sales.shipping_header

  public.shipping_header:
    registry_class:
    - projection_or_view
    maturity:
    - frozen_candidate
    rationale:
    - CREATE VIEW evidence
    - FROM sales.shipping_header evidence

conclusion:
Header-side maturity is now strong enough
for broad frozen_candidate treatment in the first pass.
