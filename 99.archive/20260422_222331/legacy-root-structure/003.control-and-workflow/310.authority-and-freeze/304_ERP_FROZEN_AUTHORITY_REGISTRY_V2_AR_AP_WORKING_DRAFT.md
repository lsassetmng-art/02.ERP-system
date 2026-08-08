# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 AR/AP WORKING DRAFT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current working-draft position
for AR/AP in frozen-v2 preparation.

ar_side_working_entries:

  sales.billing_header:
    registry_class:
    - header_truth_anchor_candidate
    draft_freeze_status:
    - working_review
    rationale:
    - strongest current AR-side header anchor

  sales.billing_detail:
    registry_class:
    - detail_truth_candidate
    draft_freeze_status:
    - working_review
    rationale:
    - strongest current AR-side detail/base candidate

  public.v_sales_billing_detail:
    registry_class:
    - projection_or_writable_surface
    draft_freeze_status:
    - surface_review_only
    rationale:
    - writable projection over sales.billing_detail

ap_side_working_entries:

  purchase.purchase_invoice:
    registry_class:
    - invoice_truth_anchor_candidate
    draft_freeze_status:
    - working_review
    rationale:
    - strongest current AP-side invoice/header anchor

  purchase.purchase_invoice_detail:
    registry_class:
    - detail_truth_candidate
    draft_freeze_status:
    - working_review
    rationale:
    - strongest current AP-side detail/base candidate

  purchase.purchase_three_way_match:
    registry_class:
    - reconciliation_candidate
    draft_freeze_status:
    - working_review
    rationale:
    - strongly connected to invoice/detail/order/receipt structure

  public.v_purchase_purchase_three_way_match:
    registry_class:
    - projection_or_writable_surface
    draft_freeze_status:
    - surface_review_only
    rationale:
    - writable projection over purchase.purchase_three_way_match

why_still_working_draft:
- AR-side final scope split is not closed
- AP-side final hierarchy between invoice/detail/match is not closed

conclusion:
AR/AP enters frozen-v2 as a working draft,
not yet as a fully frozen layer.
