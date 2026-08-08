# ============================================================
# ERP CRM OPTION ACCOUNT DETAIL AND EDIT STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-651
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_detail_and_edit.stateflow
component: crm-option-account-detail-and-edit-stateflow


# DETAIL STATES

- detail_loading
- detail_ready
- detail_archived
- detail_blocked_for_review
- detail_merged_redirect_required
- permission_denied
- failed


# EDIT STATES

- edit_idle
- edit_dirty
- edit_submitting
- edit_saved
- edit_failed
- edit_blocked_by_transition_rule
- audit_sensitive_confirmation_required


# TRANSITION RULES

If object status is merged:
- detail screen should not behave as normal editable detail
- redirect or trace-guided reference to merge target is required

If object status is archived:
- default mode is read-only
- unarchive action, if allowed, is separate from ordinary edit

If object status is blocked_for_review:
- ordinary edits may be restricted by policy


# RULE

Account edit must not absorb lifecycle transition,
merge, or archive into generic save behavior.

