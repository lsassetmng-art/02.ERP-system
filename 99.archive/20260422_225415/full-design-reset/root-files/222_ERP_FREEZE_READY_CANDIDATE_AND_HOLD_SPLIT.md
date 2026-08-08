# ============================================================
# ERP FREEZE READY CANDIDATE AND HOLD SPLIT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Separates entries that are likely freeze-ready now
from those that should remain on hold.

likely_freeze_ready_now:
- public.accounting_period
- public.journal_entries
- public.journal_lines
- ops.ops_job_queue
- ops.ops_job_result
- cron.job_run_details
- integration.integration_outbox
- core.sync_queue
- sales.order_header
- purchase.purchase_order_header
- sales.billing_header
- sales.return_header
- sales.shipping_header
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header

hold_for_final_verification:
- system.exec_run_request
- integration.integration_job
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview
- workflow.approval_request
- system.approval_request

reason_for_hold:
These still contain one or more of:
- final authority competition
- feeder/base-truth ambiguity
- unresolved active-truth topology

conclusion:
This split defines the practical boundary
for assembling frozen authority registry v1.
