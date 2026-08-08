# ============================================================
# ERP REPLAY AND REPROCESSING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2860
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.replay_and_reprocessing.rule
component: replay-and-reprocessing-rule


# RULE

Replay and reprocessing must preserve:
- original event reference
- replay token visibility
- replay reason visibility
- started and completed timing visibility
- duplicate suppression visibility
- completed or failed trace when applicable

