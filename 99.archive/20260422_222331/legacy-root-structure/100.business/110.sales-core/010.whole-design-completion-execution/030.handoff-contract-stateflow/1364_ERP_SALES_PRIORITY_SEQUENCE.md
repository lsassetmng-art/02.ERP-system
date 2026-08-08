# ============================================================
# ERP SALES PRIORITY SEQUENCE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1364
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.priority_sequence
component: sales-priority-sequence


# PRIORITY SEQUENCE

1. quote exactness
2. order and line exactness
3. fulfillment and billing handoff exactness
4. cancellation / return / reversal exactness
5. CRM/SFA adjacency reconciliation
6. inventory/accounting downstream reconciliation

