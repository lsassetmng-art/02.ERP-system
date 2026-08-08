# ============================================================
# ERP KNOWLEDGE PLAYBOOK SAFE AUTOMATION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2986
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.knowledge_playbook_safe_automation.lifecycle_and_statusflow.rule
component: knowledge-playbook-safe-automation-lifecycle-and-statusflow-rule


# OPERATOR KNOWLEDGE ARTICLE STATUS SET

- draft
- active
- deprecated
- superseded
- archived


# PLAYBOOK LIBRARY ENTRY STATUS SET

- draft
- active
- suspended
- deprecated
- archived


# SAFE AUTOMATION PROFILE STATUS SET

- draft
- active
- restricted
- retired
- archived


# PLAYBOOK ACTIVATION RECOMMENDATION STATUS SET

- proposed
- accepted
- rejected
- expired
- archived


# AUTOMATION SAFETY CONSTRAINT STATUS SET

- active
- violated
- bypassed
- resolved
- archived

