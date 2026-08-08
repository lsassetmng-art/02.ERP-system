# ============================================================
# ERP SCM NETWORK SUPPLIER LANE LIFECYCLE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1024
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.network_supplier_lane.lifecycle_rules
component: scm-network-supplier-lane-lifecycle-rules


# NODE STATUS SET

- draft
- active
- suspended
- retired
- archived


# SUPPLIER STATUS SET

- draft
- active
- watchlist
- suspended
- archived


# LANE STATUS SET

- draft
- active
- constrained
- suspended
- archived


# RULE

Suspended supplier and constrained lane are not the same.
Archived network structures must remain historically visible.

