# ============================================================
# ERP DEMAND TO PLAN RUN PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2608
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.demand_to_plan_run_progression.rule
component: demand-to-plan-run-progression-rule


# RULE

Demand visibility may justify a plan run,
but demand requirement truth does not disappear.

Progression should preserve:
- linked demand reference
- required item and quantity visibility
- required date visibility
- plan-run trace
- coverage outcome visibility

