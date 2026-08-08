# ============================================================
# ERP GOVERNANCE OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1604
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.object_family_set
component: governance-object-family-set


# PRIMARY OBJECT FAMILIES

- governance_control_policy
- governance_control_requirement
- governance_exception_case
- governance_override_approval
- governance_signoff_record

# RULE

Control policy is not control requirement.
Control requirement is not exception case.
Exception case is not override approval.
Override approval is not signoff record.

