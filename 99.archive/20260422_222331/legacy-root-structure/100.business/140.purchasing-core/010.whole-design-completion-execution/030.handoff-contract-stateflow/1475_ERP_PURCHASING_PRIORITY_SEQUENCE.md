# ============================================================
# ERP PURCHASING PRIORITY SEQUENCE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1475
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.priority_sequence
component: purchasing-priority-sequence


# PRIORITY SEQUENCE

1. purchase request exactness
2. purchase order and line exactness
3. receipt expectation and supplier return exactness
4. cancellation / amendment / return exactness
5. MRP / SCM adjacency reconciliation
6. inventory / accounting downstream reconciliation

