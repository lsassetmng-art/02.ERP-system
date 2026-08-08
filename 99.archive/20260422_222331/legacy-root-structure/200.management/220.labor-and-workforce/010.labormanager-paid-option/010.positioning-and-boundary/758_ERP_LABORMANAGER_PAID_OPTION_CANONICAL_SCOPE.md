# ============================================================
# ERP LABORMANAGER PAID OPTION CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-758
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_paid_option.canonical_scope
component: labormanager-paid-option-canonical-scope


# IN SCOPE

- staff profile
- employment lifecycle
- attendance entry
- attendance correction
- leave request and approval
- onboarding checklist/case
- offboarding checklist/case
- training completion tracking
- compliance check result
- labor workload / compliance analytics


# OUT OF SCOPE FOR THIS PASS

- shift allocation engine
- payroll calculation engine
- recruiting ATS
- full benefits administration platform


# INTERPRETATION

LaborManager should be broad enough to own labor
administration truth, but not so broad that it absorbs
shift planning or unrelated HR domains.

