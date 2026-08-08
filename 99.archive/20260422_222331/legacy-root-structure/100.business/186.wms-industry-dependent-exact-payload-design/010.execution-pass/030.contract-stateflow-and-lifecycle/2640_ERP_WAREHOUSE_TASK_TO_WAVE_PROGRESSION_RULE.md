# ============================================================
# ERP WAREHOUSE TASK TO WAVE PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2640
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.warehouse_task_to_wave_progression.rule
component: warehouse-task-to-wave-progression-rule


# RULE

Warehouse task release may justify wave execution,
but warehouse task truth does not disappear.

Progression should preserve:
- linked warehouse task reference
- warehouse reference
- task priority visibility
- wave scope visibility
- cancellation trace when applicable

