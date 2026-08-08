# ============================================================
# ERP BUSINESS STATUS VOCABULARY ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1543
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business.status_vocabulary_alignment_rule
component: business-status-vocabulary-alignment-rule


# RULE

Business-core status sets may differ,
but cross-module interpretation should preserve semantic differences such as:

- draft vs submitted/released
- confirmed vs in_progress
- partially_fulfilled / partially_received vs completed
- canceled vs reversed vs returned
- reconciled vs posted

