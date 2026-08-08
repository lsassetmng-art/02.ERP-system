# ============================================================
# ERP CRM OPTION TRANSITION ERROR MAPPING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-644
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.transition_error_mapping_rule
component: crm-option-transition-error-mapping-rule


# REPRESENTATIVE TRANSITION ERROR CODES

- CRM_INVALID_OBJECT_STATUS_TRANSITION
- CRM_INVALID_INQUIRY_STATUS_TRANSITION
- CRM_INVALID_LIFECYCLE_TRANSITION
- CRM_INVALID_SEGMENT_TRANSITION
- CRM_INVALID_ARCHIVE_TARGET
- CRM_UNARCHIVE_NOT_ALLOWED
- CRM_MERGE_PRECONDITION_FAILED
- CRM_OPTION_STATE_BLOCKS_WRITE
- CRM_TRANSITION_PERMISSION_DENIED
- CRM_AUDIT_REQUIRED_TRANSITION_BLOCKED


# RULE

Transition failure should map to exact error codes
that distinguish the source of rejection.

