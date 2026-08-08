# ============================================================
# ERP MANAGEMENT CORE VS LABOR EPM AUDIT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1572
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_core_vs_labor_epm_audit.boundary_rule
component: management-core-vs-labor-epm-audit-boundary-rule


# RULE

LaborManager owns labor operation truth.
EPM owns objective / KPI / review-structure truth.
Audit owns audit conclusion truth.

Management core owns management-side interpretation and action truth.

# CONSEQUENCE

Management visibility may consume labor, epm, or audit context,
but it does not replace those modules' owned truths.

