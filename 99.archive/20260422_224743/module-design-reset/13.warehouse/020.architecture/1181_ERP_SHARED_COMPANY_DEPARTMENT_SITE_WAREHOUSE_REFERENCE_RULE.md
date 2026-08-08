# ============================================================
# ERP SHARED COMPANY DEPARTMENT SITE WAREHOUSE REFERENCE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1181
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shared_company_department_site_warehouse.reference_rule
component: shared-company-department-site-warehouse-reference-rule


# RULE

The ERP corpus should treat the following as shared reference families:

- company reference
- department reference
- site reference
- warehouse reference where relevant

These references may appear across modules,
but reference reuse does not create shared ownership
of module-specific truths.

