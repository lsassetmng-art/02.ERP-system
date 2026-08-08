# ============================================================
# ERP ANALYTICS LAYER DERIVED INSIGHT SCENARIO ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1903
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_layer.derived_insight_scenario_alignment_rule
component: analytics-layer-derived-insight-scenario-alignment-rule


# RULE

Analytics-layer derived classes must remain distinct across modules.

Representative distinctions:
- derived metric is not source metric truth
- insight record is not management decision
- scenario comparison is not epm target change
- anomaly visibility is not audit finding
- financial trend visibility is not accounting close truth

