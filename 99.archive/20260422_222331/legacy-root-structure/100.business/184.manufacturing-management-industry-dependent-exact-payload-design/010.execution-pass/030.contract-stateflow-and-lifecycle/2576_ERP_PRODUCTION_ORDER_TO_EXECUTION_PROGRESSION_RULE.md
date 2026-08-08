# ============================================================
# ERP PRODUCTION ORDER TO EXECUTION PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2576
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.production_order_to_execution_progression.rule
component: production-order-to-execution-progression-rule


# RULE

Production order release may justify execution start,
but production order truth does not disappear.

Progression should preserve:
- linked production order reference
- linked BOM visibility
- scheduled versus actual timing visibility
- owner visibility
- cancellation or abort trace when applicable

