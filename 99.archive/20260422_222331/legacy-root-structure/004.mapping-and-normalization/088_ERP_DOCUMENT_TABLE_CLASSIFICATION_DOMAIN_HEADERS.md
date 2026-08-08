# ============================================================
# ERP DOCUMENT TABLE CLASSIFICATION DOMAIN HEADERS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass canonical classification
for domain-specific document header families.

review_basis:
- erp_schema_table_column_full.txt

tables:
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header
- sales.order_header
- sales.billing_header
- sales.return_header
- sales.shipping_header
- purchase.purchase_order_header

# ============================================================
# 1. CURRENT WORKING INTERPRETATION
# ============================================================

current_working_interpretation:
These tables strongly suggest domain-specific document truth
rather than one shared generic document master table.

# ============================================================
# 2. LIKELY CLASSIFICATION
# ============================================================

public.order_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - 110.sales
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium

sales.order_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - 110.sales
  canonical_table_class:
  - source_of_truth or duplicated domain truth candidate
  confidence:
  - low_to_medium

public.purchase_order_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - 120.purchase
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium

purchase.purchase_order_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - 120.purchase
  canonical_table_class:
  - source_of_truth or duplicated domain truth candidate
  confidence:
  - low_to-medium

public.billing_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - billing/accounting-adjacent business truth
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium

sales.billing_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - sales/billing bridge-side truth or duplicate candidate
  canonical_table_class:
  - source_of_truth or bridge-side duplicated truth
  confidence:
  - low_to_medium

public.return_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - sales return/order fulfillment-adjacent truth
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium

sales.return_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - sales return truth or duplicate candidate
  canonical_table_class:
  - source_of_truth or duplicate candidate
  confidence:
  - low_to_medium

public.shipping_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - shipping / sales fulfillment-adjacent truth
  canonical_table_class:
  - source_of_truth
  confidence:
  - medium

sales.shipping_header:
  canonical_layer:
  - 100.business
  canonical_module:
  - shipping / sales fulfillment truth or duplicate candidate
  canonical_table_class:
  - source_of_truth or duplicate candidate
  confidence:
  - low_to_medium

# ============================================================
# 3. PRIMARY WARNING
# ============================================================

primary_warning:
The coexistence of public.*_header and sales/purchase.*_header
suggests one of these possibilities:
- duplicated domain truth
- legacy/transitional relocation
- public read-model mirrors
- domain-local physical split

# ============================================================
# 4. NEXT CHECK
# ============================================================

next_check:
Inspect columns for:
- identical/similar header structures
- lifecycle/status fields
- domain-specific foreign keys
- created/updated timestamps
- company/tenant scoping
- whether public copies are views/materialized tables/real tables

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Document truth currently appears domain-header-based,
but public vs domain-schema duplication/transitional questions remain unresolved.
