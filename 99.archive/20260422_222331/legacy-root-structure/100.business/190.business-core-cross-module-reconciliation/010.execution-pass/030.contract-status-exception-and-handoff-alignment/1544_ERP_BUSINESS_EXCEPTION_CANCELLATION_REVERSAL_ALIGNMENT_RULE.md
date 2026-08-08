# ============================================================
# ERP BUSINESS EXCEPTION CANCELLATION REVERSAL ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1544
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business.exception_cancellation_reversal_alignment_rule
component: business-exception-cancellation-reversal-alignment-rule


# RULE

Business-core exception classes must remain distinct across modules.

Representative distinctions:
- cancellation is not return
- return is not accounting reversal
- reconciliation is not posting
- rework is not scrap
- amendment is not replacement without linkage

