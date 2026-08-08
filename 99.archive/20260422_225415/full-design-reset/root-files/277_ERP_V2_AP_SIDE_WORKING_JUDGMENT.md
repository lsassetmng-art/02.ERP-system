# ============================================================
# ERP V2 AP SIDE WORKING JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the current working judgment
for the payable-side family.

current_working_direction:
- public.v_purchase_purchase_three_way_match is the strongest current payable-side projection/read surface
- purchase.purchase_three_way_match is the strongest current payable-side process-side candidate
- purchase.purchase_invoice_detail and purchase.purchase_invoice are the strongest invoice-side payable anchors

interpretation:
Payable-side visibility is currently strongest through
purchase invoice and three-way-match families.

remaining_open_question:
- whether purchase_three_way_match is only operational reconciliation support
- whether purchase_invoice / purchase_invoice_detail should carry the stronger payable truth role

conclusion:
Payable-side AP currently leans toward purchase-invoice and three-way-match families.
