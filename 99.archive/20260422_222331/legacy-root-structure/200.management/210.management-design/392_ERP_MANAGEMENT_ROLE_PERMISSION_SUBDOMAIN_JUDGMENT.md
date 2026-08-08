# ============================================================
# ERP MANAGEMENT ROLE PERMISSION SUBDOMAIN JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for the management role and permission subdomain.

current_reading:
- system.role_def is the main role-definition anchor
- system.role_screen_permission is a role-to-screen control layer
- core.permission_groups is a grouped permission anchor
- core.user_permissions is a user-level permission assignment layer
- core.company_permission is a company-scope permission layer

interpretation:
This subdomain belongs to management because it defines
who can supervise, control, review, or intervene in ERP operations.

conclusion:
Role and permission architecture is a core management subdomain,
not merely a technical support detail.
