# ============================================================
# ERP PREREQUISITE MATRIX RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1967
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.prerequisite_matrix.rule
component: prerequisite-matrix-rule


# RULE

No downstream delivery unit should start before:
- its source contracts are fixed
- its validation method exists
- its rollback or correction path is understood

