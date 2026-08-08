# ============================================================
# ERP SHIFTMANAGER AND BUSINESS TO LABORMANAGER HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1654
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.shiftmanager_and_business_to_labormanager.handoff_rule
component: shiftmanager-and-business-to-labormanager-handoff-rule


# RULE

ShiftManager and business-side workflows may hand off:
- confirmed shift assignment context
- swap / coverage result context
- department staffing context
- onboarding or offboarding trigger context

LaborManager creates new owned truths:
- attendance record
- leave request
- employment lifecycle case
- labor compliance case

