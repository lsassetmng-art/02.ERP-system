# ============================================================
# ERP HEADER PAIR ACTUAL RESULTS BILLING RETURN SHIPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual pairwise column comparison findings for:
- public.billing_header vs sales.billing_header
- public.return_header vs sales.return_header
- public.shipping_header vs sales.shipping_header

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. BILLING HEADER PAIR ACTUAL FINDINGS
# ============================================================

pair_target:
- public.billing_header
- sales.billing_header

public.billing_header observed columns:
- billing_id
- company_id
- billing_no
- customer_id
- billing_date
- status_code
- total_amount
- created_by
- created_at

sales.billing_header observed columns:
- billing_id
- company_id
- billing_no
- customer_id
- billing_date
- status_code
- total_amount
- created_by
- created_at
- original_billing_id

actual_result:
The structures are highly similar,
with sales.billing_header containing one additional column:
- original_billing_id

working_judgment:
- strong duplicate_or_mirror signal
- sales.billing_header may be:
  - an extended domain variant
  - a transitional superset
  - or the more operational version of the same logical header

confidence:
- high for strong similarity
- unresolved for authoritative placement

# ============================================================
# 2. RETURN HEADER PAIR ACTUAL FINDINGS
# ============================================================

pair_target:
- public.return_header
- sales.return_header

public.return_header observed columns:
- return_id
- company_id
- return_no
- billing_id
- return_date
- status_code
- created_by
- created_at

sales.return_header observed columns:
- return_id
- company_id
- return_no
- billing_id
- return_date
- status_code
- created_by
- created_at
- shipping_id

actual_result:
The structures are highly similar,
with sales.return_header containing one additional column:
- shipping_id

working_judgment:
- strong duplicate_or_mirror signal
- sales.return_header may be:
  - an extended fulfillment-aware variant
  - a transitional superset
  - or the more domain-operational version

confidence:
- high for strong similarity
- unresolved for authoritative placement

# ============================================================
# 3. SHIPPING HEADER PAIR ACTUAL FINDINGS
# ============================================================

pair_target:
- public.shipping_header
- sales.shipping_header

public.shipping_header observed columns:
- shipping_id
- company_id
- shipping_no
- order_id
- shipping_date
- status_code
- shipping_fee
- created_by
- created_at

sales.shipping_header observed columns:
- shipping_id
- company_id
- shipping_no
- order_id
- shipping_date
- status_code
- shipping_fee
- created_by
- created_at

actual_result:
The observed column structures are effectively identical.

working_judgment:
- strong duplicate_or_mirror signal
- likely same logical header family in two placements

confidence:
- high for structural similarity
- unresolved for authoritative placement

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
Billing, return, and shipping header pairs all show strong structural overlap.
Billing and return appear as slightly extended domain-side variants,
while shipping appears fully duplicated in structure.
