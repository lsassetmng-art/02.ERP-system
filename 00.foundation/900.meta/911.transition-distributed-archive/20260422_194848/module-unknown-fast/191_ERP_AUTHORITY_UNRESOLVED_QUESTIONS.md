# ============================================================
# ERP AUTHORITY UNRESOLVED QUESTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Concentrates the main unresolved authority questions
in one place.

unresolved_questions:
- Is system.exec_run_request definitively stronger than integration.integration_job as runtime truth?
- Does settlement truth have a distinct header table beyond finance.payment_allocation?
- What are the exact feeder/base tables beneath public.v_ar_accrual_preview and public.v_ap_accrual_preview?
- Is workflow.approval_request definitively stronger than system.approval_request as true approval authority?
- Are there any remaining hidden writable-view or unusual sync paths that would materially alter current registry judgments?

why_this_doc_exists:
The authority registry draft is strong,
but these unresolved questions still block broader freezing.

conclusion:
These questions define the remaining frontier
between hardened registry interpretation and frozen authority.
