# ============================================================
# ERP SFA VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2380
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_vs_management.boundary_rule
component: sfa-vs-management-boundary-rule


# RULE

SFA owns:
- lead and opportunity execution truth
- forecast and next-action truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern SFA progression,
but management does not replace SFA-owned execution truth.

