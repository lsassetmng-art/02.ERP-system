# ============================================================
# ERP MANAGEMENT OBJECT CLASSIFICATION FIRST PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass classification
for management-related objects after inventory review.

classification:

  governance_control_layer:
  - governance.business_rule
  - governance.business_rule_condition
  - governance.business_rule_action
  - governance.contract_header

  permission_and_control_layer:
  - core.permission_groups
  - core.user_permissions
  - core.company_permission
  - system.role_def
  - system.role_screen_permission

  operational_control_layer:
  - system.operation_log
  - system.runtime_killswitch
  - core.status_history

  hr_management_oversight_layer:
  - hr.employee
  - hr.hr_department
  - hr.hr_position
  - hr.attendance_log
  - hr.payroll_run

boundary_linked_management_objects:
- employment-contract-linked HR structures
- permission-linked role and screen control structures
- business-rule-linked contract and action structures

conclusion:
Management is best understood as a multi-layer architecture
with governance, permission/control, operational control, and HR oversight layers.
