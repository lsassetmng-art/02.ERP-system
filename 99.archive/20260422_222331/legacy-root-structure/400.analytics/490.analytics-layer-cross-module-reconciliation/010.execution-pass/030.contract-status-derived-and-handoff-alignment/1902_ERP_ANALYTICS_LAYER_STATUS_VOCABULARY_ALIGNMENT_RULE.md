# ============================================================
# ERP ANALYTICS LAYER STATUS VOCABULARY ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1902
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_layer.status_vocabulary_alignment_rule
component: analytics-layer-status-vocabulary-alignment-rule


# RULE

Analytics-layer status sets may differ,
but cross-module interpretation should preserve semantic differences such as:

- draft vs active vs suspended
- published vs superseded
- reviewed vs actioned
- calculated vs compared
- stale vs fresh derived visibility interpretation

