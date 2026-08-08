# ============================================================
# ERP CRM OPTION CONTACT AND INTERACTION PERMISSION MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-672
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.contact_and_interaction.permission_matrix
component: crm-option-contact-and-interaction-permission-matrix


# CONTACT MATRIX

## contact list view
- crm_contact_read

## contact create / update
- crm_contact_write

## contact archive / unarchive
- crm_archive
- crm_unarchive

Typical roles:
- crm_option_admin
- crm_manager
- crm_operator


# INTERACTION MATRIX

## interaction timeline read
- crm_interaction_read

## interaction create
- crm_interaction_write

## interaction archive
- crm_archive

## interaction confidentiality-restricted read
- crm_interaction_read
and scope-sensitive confidentiality allowance


# RULE

Interaction read permission may still be narrowed
by confidentiality_code and tenant visibility policy.

