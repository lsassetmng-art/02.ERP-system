# ============================================================
# ERP ALERTING AND ESCALATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2892
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.alerting_and_escalation.rule
component: alerting-and-escalation-rule


# RULE

Alerting and escalation progression must preserve:
- linked rule reference
- threshold and severity visibility
- suppression policy visibility
- escalation target visibility
- acknowledged or unresolved trace when applicable

