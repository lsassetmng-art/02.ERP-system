# ============================================================
# ERP MANAGEMENT REVIEW TO APPROVAL PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2263
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.review_to_approval_progression.rule
component: management-review-to-approval-progression-rule


# RULE

Review may justify an approval gate request,
but review truth does not disappear.

Progression should preserve:
- originating review reference
- approver reference
- approval level
- decision timestamp
- rejection visibility if applicable

