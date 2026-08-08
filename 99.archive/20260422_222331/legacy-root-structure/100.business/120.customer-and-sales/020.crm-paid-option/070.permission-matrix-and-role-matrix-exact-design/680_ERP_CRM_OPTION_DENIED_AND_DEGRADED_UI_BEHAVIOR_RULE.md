# ============================================================
# ERP CRM OPTION DENIED AND DEGRADED UI BEHAVIOR RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-680
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.denied_and_degraded_ui_behavior_rule
component: crm-option-denied-and-degraded-ui-behavior-rule


# DENIED BEHAVIOR

When permission is absent, UI should behave as:

- hidden when action is irrelevant
or
- disabled with reason when explainability matters
or
- redirected to permission_denied screen when screen-level access is absent


# DEGRADED BEHAVIOR

When partial permission exists, UI may degrade by:

- read-only detail instead of editable detail
- hidden export button
- hidden merge action
- blocked reopen or override action
- summarized confidentiality-restricted content


# RULE

Degraded UI must not falsely imply that the underlying
object or action does not exist.

