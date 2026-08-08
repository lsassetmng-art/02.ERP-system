# ============================================================
# ERP CRM OPTION SCREEN STATEFLOW CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-646
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.screen_stateflow.current_state
component: crm-option-screen-stateflow-current-state


# ABSTRACT

Defines the current state for the first exact screen
and stateflow design pass for the CRM paid option.

The prior passes fixed:
- paid option positioning
- object exactness
- request / response exact contracts
- state transition exactness

This pass fixes:
- screen inventory
- screen-level stateflow
- exact user-visible transition behavior
- option disabled and suspended behavior
- permission and audit reflection in the UI/state layer


# GOAL

The goal is not visual styling.

The goal is exact interaction structure:
- which screens exist
- which screen states exist
- which transitions are allowed
- which transitions must be blocked
- how contract and state errors appear at screen level


# CONSTRAINTS

Do not design screens as if CRM is always enabled.

Do not collapse write, merge, archive, and lifecycle
change into one vague edit screen.

Do not hide permission or audit consequences.

