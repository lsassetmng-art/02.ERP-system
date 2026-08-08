# ============================================================
# ERP WMS INBOUND OUTBOUND MOVEMENT RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-985
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.inbound_outbound_movement.rules
component: wms-inbound-outbound-movement-rules


# RECEIPT STATUS SET

- draft
- in_progress
- received
- putaway_pending
- completed
- canceled


# PICK STATUS SET

- released
- picking
- picked
- packed
- dispatched
- canceled


# MOVEMENT STATUS SET

- draft
- executed
- reversed
- archived


# RULE

Received is not completed until putaway governance is satisfied.
Picked is not dispatched.

