# ============================================================
# ERP CRM OPTION ROLE EXAMPLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-682
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.role_example_matrix
component: crm-option-role-example-matrix


# EXAMPLE MATRIX

## crm_option_admin
Typical capabilities:
- account read/write
- contact read/write
- interaction read/write
- inquiry read/write
- segment write
- lifecycle transition
- owner reassign
- archive/unarchive
- merge
- export
- audit read
- controlled reopen
- closure override

## crm_manager
Typical capabilities:
- account read/write
- contact read/write
- interaction read/write
- inquiry read/write
- segment write
- lifecycle transition
- owner reassign
- archive/unarchive
- controlled reopen
- closure override
- limited export

## crm_operator
Typical capabilities:
- account read/write
- contact read/write
- interaction read/write
- inquiry read/write
Without default access:
- merge
- lifecycle controlled transition
- unarchive
- closure override

## crm_inquiry_operator
Typical capabilities:
- inquiry read/write
- interaction read
- limited interaction write
Without default access:
- merge
- lifecycle transition
- account archive
- closure override unless specifically granted

## crm_readonly_analyst
Typical capabilities:
- account read
- contact read
- interaction read within scope
- inquiry read
Possibly:
- export
Without write capabilities

## crm_audit_reviewer
Typical capabilities:
- audit read
- account read
- inquiry read
Without ordinary write by default

