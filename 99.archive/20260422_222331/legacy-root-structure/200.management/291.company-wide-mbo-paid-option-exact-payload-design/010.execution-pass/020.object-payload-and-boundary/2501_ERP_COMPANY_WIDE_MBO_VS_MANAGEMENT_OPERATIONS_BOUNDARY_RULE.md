# ============================================================
# ERP COMPANY WIDE MBO VS MANAGEMENT OPERATIONS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2501
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_vs_management_operations.boundary_rule
component: company-wide-mbo-vs-management-operations-boundary-rule


# RULE

company_wide_mbo owns:
- objective registry truth
- assignment truth
- progress review truth
- cycle closure truth

Management operations owns:
- generic review truth
- approval truth
- escalation truth

# CONSEQUENCE

An objective progress review is not generic approval truth.
Approval visibility may govern mbo progression,
but it does not replace company_wide_mbo-owned truth.

