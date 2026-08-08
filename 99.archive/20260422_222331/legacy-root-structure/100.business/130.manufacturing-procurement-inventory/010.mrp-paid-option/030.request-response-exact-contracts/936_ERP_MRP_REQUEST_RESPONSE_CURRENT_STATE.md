# ============================================================
# ERP MRP REQUEST RESPONSE CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-936
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.request_response.current_state
component: mrp-request-response-current-state


# ABSTRACT

Defines the current state for the first exact
request/response contract pass for the MRP paid option.

This pass fixes:
- common envelope
- demand and BOM contracts
- run and planned order contracts
- recommendation and exception contracts
- enablement-aware and permission-aware contract behavior

