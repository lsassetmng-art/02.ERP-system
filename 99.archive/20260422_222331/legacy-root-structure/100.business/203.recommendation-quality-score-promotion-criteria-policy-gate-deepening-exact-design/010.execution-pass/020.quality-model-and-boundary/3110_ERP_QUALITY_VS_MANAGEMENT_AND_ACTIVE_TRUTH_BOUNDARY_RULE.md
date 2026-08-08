# ============================================================
# ERP QUALITY VS MANAGEMENT AND ACTIVE TRUTH BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3110
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_vs_management_and_active_truth.boundary_rule
component: quality-vs-management-and-active-truth-boundary-rule


# RULE

Management owns:
- higher-order approval and policy truth

Current active recommendation truth remains owned by the currently released active revision.

Quality and policy gate owns:
- quality interpretation
- gate interpretation
- promotion hold interpretation

# CONSEQUENCE

A gate decision case is not management policy truth.
A quality score is not active recommendation truth.

