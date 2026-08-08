# ============================================================
# ERP MANAGEMENT AUTHORITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass authority matrix
for management-related objects.

authority_matrix:

  governance.business_rule:
    authority_role:
    - governance control anchor
    authority_strength:
    - strong
    notes:
    - main management rule anchor

  governance.contract_header:
    authority_role:
    - governance-linked contract control anchor
    authority_strength:
    - medium
    notes:
    - contract-side control anchor, not raw transaction truth

  core.company_permission:
    authority_role:
    - company-scope permission authority
    authority_strength:
    - medium
    notes:
    - company-level supervision and control permission anchor

  core.permission_groups:
    authority_role:
    - grouped permission authority
    authority_strength:
    - medium
    notes:
    - grouped permission-control structure

  core.user_permissions:
    authority_role:
    - user-level permission authority
    authority_strength:
    - medium
    notes:
    - direct user permission assignment layer

  system.role_def:
    authority_role:
    - role-definition authority
    authority_strength:
    - strong
    notes:
    - main role-control anchor

  system.role_screen_permission:
    authority_role:
    - role-to-screen control authority
    authority_strength:
    - medium
    notes:
    - role-screen control layer

  system.operation_log:
    authority_role:
    - operational control trace authority
    authority_strength:
    - medium
    notes:
    - supervised operation trace anchor

  system.runtime_killswitch:
    authority_role:
    - intervention authority
    authority_strength:
    - strong
    notes:
    - operational stop/intervention anchor

  core.status_history:
    authority_role:
    - state-transition control authority
    authority_strength:
    - medium
    notes:
    - cross-cutting status-control history

  hr.employee:
    authority_role:
    - people/worker oversight anchor
    authority_strength:
    - strong
    notes:
    - people-side management anchor

  hr.hr_department:
    authority_role:
    - organization-unit oversight anchor
    authority_strength:
    - medium
    notes:
    - department-side management anchor

  hr.hr_position:
    authority_role:
    - role/position oversight anchor
    authority_strength:
    - medium
    notes:
    - position-side management anchor

  hr.attendance_log:
    authority_role:
    - attendance oversight authority
    authority_strength:
    - medium
    notes:
    - attendance supervision layer

  hr.payroll_run:
    authority_role:
    - payroll-cycle oversight authority
    authority_strength:
    - strong
    notes:
    - payroll-cycle management anchor

conclusion:
Management authority is distributed across governance, authorization,
intervention, control history, and HR oversight anchors.
