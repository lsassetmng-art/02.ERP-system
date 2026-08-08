# ============================================================
# ERP SUPERSESSION AND ROLLBACK VISIBILITY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3022
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.supersession_and_rollback_visibility.rule
component: supersession-and-rollback-visibility-rule


# RULE

Supersession and rollback visibility progression must preserve:
- linked superseded object visibility
- linked release bundle visibility
- rollback reason visibility
- published and rolled-back timing visibility
- superseded and restored trace when applicable

