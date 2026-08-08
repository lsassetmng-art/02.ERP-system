# ============================================================
# ERP CRM PAID OPTION TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2336
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_paid_option.truth_map
component: crm-paid-option-truth-map


# CRM TRUTH MAP

CRM owns:
- customer account truth
- customer contact truth
- relationship interaction continuity truth
- segment assignment truth
- relationship health visibility truth

Adjacent lines own:
- SFA = lead and opportunity execution truth
- sales core = quote and order truth
- management = review and approval truth

