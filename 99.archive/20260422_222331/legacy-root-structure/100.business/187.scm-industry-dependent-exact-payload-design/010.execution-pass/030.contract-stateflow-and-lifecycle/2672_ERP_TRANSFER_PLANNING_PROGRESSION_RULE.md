# ============================================================
# ERP TRANSFER PLANNING PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2672
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.transfer_planning_progression.rule
component: transfer-planning-progression-rule


# RULE

Transfer planning may progress from draft to release
to in-transit visibility and completion,
but transfer-plan truth does not disappear.

Progression should preserve:
- from and to node references
- transferred item visibility
- quantity and timing visibility
- linked WMS handoff visibility
- cancellation trace when applicable

