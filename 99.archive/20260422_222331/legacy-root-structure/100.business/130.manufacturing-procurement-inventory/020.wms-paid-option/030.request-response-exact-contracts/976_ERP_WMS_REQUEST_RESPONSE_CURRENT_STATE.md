# ============================================================
# ERP WMS REQUEST RESPONSE CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-976
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.request_response.current_state
component: wms-request-response-current-state


# ABSTRACT

Defines the current state for the first exact
request/response contract pass for the WMS paid option.

This pass fixes:
- common envelope
- warehouse/location/inventory contracts
- inbound/outbound/movement contracts
- count/discrepancy contracts
- enablement-aware and permission-aware contract behavior

