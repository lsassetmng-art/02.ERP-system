# ============================================================
# ERP RETRY PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2859
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.retry_progression.rule
component: retry-progression-rule


# RULE

Retry progression must preserve:
- original handoff reference
- retry attempt count
- retry reason visibility
- max retry limit visibility
- terminal failure trace when applicable

