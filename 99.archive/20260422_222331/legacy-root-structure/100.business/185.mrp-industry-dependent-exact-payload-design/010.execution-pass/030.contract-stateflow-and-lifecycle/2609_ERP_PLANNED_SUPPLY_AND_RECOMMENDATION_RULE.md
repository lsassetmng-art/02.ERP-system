# ============================================================
# ERP PLANNED SUPPLY AND RECOMMENDATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2609
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.planned_supply_and_recommendation.rule
component: planned-supply-and-recommendation-rule


# RULE

Planned supply and replenishment recommendation progression must preserve:
- linked demand or shortage references
- supply type visibility
- recommended quantity and due-date visibility
- downstream handoff target visibility
- acceptance or rejection trace when applicable

