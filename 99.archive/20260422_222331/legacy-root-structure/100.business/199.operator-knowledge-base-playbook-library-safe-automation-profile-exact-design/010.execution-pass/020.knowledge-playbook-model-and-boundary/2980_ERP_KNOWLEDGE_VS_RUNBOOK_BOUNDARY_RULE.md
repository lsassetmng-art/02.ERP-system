# ============================================================
# ERP KNOWLEDGE VS RUNBOOK BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2980
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.knowledge_vs_runbook.boundary_rule
component: knowledge-vs-runbook-boundary-rule


# RULE

Knowledge base and playbook library own:
- article interpretation truth
- recommendation interpretation truth

Runbook / automation boundary owns:
- activation, gating, execution, and override truth

# CONSEQUENCE

A playbook recommendation is not a runbook execution truth.
A runbook session may consume knowledge references,
but it does not replace knowledge-owned interpretation.

