# ============================================================
# ERP EPM VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2470
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_vs_management.boundary_rule
component: epm-vs-management-boundary-rule


# RULE

EPM owns:
- planning and coordination truth
- snapshot truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern EPM progression,
but management does not replace EPM-owned planning truth.

