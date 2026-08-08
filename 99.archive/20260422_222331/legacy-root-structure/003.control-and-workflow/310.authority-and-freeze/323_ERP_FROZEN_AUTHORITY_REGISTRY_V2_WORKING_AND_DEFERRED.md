# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 WORKING AND DEFERRED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Separates working-draft and deferred families
after actual v2 freeze treatment.

working_draft_families:
- sales.billing_header
- sales.billing_detail
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match

deferred_companions_or_scope_open:
- integration.integration_job
- system.approval_request
- notify.approval_request
- broader settlement extra-truth scope

main_reason:
These entries are no longer blocked by discovery,
but some still require final scope-split or layered-placement judgment.

conclusion:
V2 actual freeze remains selective by keeping AR/AP as structured working draft
and weaker companions as deferred.
