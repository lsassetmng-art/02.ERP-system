# ============================================================
# ERP FAILURE DETECTION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2891
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.failure_detection.rule
component: failure-detection-rule


# RULE

Failure detection progression must preserve:
- linked failure taxonomy reference
- source and target family visibility
- severity visibility
- retryability visibility
- first detected timing
- duplicate or repeat detection trace when applicable

