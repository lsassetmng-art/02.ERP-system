# ============================================================
# ERP EPM MANAGEMENT LABOR TO COMPANY WIDE MBO HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1728
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_management_labor_to_company_wide_mbo.handoff_rule
component: epm-management-labor-to-company-wide-mbo-handoff-rule


# RULE

EPM, management core, and LaborManager may hand off:
- inherited objective context
- reviewed priority context
- assignee role or staff-context visibility
- evaluation preparation context

company_wide_mbo creates new owned truths:
- mbo program
- objective cascade
- assignment record
- progress review
- evaluation support case

