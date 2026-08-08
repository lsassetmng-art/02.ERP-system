# ============================================================
# ERP CRM OPTION PERMISSION DESIGN PRINCIPLES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-668
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_design.principles
component: crm-option-permission-design-principles


# PRINCIPLE 1

Permission must be expressed in capability families,
not in vague prose.


# PRINCIPLE 2

Screen visibility and action permission are related
but not identical.

A role may view a screen without being able to
execute all actions on it.


# PRINCIPLE 3

Transition-sensitive actions require stronger
permission than ordinary field edit.


# PRINCIPLE 4

Permission should be evaluated against:
- option state
- role set
- object family
- action family
- object state
- scope constraints


# PRINCIPLE 5

Permission denial must be explicit and classifiable.

Silent no-op is prohibited.


# PRINCIPLE 6

Audit-sensitive action may require both permission
and higher approval consequence awareness.

