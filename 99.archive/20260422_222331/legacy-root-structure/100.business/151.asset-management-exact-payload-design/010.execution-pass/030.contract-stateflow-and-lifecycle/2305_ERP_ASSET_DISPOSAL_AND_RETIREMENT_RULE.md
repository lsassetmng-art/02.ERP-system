# ============================================================
# ERP ASSET DISPOSAL AND RETIREMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2305
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset.disposal_and_retirement.rule
component: asset-disposal-and-retirement-rule


# RULE

Disposal may progress through approval to disposal,
but disposal truth must preserve:
- linked asset reference
- disposal reason
- disposal method
- expected proceeds
- accounting handoff state
- final retirement visibility

