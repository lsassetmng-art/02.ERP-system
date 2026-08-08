# ============================================================
# ERP CORE LINKAGE TO CRM OPTION EXACT BOUNDARY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-602
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_linkage_to_crm_option.exact_boundary
component: core-linkage-to-crm-option-exact-boundary


# PURPOSE

Defines the exact linkage boundary between ERP core
customer reference and CRM option rich objects.


# CORE MAY HOLD

- customer_reference_id
- counterparty_name
- transaction-facing display label
- billing linkage key
- order / invoice linkage key
- basic active_or_archived state


# CORE MUST NOT ASSUME

- crm_customer_contact
- crm_interaction_log
- crm_inquiry_case
- crm_customer_segment_assignment
- crm_customer_lifecycle_state


# LINKAGE RULE

When CRM option is enabled, core may link outward by:

- customer_reference_id -> crm account reference
- related_transaction_reference_id -> ERP business object reference

But the core object model must remain valid even when
the CRM-side object is absent because the option is disabled.

