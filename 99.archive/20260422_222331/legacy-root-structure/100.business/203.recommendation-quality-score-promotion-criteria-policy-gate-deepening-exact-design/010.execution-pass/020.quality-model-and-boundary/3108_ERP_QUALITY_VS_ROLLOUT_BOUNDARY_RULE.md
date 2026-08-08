# ============================================================
# ERP QUALITY VS ROLLOUT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3108
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_vs_rollout.boundary_rule
component: quality-vs-rollout-boundary-rule


# RULE

Rollout governance owns:
- phased exposure interpretation
- canary and rollback interpretation

Quality and policy gate owns:
- promotion-readiness interpretation
- gate breach interpretation
- hold and reject interpretation

# CONSEQUENCE

A rollout plan is not promotion-readiness truth.
A promotion evaluation may consume rollout evidence,
but it does not replace rollout-owned truth.

