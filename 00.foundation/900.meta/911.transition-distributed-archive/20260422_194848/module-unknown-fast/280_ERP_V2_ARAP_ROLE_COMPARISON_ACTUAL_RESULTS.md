# ============================================================
# ERP V2 AR/AP ROLE COMPARISON ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual role-comparison findings
for AR/AP after candidate hierarchy inspection.

review_basis:
- .tmp/erp-arap-role-compare/901_ar_role_compare.txt
- .tmp/erp-arap-role-compare/902_ap_role_compare.txt
- .tmp/erp-arap-role-compare/903_arap_role_compare_counts.txt

main_findings:
- sales.billing_header is confirmed as a strong sales-side header anchor
- sales.billing_detail is confirmed as a strong sales-side detail/base candidate
- public.v_sales_billing_detail is confirmed as a writable projection surface over sales.billing_detail

- purchase.purchase_invoice is confirmed as a strong purchase-side invoice anchor
- purchase.purchase_invoice_detail is confirmed as a strong purchase-side detail/base candidate
- purchase.purchase_three_way_match is confirmed as a strong payable-side reconciliation candidate
- public.v_purchase_purchase_three_way_match is confirmed as a writable projection surface over purchase.purchase_three_way_match

conclusion:
AR/AP role comparison now supports a layered interpretation
rather than a single-object interpretation.
