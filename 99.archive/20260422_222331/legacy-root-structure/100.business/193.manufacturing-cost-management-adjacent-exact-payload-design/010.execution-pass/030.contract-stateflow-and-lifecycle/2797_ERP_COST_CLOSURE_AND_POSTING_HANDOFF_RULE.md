# ============================================================
# ERP COST CLOSURE AND POSTING HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2797
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cost_closure_and_posting_handoff.rule
component: cost-closure-and-posting-handoff-rule


# RULE

Cost closure progression must preserve:
- linked actual-cost accumulation reference
- linked variance reference
- closure period visibility
- posting handoff state visibility
- handed-off and closed trace when applicable

