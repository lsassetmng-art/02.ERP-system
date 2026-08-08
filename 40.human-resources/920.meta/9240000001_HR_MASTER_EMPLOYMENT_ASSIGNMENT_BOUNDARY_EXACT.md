# ============================================================
# HUMAN RESOURCES MASTER / EMPLOYMENT / ASSIGNMENT BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 40.human-resources
related_modules:
- 41.labor-management
- 42.payroll
- 50.approval
- 51.audit
- 60.business-intelligence

purpose:
Define HR master, employment, organization, position, and assignment truth,
and the exact handoff boundary to labor management and payroll.

canonical_role:
- HR master / employment / organization / assignment truth

# ============================================================
# 1. CORE HR OBJECTS
# ============================================================

core_objects:
- hr_worker_master
- hr_employee_profile
- hr_employment_contract_basis
- hr_employment_status
- hr_organization_assignment
- hr_position_assignment
- hr_manager_assignment
- hr_work_eligibility
- hr_compensation_basis
- hr_lifecycle_event
- hr_to_labor_worker_profile_snapshot
- hr_to_payroll_employee_payroll_profile_snapshot

# ============================================================
# 2. WORKER / EMPLOYEE MASTER
# ============================================================

object_name:
- hr_worker_master

meaning:
- canonical person/worker record for HR usage in ERP

required_fields:
- worker_id
- company_id
- worker_code
- worker_type
- legal_name_or_display_name_reference
- employment_status
- hire_date_or_start_date
- termination_date_or_null
- primary_department_id_or_null
- primary_position_id_or_null
- primary_manager_worker_id_or_null
- work_eligibility_reference_or_null
- active_flag
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

worker_type_examples:
- employee
- part_time
- contractor
- temporary
- dispatched_worker
- intern
- executive

allowed_employment_status:
- pre_hire
- active
- leave_of_absence
- suspended
- terminated
- retired
- contractor_closed
- cancelled

rules:
- worker master is HR truth
- labor may reference worker_id but may not redefine worker master
- payroll may reference worker_id but may not redefine HR employment status

# ============================================================
# 3. EMPLOYMENT CONTRACT BASIS
# ============================================================

object_name:
- hr_employment_contract_basis

required_fields:
- employment_contract_basis_id
- company_id
- worker_id
- contract_type
- employment_category
- effective_from
- effective_to_or_null
- standard_work_pattern_reference_or_null
- compensation_basis_reference_or_null
- payroll_eligibility_flag
- labor_tracking_required_flag
- approval_reference_or_null
- contract_status
- lineage_reference

contract_type_examples:
- indefinite
- fixed_term
- hourly
- monthly
- contractor
- temporary
- dispatched

allowed_contract_status:
- draft
- approval_pending
- active
- amended
- expired
- terminated
- cancelled
- superseded

rules:
- employment contract basis belongs to 40
- labor consumes labor tracking requirement
- payroll consumes payroll eligibility and compensation basis
- changes require versioning or successor contract basis

# ============================================================
# 4. ORGANIZATION / POSITION ASSIGNMENT
# ============================================================

object_name:
- hr_organization_assignment

required_fields:
- organization_assignment_id
- company_id
- worker_id
- department_id
- cost_center_id_or_null
- reporting_unit_id_or_null
- effective_from
- effective_to_or_null
- assignment_status
- approval_reference_or_null
- lineage_reference

object_name:
- hr_position_assignment

required_fields:
- position_assignment_id
- company_id
- worker_id
- position_id
- job_grade_or_level_or_null
- role_reference_or_null
- effective_from
- effective_to_or_null
- assignment_status
- approval_reference_or_null
- lineage_reference

allowed_assignment_status:
- draft
- active
- future
- ended
- cancelled
- superseded

rules:
- department / position assignment belongs to 40
- labor may use assignment for shift eligibility and reporting
- payroll may use assignment for payroll costing / allocation basis
- management accounting may consume snapshots for responsibility reporting
- downstream modules must not overwrite assignment truth

# ============================================================
# 5. COMPENSATION BASIS
# ============================================================

object_name:
- hr_compensation_basis

