# ============================================================
# ERP KNOWLEDGE PLAYBOOK SAFE AUTOMATION PRIMARY UI STATEFLOW AND REPORTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2995
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.knowledge_playbook_safe_automation.primary_ui_stateflow_and_reporting.rule
component: knowledge-playbook-safe-automation-primary-ui-stateflow-and-reporting-rule


# PRIMARY UI STATES

- loading
- ready_with_items
- ready_empty
- edit_dirty
- recommendation_publish_confirmation_required
- profile_constraint_confirmation_required
- revision_apply_confirmation_required
- invalid_transition_blocked
- permission_denied
- failed

# PRIMARY REPORTING SURFACES

- stale knowledge article backlog
- active playbook backlog
- pending playbook recommendation backlog
- active safe automation profile count
- violated safety constraint count
- knowledge freshness visibility
- recommendation acceptance visibility
- profile revision backlog

