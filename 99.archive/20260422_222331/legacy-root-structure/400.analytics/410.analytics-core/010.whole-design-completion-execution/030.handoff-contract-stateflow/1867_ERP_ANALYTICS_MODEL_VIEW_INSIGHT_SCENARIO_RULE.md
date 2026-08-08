# ============================================================
# ERP ANALYTICS MODEL VIEW INSIGHT SCENARIO RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1867
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.model_view_insight_scenario.rule
component: analytics-model-view-insight-scenario-rule


# RULE

Model, view, insight, and scenario semantics must remain distinct.

Representative distinctions:
- dataset model is not view snapshot
- view snapshot is not insight record
- insight record is not scenario snapshot
- scenario comparison is not management decision closure
- analytical insight is not audit conclusion

# CONSEQUENCE

Every model-class, view-class, insight-class, or scenario-class action must preserve:
- original analytics object reference
- reason
- actor
- timestamp
- downstream visibility

