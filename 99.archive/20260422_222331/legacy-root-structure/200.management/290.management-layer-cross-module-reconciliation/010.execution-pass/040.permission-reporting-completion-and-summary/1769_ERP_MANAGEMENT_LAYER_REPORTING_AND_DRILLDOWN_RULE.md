# ============================================================
# ERP MANAGEMENT LAYER REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1769
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_layer.reporting_and_drilldown.rule
component: management-layer-reporting-and-drilldown-rule


# PRIMARY SURFACES

- management to governance chain visibility
- labor exception to escalation chain visibility
- epm to company_wide_mbo rollout chain visibility
- override and signoff aging across the management layer
- cross-module blocked handoff count

# RULE

These are derived cross-module management reporting surfaces.

They must drill down to owned module-local management-layer objects
when permissions allow.

