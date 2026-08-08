# ============================================================
# ERP CRM OPTION ACCOUNT SCREEN AND ACTION PERMISSION MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-671
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_screen_and_action.permission_matrix
component: crm-option-account-screen-and-action-permission-matrix


# MATRIX

## account list view
Required capability:
- crm_account_read

Typical roles:
- crm_option_admin
- crm_manager
- crm_operator
- crm_readonly_analyst
- crm_audit_reviewer

## account detail view
Required capability:
- crm_account_read

## account create
Required capability:
- crm_account_write

Typical roles:
- crm_option_admin
- crm_manager
- crm_operator

## account ordinary update
Required capability:
- crm_account_write

## account owner reassignment
Required capability:
- crm_owner_reassign

Typical roles:
- crm_option_admin
- crm_manager

## account lifecycle change
Required capability:
- crm_lifecycle_transition

Typical roles:
- crm_option_admin
- crm_manager

## account archive / unarchive
Required capability:
- crm_archive
- crm_unarchive

## account merge
Required capability:
- crm_merge

Typical roles:
- crm_option_admin
- crm_merge_reviewer


# RULE

Account detail visibility does not imply account mutation rights.

