# ============================================================
# ERP BUSINESS CORE CHAIN MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1529
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business_core.chain_map
component: business-core-chain-map


# BUSINESS CORE CHAIN MAP

Primary chain A:
- sales
- inventory
- accounting

Primary chain B:
- purchasing
- inventory
- accounting

Primary chain C:
- manufacturing
- inventory
- accounting

Cross-link chain:
- purchasing
- manufacturing

# RULE

Inventory is a business-core hub for stock-side meaning.
Accounting is a business-core hub for posting-side meaning.
Sales, purchasing, and manufacturing remain source lines for their own operational truths.

