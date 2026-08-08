# ============================================================
# ERP POLICY_GATE_APPROVAL_HOLD_REJECTION_AND_ROLLBACK_HOLD RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3117
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.policy_gate_approval_hold_rejection_and_rollback_hold.rule
component: policy-gate-approval-hold-rejection-and-rollback-hold-rule


# RULE

Policy-gate approval, hold, rejection, and rollback-hold progression must preserve:
- linked gate decision reference
- breach flag visibility
- hold reason visibility
- approval timing visibility
- rejected and rollback-hold trace when applicable

