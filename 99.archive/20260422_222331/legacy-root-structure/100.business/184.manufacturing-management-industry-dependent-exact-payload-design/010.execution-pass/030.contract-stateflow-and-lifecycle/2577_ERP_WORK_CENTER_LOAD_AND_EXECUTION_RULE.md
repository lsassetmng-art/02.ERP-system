# ============================================================
# ERP WORK CENTER LOAD AND EXECUTION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2577
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.work_center_load_and_execution.rule
component: work-center-load-and-execution-rule


# RULE

Work-center load and execution progression must preserve:
- linked production order reference
- work-center reference
- planned and allocated capacity visibility
- overload visibility
- execution quantity and rejection visibility

