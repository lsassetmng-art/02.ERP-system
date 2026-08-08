# ============================================================
# ERP CRM OPTION STATE TRANSITION PRINCIPLES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-628
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.state_transition.principles
component: crm-option-state-transition-principles


# PRINCIPLE 1

State transition is a first-class design object.

It must not be hidden inside generic update behavior.


# PRINCIPLE 2

Operational status, lifecycle state, archive state,
and merge state are distinct concerns.

They must not be collapsed into one ambiguous field.


# PRINCIPLE 3

A transition must be evaluated against:

- current object state
- requested next state
- actor permission
- option enablement state
- audit consequence


# PRINCIPLE 4

Every prohibited transition should fail explicitly.

Silent normalization is prohibited.


# PRINCIPLE 5

When time matters, effective_from / effective_to
must be preserved rather than inferred from update time.


# PRINCIPLE 6

Merge is not deletion.
Archive is not merge.
Suspend is not archive.
Lifecycle change is not ordinary patch update.

