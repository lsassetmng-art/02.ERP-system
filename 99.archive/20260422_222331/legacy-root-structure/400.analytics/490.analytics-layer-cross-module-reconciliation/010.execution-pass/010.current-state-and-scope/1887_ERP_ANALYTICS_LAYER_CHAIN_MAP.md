# ============================================================
# ERP ANALYTICS LAYER CHAIN MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1887
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_layer.chain_map
component: analytics-layer-chain-map


# ANALYTICS LAYER CHAIN MAP

Primary chain A:
- business core
- analytics core

Primary chain B:
- accounting core
- analytics core

Primary chain C:
- analytics core
- management core

Primary chain D:
- analytics core
- audit core

Primary chain E:
- analytics core
- epm

Primary reporting chain:
- business core
- accounting core
- analytics core
- management / audit / epm visibility

# RULE

Analytics core is the derived model and interpretation hub.
Business and accounting remain source lines for factual operational and posting truths.
Management, audit, and epm remain consumers of analytics visibility,
not owners of analytics-derived truth.

