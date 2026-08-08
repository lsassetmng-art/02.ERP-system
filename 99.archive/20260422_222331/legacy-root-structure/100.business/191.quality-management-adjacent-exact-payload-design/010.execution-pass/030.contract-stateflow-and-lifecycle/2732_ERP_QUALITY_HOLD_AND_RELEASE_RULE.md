# ============================================================
# ERP QUALITY HOLD AND RELEASE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2732
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_hold_and_release.rule
component: quality-hold-and-release-rule


# RULE

Quality hold and release progression must preserve:
- linked nonconformance reference
- held item and quantity visibility
- hold reason visibility
- linked inventory-hold reference visibility
- release or scrap trace when applicable

