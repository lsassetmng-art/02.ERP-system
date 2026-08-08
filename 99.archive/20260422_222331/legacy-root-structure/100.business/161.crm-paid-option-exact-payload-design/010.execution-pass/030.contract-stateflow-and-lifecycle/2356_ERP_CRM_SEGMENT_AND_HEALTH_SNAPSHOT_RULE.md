# ============================================================
# ERP CRM SEGMENT AND HEALTH SNAPSHOT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2356
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm.segment_and_health_snapshot.rule
component: crm-segment-and-health-snapshot-rule


# RULE

Segment and health snapshot progression must preserve:
- linked customer account
- segment basis or score basis
- effective period
- supersession visibility
- summary interpretation visibility

