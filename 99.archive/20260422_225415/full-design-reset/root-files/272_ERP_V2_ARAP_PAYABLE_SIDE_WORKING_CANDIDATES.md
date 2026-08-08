# ============================================================
# ERP V2 AR/AP PAYABLE SIDE WORKING CANDIDATES
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records current working candidates
for the payable-side AR/AP surface.

working_candidates:
- public.v_purchase_purchase_invoice
- public.v_purchase_purchase_invoice_detail
- public.v_purchase_purchase_three_way_match

why_these_are_current_candidates:
- purchase invoice semantics are clearly present
- three-way-match semantics strongly align with payable-side operational review
- payable-preview exact names were not confirmed

not_yet_claimed:
- final payable base truth
- final payable ledger truth
- final payable frozen authority

conclusion:
Payable-side AR/AP should currently be explored
through purchase invoice and three-way-match families.
