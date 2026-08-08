# ============================================================
# ERP ROLLBACK AND HOLDPOINT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2002
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.rollback_and_holdpoint.rule
component: rollback-and-holdpoint-rule


# RULE

Execution preparation should require explicit holdpoints for:
- prerequisite failure
- schema mismatch
- payload mismatch
- verification failure
- cross-domain breakage

Rollback thinking should exist before execution,
even when the actual rollback block is authored later.

