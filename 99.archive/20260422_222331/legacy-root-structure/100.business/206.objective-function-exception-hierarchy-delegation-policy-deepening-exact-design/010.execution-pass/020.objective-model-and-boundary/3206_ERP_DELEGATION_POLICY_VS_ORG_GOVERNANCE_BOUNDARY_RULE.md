# ============================================================
# ERP DELEGATION POLICY VS ORG GOVERNANCE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3206
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.delegation_policy_vs_org_governance.boundary_rule
component: delegation-policy-vs-org-governance-boundary-rule


# RULE

Org governance owns:
- org-wide governance interpretation
- org-exception interpretation

Delegation policy owns:
- delegate eligibility interpretation
- delegate level interpretation
- escalation-on-delegation interpretation

# CONSEQUENCE

A delegation decision is not org-governance truth.
A delegation application may consume org-governance references,
but it does not replace org-governance-owned truth.

