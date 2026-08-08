# ============================================================
# ERP SFA PAID OPTION CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-720
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_paid_option.canonical_scope
component: sfa-paid-option-canonical-scope


# IN SCOPE

- lead management
- opportunity management
- pipeline stage management
- sales action / next action
- opportunity owner assignment
- win / loss classification
- forecast treatment
- sales workload and pipeline analytics


# OUT OF SCOPE FOR THIS PASS

- quote engine
- order execution
- billing execution
- CRM inquiry history ownership
- inventory allocation
- manufacturing planning


# INTERPRETATION

SFA should be broad enough to own sales execution flow,
but not so broad that it absorbs downstream business truth
or upstream CRM customer truth.

