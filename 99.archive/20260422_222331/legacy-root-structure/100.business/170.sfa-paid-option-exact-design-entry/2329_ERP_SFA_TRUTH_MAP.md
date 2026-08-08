# ============================================================
# ERP SFA TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2329
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa.truth_map
component: sfa-truth-map


# SFA TRUTH MAP

SFA owns:
- lead execution truth
- opportunity progression truth
- next-action execution truth
- forecast visibility truth

Adjacent lines own:
- CRM = customer relationship foundation truth
- sales core = quote and order truth
- management = review and approval truth

