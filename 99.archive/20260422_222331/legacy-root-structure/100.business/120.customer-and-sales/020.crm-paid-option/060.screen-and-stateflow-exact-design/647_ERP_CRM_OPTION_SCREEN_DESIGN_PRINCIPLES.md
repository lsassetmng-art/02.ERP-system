# ============================================================
# ERP CRM OPTION SCREEN DESIGN PRINCIPLES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-647
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.screen_design.principles
component: crm-option-screen-design-principles


# PRINCIPLE 1

A screen should reflect the exact state model,
not overwrite it with convenience ambiguity.


# PRINCIPLE 2

List, detail, create, update, merge, archive,
and transition-sensitive operations must remain separable.


# PRINCIPLE 3

User-visible state must distinguish:

- loading
- ready
- empty
- disabled
- suspended
- permission_denied
- invalid_transition_blocked
- audit_sensitive_confirmation_required
- saved
- failed


# PRINCIPLE 4

A screen must not imply that an operation is available
when contract or permission rules prohibit it.


# PRINCIPLE 5

Derived display summaries may assist understanding,
but canonical state and transition meaning must remain visible.

