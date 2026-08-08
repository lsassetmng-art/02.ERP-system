# ============================================================
# ERP WMS LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2639
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.lifecycle_and_statusflow.rule
component: wms-lifecycle-and-statusflow-rule


# WAREHOUSE TASK STATUS SET

- draft
- released
- in_progress
- completed
- canceled
- archived


# BIN ALLOCATION STATUS SET

- proposed
- allocated
- moved
- reversed
- archived


# PICK PACK WAVE STATUS SET

- drafted
- released
- picking
- packed
- closed
- archived


# RECEIVING DOCK EXECUTION STATUS SET

- expected
- receiving
- received
- discrepant
- archived


# WAREHOUSE EXCEPTION STATUS SET

- open
- acknowledged
- resolving
- resolved
- dismissed
- archived

