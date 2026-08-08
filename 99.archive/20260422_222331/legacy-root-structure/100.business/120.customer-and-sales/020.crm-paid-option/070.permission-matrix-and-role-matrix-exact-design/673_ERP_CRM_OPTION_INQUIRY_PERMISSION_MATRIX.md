# ============================================================
# ERP CRM OPTION INQUIRY PERMISSION MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-673
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.inquiry.permission_matrix
component: crm-option-inquiry-permission-matrix


# MATRIX

## inquiry list/detail read
Required capability:
- crm_inquiry_read

Typical roles:
- crm_option_admin
- crm_manager
- crm_inquiry_operator
- crm_readonly_analyst
- crm_audit_reviewer

## inquiry create / ordinary update
Required capability:
- crm_inquiry_write

Typical roles:
- crm_option_admin
- crm_manager
- crm_inquiry_operator

## inquiry reopen from closed / resolved
Required capability:
- crm_reopen_controlled_case

Typical roles:
- crm_option_admin
- crm_manager
- crm_support_escalation_reviewer

## inquiry closure override
Required capability:
- crm_closure_override

Typical roles:
- crm_option_admin
- crm_manager
- crm_support_escalation_reviewer

## inquiry owner reassignment
Required capability:
- crm_owner_reassign


# RULE

Inquiry controlled transitions require stronger grants
than ordinary inquiry edit.

