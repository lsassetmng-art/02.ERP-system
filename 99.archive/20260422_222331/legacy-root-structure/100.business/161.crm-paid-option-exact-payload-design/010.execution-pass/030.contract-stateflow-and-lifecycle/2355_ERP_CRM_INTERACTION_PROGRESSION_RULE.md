# ============================================================
# ERP CRM INTERACTION_PROGRESSION_RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2355
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm.interaction_progression.rule
component: crm-interaction-progression-rule


# RULE

Interaction case may progress from open to completed or canceled,
but interaction truth must preserve:
- linked account reference
- linked contact reference
- channel
- interaction type
- occurrence timestamp
- owner visibility

