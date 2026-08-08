# ============================================================
# ERP QUALITY MANAGEMENT VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2725
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management_vs_management.boundary_rule
component: quality-management-vs-management-boundary-rule


# RULE

Quality management owns:
- inspection truth
- corrective-action truth
- release-decision truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may govern quality progression,
but management does not replace quality-owned truth.

