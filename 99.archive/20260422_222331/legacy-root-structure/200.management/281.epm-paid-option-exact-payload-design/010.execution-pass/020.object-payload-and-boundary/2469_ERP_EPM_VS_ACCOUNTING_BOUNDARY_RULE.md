# ============================================================
# ERP EPM VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2469
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_vs_accounting.boundary_rule
component: epm-vs-accounting-boundary-rule


# RULE

EPM owns:
- planning coordination truth
- forecast coordination truth
- variance and dashboard snapshot truth

Accounting owns:
- posting truth
- financial position truth

# CONSEQUENCE

A variance snapshot is not journal truth.
A budget coordination case is not accounting posting truth.
EPM may consume accounting visibility,
but it does not replace accounting-owned truth.

