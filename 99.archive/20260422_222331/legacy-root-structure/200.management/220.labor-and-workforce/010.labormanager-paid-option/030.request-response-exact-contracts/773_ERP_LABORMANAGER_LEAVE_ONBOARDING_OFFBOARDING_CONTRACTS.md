# ============================================================
# ERP LABORMANAGER LEAVE ONBOARDING OFFBOARDING CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-773
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.leave_onboarding_offboarding_contracts
component: labormanager-leave-onboarding-offboarding-contracts


# LEAVE REQUEST BODY

- staff_profile_id
- leave_type_code
- leave_start_at
- leave_end_at
- leave_days_or_hours_value
- requested_reason


# LEAVE RESPONSE DATA

- written_object
  - full labor_leave_request canonical payload
- audit_context


# ONBOARDING / OFFBOARDING CASE REQUEST BODY

- staff_profile_id
- planned_start_date or planned_end_date
- primary_owner_user_id


# RULE

Leave approval or rejection must be separate from
initial leave request creation.

