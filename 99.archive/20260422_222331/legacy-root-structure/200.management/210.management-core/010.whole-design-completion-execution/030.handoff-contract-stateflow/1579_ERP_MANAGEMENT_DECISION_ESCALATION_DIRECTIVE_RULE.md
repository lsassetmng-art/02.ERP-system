# ============================================================
# ERP MANAGEMENT DECISION ESCALATION DIRECTIVE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1579
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.decision_escalation_directive.rule
component: management-decision-escalation-directive-rule


# RULE

Decision, escalation, and directive semantics must remain distinct.

Representative distinctions:
- decision record is not escalation case
- escalation case is not action directive
- action directive completion is not business operation completion

# CONSEQUENCE

Every decision-class, escalation-class, or directive-class action must preserve:
- original management object reference
- reason
- actor
- timestamp
- downstream visibility

