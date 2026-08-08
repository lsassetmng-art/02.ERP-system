# ============================================================
# ERP MANAGEMENT VS DISPATCHED AI ROBOT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2256
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_vs_dispatched_ai_robot.boundary_rule
component: management-vs-dispatched-ai-robot-boundary-rule


# RULE

Management operations and evaluation owns:
- evaluation coordination truth
- review and approval truth
- escalation truth

250.dispatched-ai-robot-management owns:
- local ai robot assignment truth
- local ai robot operational evaluation truth
- local ai robot incident truth

# CONSEQUENCE

A linked ai robot evaluation reference is not ownership transfer.
Management coordination does not replace ai robot local evaluation truth.

