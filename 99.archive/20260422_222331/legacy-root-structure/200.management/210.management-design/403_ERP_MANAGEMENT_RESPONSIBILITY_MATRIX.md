# ============================================================
# ERP MANAGEMENT RESPONSIBILITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass responsibility matrix
for management-related objects.

responsibility_matrix:

  governance.business_rule:
    responsibility:
    - management rule ownership
    - control policy definition
    - intervention rule basis

  governance.business_rule_condition:
    responsibility:
    - rule condition definition

  governance.business_rule_action:
    responsibility:
    - rule action definition

  governance.contract_header:
    responsibility:
    - contract-side control anchor
    - governed contract responsibility

  core.company_permission:
    responsibility:
    - company-scope permission control

  core.permission_groups:
    responsibility:
    - grouped permission control

  core.user_permissions:
    responsibility:
    - user-level permission assignment and override

  system.role_def:
    responsibility:
    - role definition
    - supervision role structure

  system.role_screen_permission:
    responsibility:
    - role-screen control mapping

  system.operation_log:
    responsibility:
    - operational trace
    - supervised action history

  system.runtime_killswitch:
    responsibility:
    - runtime intervention
    - stop-control responsibility

  core.status_history:
    responsibility:
    - status transition supervision
    - cross-cutting state history

  hr.employee:
    responsibility:
    - worker identity and oversight anchor

  hr.hr_department:
    responsibility:
    - department-level organization control

  hr.hr_position:
    responsibility:
    - role/position control structure

  hr.attendance_log:
    responsibility:
    - attendance supervision

  hr.payroll_run:
    responsibility:
    - payroll-cycle supervision

conclusion:
Management responsibilities are layered across
rule control, authorization, intervention, supervision, and HR oversight.
