# ============================================================
# ERP V2 AR/AP RECEIVABLE SIDE WORKING CANDIDATES
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records current working candidates
for the receivable-side AR/AP surface.

working_candidates:
- public.v_sales_billing_detail
- sales billing-related detail families
- invoice-adjacent sales-side detail families

why_these_are_current_candidates:
- sales-side billing terminology is present
- invoice/billing semantics appear stronger than receivable-preview naming
- AR/AP exact preview names were not confirmed

not_yet_claimed:
- final receivable base truth
- final receivable ledger truth
- final receivable frozen authority

conclusion:
Receivable-side AR/AP should currently be explored
through billing/invoice-adjacent sales families.
