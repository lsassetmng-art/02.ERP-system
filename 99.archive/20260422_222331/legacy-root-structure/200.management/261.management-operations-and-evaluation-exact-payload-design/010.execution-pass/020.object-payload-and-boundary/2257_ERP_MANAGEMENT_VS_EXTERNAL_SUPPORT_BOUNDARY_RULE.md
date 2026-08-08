# ============================================================
# ERP MANAGEMENT VS EXTERNAL SUPPORT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2257
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_vs_external_support.boundary_rule
component: management-vs-external-support-boundary-rule


# RULE

ERP management owns:
- external support request truth inside ERP
- review / approval / escalation linkage truth

External support systems own:
- their internal queue truth
- their internal draft truth
- their internal execution-support internals

# CONSEQUENCE

ERP-side request linkage is not external app queue ownership.
This module must not model external app internals as ERP-owned truth.

