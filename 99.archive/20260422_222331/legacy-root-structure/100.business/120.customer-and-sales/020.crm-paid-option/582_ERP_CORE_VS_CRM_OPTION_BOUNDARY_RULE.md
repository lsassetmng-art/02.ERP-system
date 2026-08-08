# ============================================================
# ERP CORE VS CRM OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-582
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_crm_option.boundary_rule
component: core-vs-crm-option-boundary-rule


# RULE

ERP core and CRM option must remain distinct.


# ERP CORE SHOULD HOLD ONLY MINIMUM NECESSARY CUSTOMER REFERENCE

Examples:
- customer_reference_id
- display_name_for_transaction
- billing_or_counterparty_reference
- basic active/inactive state
- cross-document linkage key


# CRM OPTION SHOULD HOLD RICH CUSTOMER MANAGEMENT OBJECTS

Examples:
- customer_account_detail
- customer_contact
- interaction_history
- inquiry_history
- segmentation
- lifecycle_state
- customer_owner_assignment
- customer_analysis_surface


# PRIMARY INTERPRETATION

Core customer reference exists so that ERP transactions
can function.

CRM exists so that customer relationship management
can be performed in a richer, governed, auditable way.

