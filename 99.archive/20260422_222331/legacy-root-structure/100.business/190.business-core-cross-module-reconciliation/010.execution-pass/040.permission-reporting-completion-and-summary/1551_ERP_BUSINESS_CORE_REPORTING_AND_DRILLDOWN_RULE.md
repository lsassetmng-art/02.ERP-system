# ============================================================
# ERP BUSINESS CORE REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1551
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business_core.reporting_and_drilldown.rule
component: business-core-reporting-and-drilldown-rule


# PRIMARY SURFACES

- order to fulfillment to posting chain visibility
- sourcing to receipt to posting chain visibility
- production to stock to posting chain visibility
- exception aging across business-core chains
- cross-module blocked handoff count

# RULE

These are derived cross-module business reporting surfaces.

They must drill down to owned module-local business objects
when permissions allow.

