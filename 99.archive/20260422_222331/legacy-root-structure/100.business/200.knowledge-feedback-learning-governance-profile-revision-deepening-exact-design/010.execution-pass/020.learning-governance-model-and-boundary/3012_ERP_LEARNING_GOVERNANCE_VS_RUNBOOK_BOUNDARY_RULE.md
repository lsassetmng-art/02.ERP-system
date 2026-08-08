# ============================================================
# ERP LEARNING GOVERNANCE VS RUNBOOK BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3012
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.learning_governance_vs_runbook.boundary_rule
component: learning-governance-vs-runbook-boundary-rule


# RULE

Runbook / automation boundary owns:
- activation, gating, execution, and override truth

Learning governance owns:
- retrospective feedback interpretation
- playbook effectiveness interpretation
- revision interpretation

# CONSEQUENCE

A runbook execution session is not a playbook effectiveness review truth.
A review case may consume runbook evidence,
but it does not replace runbook-owned truth.

