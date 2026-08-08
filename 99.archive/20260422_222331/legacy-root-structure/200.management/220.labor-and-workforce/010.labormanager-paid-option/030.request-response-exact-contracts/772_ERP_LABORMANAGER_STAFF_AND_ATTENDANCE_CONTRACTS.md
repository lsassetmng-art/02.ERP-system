# ============================================================
# ERP LABORMANAGER STAFF AND ATTENDANCE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-772
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.staff_and_attendance_contracts
component: labormanager-staff-and-attendance-contracts


# STAFF LIST REQUEST BODY

- search_text
- employment_status_code_set
- department_code_set
- manager_user_id_set
- page
- page_size


# STAFF LIST RESPONSE DATA

- items
  - object_id
  - object_type = labor_staff_profile
  - company_id
  - status
  - staff_code
  - display_name
  - primary_department_code
  - primary_role_code
  - employment_type_code
  - hire_date
  - termination_date
  - manager_user_id
  - updated_at
- total_count
- page
- page_size


# ATTENDANCE LIST REQUEST BODY

- staff_profile_id
- work_date_from
- work_date_to
- attendance_status_code_set
- correction_required_flag
- page
- page_size


# ATTENDANCE WRITE RULE

Attendance correction approval must be separate from
ordinary attendance entry update.

