# ============================================================
# ERP PREVENTIVE PLAN TO WORK ORDER PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2764
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.preventive_plan_to_work_order_progression.rule
component: preventive-plan-to-work-order-progression-rule


# RULE

Preventive-plan due-state may justify work-order creation,
but preventive-plan truth does not disappear.

Progression should preserve:
- linked maintenance asset reference
- maintenance frequency visibility
- next-due visibility
- assigned team visibility
- cancelation trace when applicable

