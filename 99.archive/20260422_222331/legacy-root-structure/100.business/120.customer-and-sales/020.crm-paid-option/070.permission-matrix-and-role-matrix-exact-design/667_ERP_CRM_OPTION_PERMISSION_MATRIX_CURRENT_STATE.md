# ============================================================
# ERP CRM OPTION PERMISSION MATRIX CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-667
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_matrix.current_state
component: crm-option-permission-matrix-current-state


# ABSTRACT

Defines the current state for the first exact
permission matrix and role matrix pass for the
CRM paid option.

The prior passes fixed:
- paid option positioning
- object exactness
- request / response exact contracts
- state transition exactness
- screen / stateflow exactness

This pass fixes:
- role inventory
- capability families
- permission matrices by object and action
- audit-sensitive action approval implications
- denied and degraded interaction behavior


# GOAL

The goal is to stop permission ambiguity.

The CRM paid option must not rely on vague
"can edit CRM" style access.

Permissions must become:
- object-aware
- action-aware
- transition-aware
- audit-aware
- enablement-aware


# CONSTRAINTS

Do not collapse read, write, merge, archive,
reassign, export, and reopen into one broad edit grant.

Do not assume one role fits all tenants.

Do not hide denied actions behind unclear failure.

