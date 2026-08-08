# ============================================================
# ERP DOWNTIME AND RECOVERY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2766
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.downtime_and_recovery.rule
component: downtime-and-recovery-rule


# RULE

Downtime and recovery progression must preserve:
- linked asset and work-center references
- downtime reason visibility
- downtime start and end visibility
- duration visibility
- resolved and reviewed trace when applicable

