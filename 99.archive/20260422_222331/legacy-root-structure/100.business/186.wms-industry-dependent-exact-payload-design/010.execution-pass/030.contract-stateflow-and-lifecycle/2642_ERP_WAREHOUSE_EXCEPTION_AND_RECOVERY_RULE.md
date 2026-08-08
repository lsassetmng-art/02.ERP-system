# ============================================================
# ERP WAREHOUSE EXCEPTION AND RECOVERY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2642
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.warehouse_exception_and_recovery.rule
component: warehouse-exception-and-recovery-rule


# RULE

Warehouse exception and recovery progression must preserve:
- linked warehouse task reference
- exception type and severity
- affected item and quantity visibility
- resolution state visibility
- dismissed or resolved trace when applicable

