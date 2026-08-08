# ============================================================
# ERP V2 AR SIDE WORKING JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the current working judgment
for the receivable-side family.

current_working_direction:
- public.v_sales_billing_detail is the strongest current receivable-side projection/read surface
- sales.billing_detail is the strongest current receivable-side detail/base candidate
- sales.billing_header remains the parent header-side anchor

interpretation:
Receivable-side visibility is currently strongest through
billing detail and billing header families,
not through the older assumed accrual-preview naming.

remaining_open_question:
- whether a more ledger-native receivable truth exists elsewhere
- whether billing-side truth is sufficient for frozen-v2 scope

conclusion:
Receivable-side AR currently leans toward billing-side truth and projection families.
