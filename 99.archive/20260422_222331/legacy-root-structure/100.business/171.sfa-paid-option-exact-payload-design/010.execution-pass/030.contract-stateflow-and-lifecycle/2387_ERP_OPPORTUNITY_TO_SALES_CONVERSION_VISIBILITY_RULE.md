# ============================================================
# ERP OPPORTUNITY TO SALES CONVERSION VISIBILITY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2387
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.opportunity_to_sales_conversion_visibility.rule
component: opportunity-to-sales-conversion-visibility-rule


# RULE

Opportunity progression may create conversion visibility toward sales core,
but SFA truth and sales-core truth remain separate.

Progression should preserve:
- originating opportunity reference
- linked sales conversion reference
- conversion decision timestamp
- converted or non-converted outcome visibility

