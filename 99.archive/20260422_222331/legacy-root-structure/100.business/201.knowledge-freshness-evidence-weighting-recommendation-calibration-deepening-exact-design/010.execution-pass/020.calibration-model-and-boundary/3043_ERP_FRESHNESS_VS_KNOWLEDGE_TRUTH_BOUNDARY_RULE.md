# ============================================================
# ERP FRESHNESS VS KNOWLEDGE TRUTH BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3043
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.freshness_vs_knowledge_truth.boundary_rule
component: freshness-vs-knowledge-truth-boundary-rule


# RULE

Knowledge base owns:
- current article and playbook truth

Freshness policy owns:
- freshness interpretation
- staleness interpretation
- decay interpretation

# CONSEQUENCE

A freshness score is not current article truth.
A stale flag is not canonical knowledge deletion truth.

