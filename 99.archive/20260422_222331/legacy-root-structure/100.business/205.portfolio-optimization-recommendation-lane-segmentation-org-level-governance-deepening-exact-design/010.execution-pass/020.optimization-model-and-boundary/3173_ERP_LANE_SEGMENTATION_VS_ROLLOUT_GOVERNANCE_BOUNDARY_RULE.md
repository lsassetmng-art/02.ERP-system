# ============================================================
# ERP LANE SEGMENTATION VS_ROLLOUT_GOVERNANCE_BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3173
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.lane_segmentation_vs_rollout_governance.boundary_rule
component: lane-segmentation-vs-rollout-governance-boundary-rule


# RULE

Rollout governance owns:
- phased exposure interpretation
- canary and rollback interpretation

Lane segmentation owns:
- lane allocation interpretation
- lane cap interpretation
- lane-specific routing interpretation

# CONSEQUENCE

A rollout phase is not lane-allocation truth.
A lane assignment may consume rollout references,
but it does not replace rollout-owned truth.

