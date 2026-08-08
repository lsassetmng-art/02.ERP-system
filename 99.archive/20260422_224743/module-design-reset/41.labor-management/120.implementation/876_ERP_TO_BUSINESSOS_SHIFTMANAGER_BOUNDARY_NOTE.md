# ============================================================
# ERP TO BUSINESSOS SHIFTMANAGER BOUNDARY NOTE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-876
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.to_businessos.shiftmanager.boundary_note
component: erp-to-businessos-shiftmanager-boundary-note


# RULE

ERP and BusinessOS ShiftManager remain linked but distinct.

ERP provides or governs:
- staff eligibility
- leave status
- labor constraints
- compliance blocks where relevant

BusinessOS ShiftManager provides:
- shift planning
- preference submission
- assignment execution
- swap workflow
- roster publication


# INTERPRETATION

ERP owns labor truth.
BusinessOS ShiftManager owns shift execution app behavior.

