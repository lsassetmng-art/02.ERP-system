# ============================================================
# ERP V2 AR/AP REDISCOVERY SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current state of AR/AP rediscovery in v2.

summary:
- exact accrual-preview names were not confirmed
- semantic rediscovery succeeded in finding stronger invoice/billing/purchase-invoice candidate surfaces
- receivable-side now leans toward billing/invoice detail families
- payable-side now leans toward purchase invoice / three-way-match families

main_change:
AR/AP is no longer blocked by a total lack of candidates.
It is now blocked by needing view-definition and base-table inspection
for a better candidate hierarchy.

conclusion:
AR/AP has moved from name-gap uncertainty
to targeted candidate inspection mode.
