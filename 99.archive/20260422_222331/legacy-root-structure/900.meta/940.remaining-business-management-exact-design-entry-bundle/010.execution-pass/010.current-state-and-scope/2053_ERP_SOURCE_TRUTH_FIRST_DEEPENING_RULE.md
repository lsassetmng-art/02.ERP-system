# ============================================================
# ERP SOURCE TRUTH FIRST DEEPENING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2053
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.source_truth_first.deepening_rule
component: source-truth-first-deepening-rule


# RULE

Remaining exact design should deepen in this order:
1. sales
2. purchase
3. inventory
4. accounting
5. management operations and evaluation

# REASON

ERP source-truth business modules should stabilize
before higher-order management execution logic expands further.

