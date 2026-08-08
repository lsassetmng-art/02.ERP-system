# ============================================================
# ERP CRM TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2322
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm.truth_map
component: crm-truth-map


# CRM TRUTH MAP

CRM owns:
- customer relationship foundation truth
- customer account truth
- customer contact truth
- relationship interaction continuity truth
- segment and health visibility truth

Adjacent lines own:
- SFA = lead and opportunity execution truth
- sales core = quote and order truth
- management = review and approval truth

