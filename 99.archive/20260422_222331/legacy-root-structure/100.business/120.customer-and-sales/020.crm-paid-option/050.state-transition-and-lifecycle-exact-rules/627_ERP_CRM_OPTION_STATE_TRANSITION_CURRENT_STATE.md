# ============================================================
# ERP CRM OPTION STATE TRANSITION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-627
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.state_transition.current_state
component: crm-option-state-transition-current-state


# ABSTRACT

Defines the current state for the first exact
state-transition and lifecycle rule pass for the
CRM paid option.

The prior passes fixed:
- CRM is a paid option
- object families are explicit
- payload exactness is explicit
- request / response contracts are explicit

This pass fixes:
- allowed transitions
- prohibited transitions
- lifecycle exactness
- archive / merge / suspend behavior
- permission and audit consequences of transition


# GOAL

The goal is to prevent vague or hidden mutation.

A CRM object should not change state by informal convention.

State changes must become:
- explicit
- classifiable
- permission-aware
- audit-aware
- enablement-aware


# CONSTRAINTS

Do not flatten all object families into one shared status machine.

Do not let archive masquerade as delete.

Do not let merge masquerade as ordinary update.

