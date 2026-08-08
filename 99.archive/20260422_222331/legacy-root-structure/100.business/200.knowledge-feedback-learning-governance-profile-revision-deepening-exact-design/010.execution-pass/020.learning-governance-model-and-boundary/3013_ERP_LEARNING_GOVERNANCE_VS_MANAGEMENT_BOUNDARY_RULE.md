# ============================================================
# ERP LEARNING GOVERNANCE VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3013
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.learning_governance_vs_management.boundary_rule
component: learning-governance-vs-management-boundary-rule


# RULE

Learning governance owns:
- revision request interpretation
- validation interpretation
- release-bundle interpretation

Management owns:
- higher-order approval and policy truth

# CONSEQUENCE

A revision decision case is not management policy truth.
Learning governance may require management visibility,
but it does not replace management-owned truth.

