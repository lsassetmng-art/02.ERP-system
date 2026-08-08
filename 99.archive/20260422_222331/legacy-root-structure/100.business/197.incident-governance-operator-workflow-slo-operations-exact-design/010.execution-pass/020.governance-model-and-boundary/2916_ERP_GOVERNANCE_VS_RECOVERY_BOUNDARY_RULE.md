# ============================================================
# ERP GOVERNANCE VS RECOVERY_BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2916
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_vs_recovery.boundary_rule
component: governance-vs-recovery-boundary-rule


# RULE

Recovery owns:
- retry, replay, reconciliation, and merge interpretation truth

Incident governance owns:
- operator assignment, escalation, and closure decision truth

# CONSEQUENCE

A retry entry is not operator assignment truth.
An operator work item may consume recovery references,
but it does not replace recovery-owned interpretation.

