# ============================================================
# ERP MANAGEMENT OBJECT ROLE REGISTRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Registers the first-pass role classification
for management-related objects.

role_registry:

  governance_control:
  - governance.business_rule
  - governance.business_rule_condition
  - governance.business_rule_action
  - governance.contract_header

  authorization_and_permission:
  - core.company_permission
  - core.permission_groups
  - core.user_permissions
  - system.role_def
  - system.role_screen_permission

  intervention_and_operational_control:
  - system.operation_log
  - system.runtime_killswitch
  - core.status_history

  hr_oversight:
  - hr.employee
  - hr.hr_department
  - hr.hr_position
  - hr.attendance_log
  - hr.payroll_run

conclusion:
This registry provides the first formal management role split
across governance, authorization, intervention, and HR oversight roles.
