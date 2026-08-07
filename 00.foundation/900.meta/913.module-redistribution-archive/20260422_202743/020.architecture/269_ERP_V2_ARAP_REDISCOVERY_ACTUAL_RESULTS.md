# ============================================================
# ERP V2 AR/AP REDISCOVERY ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the actual rediscovery-stage findings
for AR/AP after exact-name failure.

review_basis:
- .tmp/erp-arap-rediscovery/701_arap_semantic_hits.txt
- .tmp/erp-arap-rediscovery/702_arap_view_table_candidates.txt
- .tmp/erp-arap-rediscovery/703_arap_candidate_counts.txt

main_findings:
- exact names public.v_ar_accrual_preview and public.v_ap_accrual_preview were not confirmed
- semantic rediscovery produced stronger candidates around:
  - purchase invoice
  - billing detail
  - purchase three-way match
  - sales detail / invoice-adjacent detail families
- AR/AP appears to be represented through invoice/billing/purchase structures
  rather than the previously assumed accrual-preview names

candidate_surfaces_found:
- public.v_purchase_purchase_invoice
- public.v_purchase_purchase_invoice_detail
- public.v_purchase_purchase_three_way_match
- public.v_sales_billing_detail

supporting_observation:
The current dump vocabulary is stronger in:
- invoice
- billing
- purchase invoice
- three-way match
than in:
- receivable preview
- payable preview
- exact accrual preview names

conclusion:
AR/AP rediscovery materially shifts the candidate space
from assumed accrual-preview names
toward invoice/billing/purchase-invoice families.
