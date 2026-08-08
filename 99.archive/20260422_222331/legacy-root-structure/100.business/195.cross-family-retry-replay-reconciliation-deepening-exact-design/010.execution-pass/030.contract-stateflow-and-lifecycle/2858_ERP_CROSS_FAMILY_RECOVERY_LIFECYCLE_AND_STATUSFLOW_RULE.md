# ============================================================
# ERP CROSS FAMILY RECOVERY LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2858
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery.lifecycle_and_statusflow.rule
component: cross-family-recovery-lifecycle-and-statusflow-rule


# OFFICIAL RECOVERY STATUS SET

- pending_detection
- queued_for_retry
- retrying
- queued_for_replay
- replaying
- reconciling
- awaiting_manual_action
- resolved
- failed_terminal
- archived

