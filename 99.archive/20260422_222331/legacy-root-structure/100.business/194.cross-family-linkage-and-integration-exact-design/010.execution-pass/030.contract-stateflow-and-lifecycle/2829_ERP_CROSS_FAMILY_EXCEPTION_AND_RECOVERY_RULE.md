# ============================================================
# ERP CROSS FAMILY EXCEPTION AND RECOVERY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2829
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family.exception_and_recovery.rule
component: cross-family-exception-and-recovery-rule


# RULE

Cross-family recovery must preserve:
- original handoff_id
- correlation_id
- replay_token
- failure summary visibility
- retry scheduling visibility
- completed or canceled terminal trace

