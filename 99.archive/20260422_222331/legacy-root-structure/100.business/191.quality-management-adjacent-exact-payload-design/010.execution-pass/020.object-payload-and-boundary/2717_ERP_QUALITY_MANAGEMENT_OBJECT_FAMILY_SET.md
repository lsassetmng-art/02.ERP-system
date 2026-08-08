# ============================================================
# ERP QUALITY MANAGEMENT OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2717
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.object_family_set
component: quality-management-object-family-set


# PRIMARY OBJECT FAMILIES

- quality_inspection_case
- quality_nonconformance_case
- quality_hold_case
- corrective_action_case
- quality_release_decision_case

# RULE

Inspection is not nonconformance.
Nonconformance is not hold.
Hold is not corrective action.
Corrective action is not release decision.

