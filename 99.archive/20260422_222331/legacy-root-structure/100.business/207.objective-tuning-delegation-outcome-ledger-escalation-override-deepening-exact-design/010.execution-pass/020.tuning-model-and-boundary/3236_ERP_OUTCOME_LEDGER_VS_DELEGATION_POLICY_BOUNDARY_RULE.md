# ============================================================
# ERP OUTCOME LEDGER VS DELEGATION POLICY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3236
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.outcome_ledger_vs_delegation_policy.boundary_rule
component: outcome-ledger-vs-delegation-policy-boundary-rule


# RULE

Delegation policy owns:
- eligibility interpretation
- delegate level interpretation

Delegation outcome ledger owns:
- realized outcome interpretation
- outcome quality interpretation
- post-delegation risk shift interpretation

# CONSEQUENCE

An outcome ledger row is not delegation eligibility truth.
A ledger entry may consume delegation references,
but it does not replace delegation-policy-owned truth.

