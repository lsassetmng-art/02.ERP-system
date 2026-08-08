# ============================================================
# ERP COMPANY WIDE MBO SUBSYSTEM VS MANAGEMENT LABOR BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1720
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_subsystem_vs_management_labor.boundary_rule
component: company-wide-mbo-subsystem-vs-management-labor-boundary-rule


# RULE

Management core owns decision and directive truth.
LaborManager owns staff employment and labor operation truth.

company_wide_mbo subsystem owns:
- inherited assignment truth
- progress review truth
- evaluation support truth

# CONSEQUENCE

Management and labor context may constrain or inform mbo rollout,
but they do not replace subsystem-owned inherited-operation truth.

