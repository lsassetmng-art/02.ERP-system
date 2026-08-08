# ============================================================
# ERP AUDIT REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1806
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.reporting_and_drilldown.rule
component: audit-reporting-and-drilldown-rule


# PRIMARY SURFACES

- open audit engagement count
- reviewed evidence count
- severe finding backlog
- conclusion finalization lag
- follow-up closure aging
- governance-related audit visibility

# RULE

These are derived audit reporting surfaces.

They must drill down to owned audit objects
when permissions allow.