meaning:
- HR-owned compensation master basis before payroll calculation

required_fields:
- compensation_basis_id
- company_id
- worker_id
- pay_type
- base_rate_or_salary_reference
- currency_code
- effective_from
- effective_to_or_null
- payroll_frequency_or_null
- allowance_eligibility_reference_set_or_null
- deduction_eligibility_reference_set_or_null
- approval_reference_or_null
- status
- lineage_reference

pay_type_examples:
- hourly
- monthly_salary
- annual_salary
- daily
- piece_rate
- contract_fee

allowed_status:
- draft
- approval_pending
- active
- ended
- cancelled
- superseded

rules:
- compensation basis is not payroll calculation
- payroll consumes active compensation basis
- payroll calculated earning lines belong to 42
- correction requires HR compensation version change and payroll recalculation workflow where applicable

# ============================================================
# 6. HR TO LABOR WORKER PROFILE SNAPSHOT
# ============================================================

handoff_object_name:
- hr_to_labor_worker_profile_snapshot

meaning:
- HR profile basis for labor scheduling, attendance, leave, and overtime

required_fields:
- worker_profile_snapshot_id
- company_id
- source_module
- target_module
- worker_id
- employment_status
- department_assignment_reference
- position_assignment_reference_or_null
- standard_work_pattern_reference_or_null
- labor_tracking_required_flag
- shift_eligibility_reference_or_null
- leave_policy_reference_or_null
- overtime_policy_reference_or_null
- effective_from
- effective_to_or_null
- snapshot_status
- created_at
- lineage_reference

allowed_snapshot_status:
- active
- superseded
- cancelled

rules:
- source_module must be 40.human-resources
- target_module must be 41.labor-management
- snapshot is labor input basis
- labor does not own HR master truth
- HR correction requires successor snapshot, not downstream patching

# ============================================================
# 7. HR TO PAYROLL PROFILE SNAPSHOT
# ============================================================

handoff_object_name:
- hr_to_payroll_employee_payroll_profile_snapshot

meaning:
- HR profile and compensation basis for payroll calculation

required_fields:
- payroll_profile_snapshot_id
- company_id
- source_module
- target_module
- worker_id
- employment_status
- compensation_basis_reference
- payroll_eligibility_flag
- payroll_frequency
- tax_profile_reference_or_null
- social_insurance_profile_reference_or_null
- bank_account_reference_or_null
- department_assignment_reference_or_null
- cost_center_reference_or_null
- effective_from
- effective_to_or_null
- snapshot_status
- created_at
- lineage_reference

allowed_snapshot_status:
- active
- superseded
- cancelled

rules:
- source_module must be 40.human-resources
- target_module must be 42.payroll
- payroll may calculate using snapshot
- payroll must not rewrite HR compensation or employment status
- HR correction after payroll close must trigger payroll review, not silent mutation

# ============================================================
# 8. OUTPUT TO BI / AUDIT / APPROVAL
# ============================================================

BI_consumable_outputs:
- worker master snapshot
- employment status snapshot
- department assignment snapshot
- position assignment snapshot
- HR lifecycle event snapshot

approval_rules:
- 50.approval may approve HR changes
- approval does not replace HR source record

audit_rules:
- 51.audit may audit HR master changes
- audit finding does not directly mutate HR master

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- labor changing HR employment status
- payroll changing HR compensation basis directly
- shift assignment creating worker master
- attendance record activating terminated worker
- payslip correcting department assignment
- BI dashboard editing HR master
- audit finding changing HR record directly

# ============================================================
# 10. DECISION TEST
# ============================================================

decision_test:
- If it is worker identity / employment / department / position / compensation basis, 40 owns it.
- If it is shift / attendance / leave / overtime result, 41 owns it.
- If it is payroll calculation / payslip, 42 owns it.

# ============================================================
# 11. COMPLETION STATE
# ============================================================

completion_state:
- HR master exact design fixed
- employment / assignment / compensation basis fixed
- HR to labor snapshot fixed
- HR to payroll snapshot fixed
- downstream mutation shortcuts forbidden

# ============================================================
