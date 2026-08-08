# ============================================================
# ERP HEADER PAIR COMPARISON BILLING RETURN SHIPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass pair comparison for:
- public.billing_header vs sales.billing_header
- public.return_header vs sales.return_header
- public.shipping_header vs sales.shipping_header

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. BILLING HEADER PAIR
# ============================================================

pair_target:
- public.billing_header
- sales.billing_header

working_judgment:
- semantic owner likely remains business-side billing/accounting-adjacent
- public.billing_header may be authoritative or shared-facing truth
- sales.billing_header may be sales bridge-side truth or duplicate/transitional candidate

primary_next_check:
- invoice/billing identifiers
- customer linkage
- source order/shipment linkage
- status/finality fields
- amount/currency fields

# ============================================================
# 2. RETURN HEADER PAIR
# ============================================================

pair_target:
- public.return_header
- sales.return_header

working_judgment:
- semantic owner likely remains sales fulfillment/return-side business truth
- public.return_header may be shared-facing truth candidate
- sales.return_header may be domain-side truth or duplicate/transitional candidate

primary_next_check:
- return reason/status
- source order or shipment linkage
- lifecycle/finality fields
- quantity/amount implications

# ============================================================
# 3. SHIPPING HEADER PAIR
# ============================================================

pair_target:
- public.shipping_header
- sales.shipping_header

working_judgment:
- semantic owner likely remains shipping / sales fulfillment side
- public.shipping_header may be shared-facing or authoritative truth candidate
- sales.shipping_header may be fulfillment-side truth or duplicate/transitional candidate

primary_next_check:
- shipment identifiers
- warehouse/customer linkage
- ship status
- shipment dates
- carrier/tracking fields

# ============================================================
# 4. OVERALL PAIR JUDGMENT
# ============================================================

overall_pair_judgment:
These pairs strongly suggest one of:
- public as authoritative + sales as domain duplicate/transitional
- sales as authoritative + public as shared mirror/read-model
- incomplete migration split

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Billing, return, and shipping header pairs remain unresolved,
but are now clearly formal pairwise comparison targets.
