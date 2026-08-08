# ============================================================
# ERP CRM OPTION ACCOUNT STATUS EXACT MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-629
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_status.exact_model
component: crm-option-account-status-exact-model


# OBJECT

crm_customer_account


# PRIMARY STATUS SET

Recommended exact status set:

- active
- inactive
- duplicate_pending_resolution
- merged
- archived
- blocked_for_review


# ALLOWED TRANSITIONS

- active -> inactive
- active -> duplicate_pending_resolution
- active -> blocked_for_review
- active -> archived
- inactive -> active
- inactive -> archived
- duplicate_pending_resolution -> merged
- duplicate_pending_resolution -> active
- blocked_for_review -> active
- blocked_for_review -> archived


# PROHIBITED TRANSITIONS

- merged -> active
- merged -> inactive
- archived -> merged
- archived -> duplicate_pending_resolution
- active -> merged without merge contract
- any -> deleted by status-only mutation


# INTERPRETATION RULE

merged is terminal for the source object identity.

archived is not identity absorption.
merged is identity absorption with trace.

blocked_for_review is a governance hold state,
not a business-lifecycle substitute.

