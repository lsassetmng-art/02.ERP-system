# ============================================================
# ERP CRM OPTION SEGMENT AND LIFECYCLE PERMISSION MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-674
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.segment_and_lifecycle.permission_matrix
component: crm-option-segment-and-lifecycle-permission-matrix


# SEGMENT MATRIX

## segment history read
Required capability:
- crm_account_read

## segment assignment create / end-date / controlled replace
Required capability:
- crm_segment_write

Typical roles:
- crm_option_admin
- crm_manager


# LIFECYCLE MATRIX

## lifecycle history read
Required capability:
- crm_account_read

## lifecycle transition
Required capability:
- crm_lifecycle_transition

Typical roles:
- crm_option_admin
- crm_manager


# RULE

Segment write and lifecycle transition are not
ordinary account edit rights.

