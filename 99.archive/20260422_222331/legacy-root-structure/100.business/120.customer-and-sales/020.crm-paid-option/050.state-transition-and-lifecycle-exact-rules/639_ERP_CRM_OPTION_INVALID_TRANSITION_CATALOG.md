# ============================================================
# ERP CRM OPTION INVALID TRANSITION CATALOG
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-639
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.invalid_transition.catalog
component: crm-option-invalid-transition-catalog


# REPRESENTATIVE INVALID TRANSITIONS

## Account family
- merged -> active
- merged -> archived via normal archive flow
- archived -> merged
- duplicate_pending_resolution -> inactive without resolution path

## Inquiry family
- open -> closed directly
- archived -> in_progress
- closed -> resolved
- resolved -> archived without closure/admin path

## Lifecycle family
- overlapping current lifecycle states for same account
- historical lifecycle overwrite without trace
- closed_relationship rewrite to active_customer without controlled reactivation basis

## Segment family
- overwrite exact history without end-dating
- overlapping exclusive segment assignments without rule support

## Option-level
- write while not_enabled
- ordinary operational write while archived plan state
- unrestricted write while suspended without policy exception


# FAILURE RULE

Invalid transition must return explicit failure.

