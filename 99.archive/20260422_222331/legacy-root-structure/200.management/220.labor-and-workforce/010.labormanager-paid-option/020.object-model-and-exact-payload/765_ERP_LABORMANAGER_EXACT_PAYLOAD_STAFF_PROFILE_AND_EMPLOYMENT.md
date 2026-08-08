# ============================================================
# ERP LABORMANAGER EXACT PAYLOAD STAFF PROFILE AND EMPLOYMENT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-765
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.exact_payload.staff_profile_and_employment
component: labormanager-exact-payload-staff-profile-and-employment


# OBJECT 1

labor_staff_profile

Canonical payload:
- object_id
- company_id
- object_type = labor_staff_profile
- status
- staff_code
- display_name
- legal_name
- primary_department_code
- primary_role_code
- employment_type_code
- hire_date
- termination_date
- primary_contact_email
- primary_contact_phone
- manager_user_id
- active_shift_eligibility_flag
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# OBJECT 2

labor_employment_record

Canonical payload:
- object_id
- company_id
- object_type = labor_employment_record
- status
- staff_profile_id
- employment_status_code
- contract_type_code
- employment_start_date
- employment_end_date
- probation_end_date
- labor_policy_set_code
- payroll_reference_code
- assigned_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Staff profile is identity and operational person context.
Employment record is governed labor-status context.

