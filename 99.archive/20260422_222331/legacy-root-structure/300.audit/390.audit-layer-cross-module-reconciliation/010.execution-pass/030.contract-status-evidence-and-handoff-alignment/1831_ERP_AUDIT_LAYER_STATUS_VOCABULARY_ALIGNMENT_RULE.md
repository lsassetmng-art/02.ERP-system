# ============================================================
# ERP AUDIT LAYER STATUS VOCABULARY ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1831
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_layer.status_vocabulary_alignment_rule
component: audit-layer-status-vocabulary-alignment-rule


# RULE

Audit-layer status sets may differ,
but cross-module interpretation should preserve semantic differences such as:

- planned vs in_progress vs concluded
- collected vs reviewed vs invalidated
- open vs triaged vs in_remediation vs closed
- finalized vs superseded
- verified vs reopened vs closed

