# ============================================================
# ERP MINIMUM CORE CUSTOMER REFERENCE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-583
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.minimum_core_customer_reference.rule
component: minimum-core-customer-reference-rule


# PURPOSE

Defines the minimum customer-side data that may
remain in ERP core even when CRM is optional.


# MINIMUM CORE REFERENCE SET

Recommended minimum set:

- customer_reference_id
- counterparty_name
- transaction-facing display label
- billing reference linkage
- sales/order/invoice linkage key
- active_or_archived flag


# EXCLUSIONS

The following should not be assumed in core by default:

- rich contact history
- full inquiry history
- segmentation logic
- lifecycle interpretation
- relationship ownership workflow
- customer analysis layer


# INTERPRETATION RULE

Core holds enough to let ERP transactions refer to
a customer or counterparty.

CRM holds the richer customer-management surface.

