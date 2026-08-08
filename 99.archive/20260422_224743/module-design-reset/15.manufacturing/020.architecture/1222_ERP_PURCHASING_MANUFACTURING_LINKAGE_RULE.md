# ============================================================
# ERP PURCHASING MANUFACTURING LINKAGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1222
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.purchasing_manufacturing.linkage_rule
component: purchasing-manufacturing-linkage-rule


# RULE

Purchasing and manufacturing should be read as a linked business-core chain.

Representative linkage families:
- component or material need fulfillment
- upstream sourcing impact on production continuity
- production output impact on inventory and downstream accounting

# CONSEQUENCE

Purchasing and manufacturing whole-design completion
must preserve their mutual dependency semantics.

