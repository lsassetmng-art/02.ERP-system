# ============================================================
# ERP RECONCILIATION AND MERGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2861
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.reconciliation_and_merge.rule
component: reconciliation-and-merge-rule


# RULE

Reconciliation and merge progression must preserve:
- source and target status snapshots
- mismatch category visibility
- late event merge reason visibility
- merge strategy visibility
- resolved and unresolved trace when applicable

