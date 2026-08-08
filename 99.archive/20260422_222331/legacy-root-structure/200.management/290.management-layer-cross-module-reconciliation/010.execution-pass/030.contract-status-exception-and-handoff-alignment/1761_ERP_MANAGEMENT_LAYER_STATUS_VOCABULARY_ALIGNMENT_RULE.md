# ============================================================
# ERP MANAGEMENT LAYER STATUS VOCABULARY ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1761
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_layer.status_vocabulary_alignment_rule
component: management-layer-status-vocabulary-alignment-rule


# RULE

Management-layer status sets may differ,
but cross-module interpretation should preserve semantic differences such as:

- draft vs active vs frozen
- in_review vs reviewed vs closed
- escalated vs approved vs signed
- directive completion vs labor completion
- scorecard published vs variance closed

