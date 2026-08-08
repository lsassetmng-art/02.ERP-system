# ============================================================
# ERP EPM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2447
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.boundary_rule
component: epm-boundary-rule


# RULE

EPM owns:
- performance planning truth
- coordination truth
- snapshot truth

Accounting owns:
- posting truth
- financial position truth

company_wide_mbo owns:
- objective registry and progress truth

Management owns:
- review and approval truth

# CONSEQUENCE

A variance snapshot is not accounting posting truth.
A performance plan is not objective registry truth.
EPM may consume accounting and objective visibility,
but it does not replace those owned truths.

