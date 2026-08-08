# ============================================================
# ERP LABORMANAGER VS DISPATCHED AI ROBOT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2420
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_dispatched_ai_robot.boundary_rule
component: labormanager-vs-dispatched-ai-robot-boundary-rule


# RULE

LaborManager owns:
- human labor canonical truth

250.dispatched-ai-robot-management owns:
- Ai(robot) local assignment truth
- Ai(robot) local evaluation truth
- Ai(robot) local incident truth

# CONSEQUENCE

Ai(robot) is not part of human labor canonical truth here.
Human labor profile truth must remain separate
from dispatched ai(robot) operational truth.

