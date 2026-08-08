# ============================================================
# ERP KNOWLEDGE VS OBSERVABILITY RECOVERY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2982
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.knowledge_vs_observability_recovery.boundary_rule
component: knowledge-vs-observability-recovery-boundary-rule


# RULE

Observability owns:
- detection and alert interpretation truth

Recovery owns:
- retry, replay, reconciliation, and merge interpretation truth

Knowledge base / playbook library / safe automation profile owns:
- recommendation interpretation
- safe automation interpretation
- knowledge revision interpretation

# CONSEQUENCE

A failure detection is not a playbook recommendation truth.
A retry entry is not a safety profile truth.

