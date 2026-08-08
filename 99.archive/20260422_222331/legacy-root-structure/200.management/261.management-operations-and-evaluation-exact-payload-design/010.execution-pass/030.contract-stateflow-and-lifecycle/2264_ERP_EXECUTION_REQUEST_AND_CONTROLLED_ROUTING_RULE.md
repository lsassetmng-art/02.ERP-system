# ============================================================
# ERP EXECUTION REQUEST AND CONTROLLED ROUTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2264
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.execution_request_and_controlled_routing.rule
component: execution-request-and-controlled-routing-rule


# RULE

Execution request may progress toward controlled routing,
but execution request truth is not direct unrestricted execution truth.

Progression should preserve:
- request target type
- risk class
- approval dependency
- routed target visibility
- completion or failure summary visibility

