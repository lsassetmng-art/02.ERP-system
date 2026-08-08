# ============================================================
# ERP ASSET DEPRECIATION PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2303
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset.depreciation_progression.rule
component: asset-depreciation-progression-rule


# RULE

Depreciation cycle may progress from scheduled to calculated
to accounting handoff and posting visibility.

Progression should preserve:
- linked asset reference
- fiscal period
- depreciation amount
- accumulated depreciation visibility
- accounting handoff state
- posting visibility if later received

