# ============================================================
# ERP SFA PAID OPTION TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2368
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.truth_map
component: sfa-paid-option-truth-map


# SFA TRUTH MAP

SFA owns:
- lead execution truth
- opportunity progression truth
- forecast visibility truth
- next-action execution truth

Adjacent lines own:
- CRM = customer relationship foundation truth
- sales core = quote and order truth
- management = review and approval truth

