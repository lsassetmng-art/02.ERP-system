# ============================================================
# ERP HEADER PAIR ACTUAL RESULTS ORDER AND PURCHASE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual pairwise column comparison findings for:
- public.order_header vs sales.order_header
- public.purchase_order_header vs purchase.purchase_order_header

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. ORDER HEADER PAIR ACTUAL FINDINGS
# ============================================================

pair_target:
- public.order_header
- sales.order_header

public.order_header observed columns:
- order_id
- company_id
- order_no
- customer_id
- order_date
- status_code
- remarks
- created_by
- created_at

sales.order_header observed columns:
- order_id
- company_id
- order_no
- customer_id
- order_date
- status_code
- remarks
- created_by
- created_at

actual_result:
The observed column structures are effectively identical.

working_judgment:
- strong duplicate_or_mirror signal
- not merely semantically similar; structurally almost the same
- requires deciding which is:
  - source_of_truth
  - mirror/read-model
  - transitional duplicate

confidence:
- high for structural similarity
- unresolved for final authoritative placement

# ============================================================
# 2. PURCHASE ORDER HEADER PAIR ACTUAL FINDINGS
# ============================================================

pair_target:
- public.purchase_order_header
- purchase.purchase_order_header

public.purchase_order_header observed columns:
- purchase_order_id
- company_id
- purchase_order_no
- supplier_id
- order_date
- status_code
- created_by
- created_at

purchase.purchase_order_header observed columns:
- purchase_order_id
- company_id
- purchase_order_no
- supplier_id
- order_date
- status_code
- created_by
- created_at

actual_result:
The observed column structures are effectively identical.

working_judgment:
- strong duplicate_or_mirror signal
- likely same logical header model stored in two physical placements
- requires deciding authoritative placement vs mirror/transitional status

confidence:
- high for structural similarity
- unresolved for final authoritative placement

# ============================================================
# 3. CONCLUSION
# ============================================================

conclusion:
Order and purchase-order header pairs now have strong actual evidence
for duplicate/mirror/transitional pair behavior.
