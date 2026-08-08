# ============================================================
# ERP MANAGEMENT ROLE PERMISSION ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the role-and-permission management subdomain.

main_objects:
- core.company_permission
- core.permission_groups
- core.user_permissions
- system.role_def
- system.role_screen_permission

role_split:
- company-scope permission layer
- group permission layer
- user permission layer
- role definition layer
- role-to-screen control layer

main_rule:
This subdomain should be modeled
as authorization, control, and supervision architecture,
not only as technical access metadata.

conclusion:
Role and permission architecture is a core management control subdomain
that shapes who may supervise, review, operate, and intervene.
