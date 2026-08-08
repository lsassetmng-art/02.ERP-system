# ============================================================
# ERP SFA VS CRM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2378
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_vs_crm.boundary_rule
component: sfa-vs-crm-boundary-rule


# RULE

SFA owns:
- lead execution truth
- opportunity progression truth
- forecast and next-action truth

CRM owns:
- customer relationship foundation truth
- account and contact continuity truth

# CONSEQUENCE

A lead is not a customer account.
An opportunity is not an interaction case.
SFA may consume CRM references,
but it does not replace CRM-owned relationship truth.

