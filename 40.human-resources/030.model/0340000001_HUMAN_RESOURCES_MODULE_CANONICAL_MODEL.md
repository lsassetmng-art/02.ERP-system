# ============================================================
# HUMAN RESOURCES MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 40.human-resources

Entities:
- hr_workforce_profile
- hr_employment_lifecycle
- hr_assignment
- hr_role_placement
- hr_status_change

Key fields:
hr_workforce_profile:
- hr_workforce_profile_id
- worker_number
- person_id_reference
- employment_type
- hire_date
- separation_date nullable
- hr_status

hr_assignment:
- hr_assignment_id
- hr_workforce_profile_id
- department_id
- role_id
- manager_id nullable
- assignment_status
- effective_from
- effective_to nullable

Status canon:
- active
- suspended
- transferred
- leave_status
- retired
- terminated
- archived

Invariant:
- active payroll/labor surfaces require active employment or approved special status reference
