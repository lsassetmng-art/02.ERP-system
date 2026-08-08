# ============================================================
# ERP V3 BOUNDARY RULE REGISTRY ENTRY CTA 001
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-517
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.registry.entry.cta001
component: boundary-rule-registry-entry-cta-001


# ABSTRACT

Materializes the explicit registry entry for:

- ERP-BR-CTA-001


# ENTRY

boundary_id: ERP-BR-CTA-001
boundary_name: effective control truth vs historical audit truth
boundary_family: CTA
status: promoted
maturity_level: canonical-ready
source_domain: management
target_domain: audit
primary_truth_owner: management
secondary_explainer: audit

boundary_statement:
Effective control state must remain distinct from
historical explanation of that control state over time.

source_object_set:
- period_state
- override_scope
- approval_requirement_state
- effective_permission_state
- policy_effective_version

linked_object_set:
- audit_event
- control_decision_reference
- control_snapshot_reference
- exception_case_reference
- reconciliation_case_reference

required_context_set:
- effective time
- decision time
- historical actor chain
- policy or authority basis
- scope and duration context

evidence_expectation:
When control-sensitive action occurs, the system must
be able to distinguish what the control state was
from how its history is later explained.

mismatch_patterns:
- audit gap while control state is valid
- control changed after the fact but history suggests earlier validity
- retroactive approval or override attachment
- historical trace incomplete for control-sensitive action

reconciliation_patterns:
- explainable_and_aligned
- aligned_with_delayed_evidence
- effective_exception_with_complete_basis
- effective_exception_with_incomplete_basis
- retroactive_justification
- unresolved_control_failure
- unresolved_audit_gap

escalation_condition:
Escalate when control-sensitive execution cannot be
classified cleanly without rewriting time order.

owner_decision_role:
- management owner for control intent
- audit owner for historical trace
- reconciliation reviewer for mismatch classification

related_documents:
- 506_ERP_V3_RULE_CONTROL_TRUTH_VS_AUDIT_TRUTH_DEEPER.md
- 507_ERP_V3_HANDOFF_AND_RECONCILIATION_BOUNDARY_RULES.md
- 503_ERP_V3_BOUNDARY_ID_CANONICAL_POLICY.md

future_extension_targets:
- control snapshot registry extension
- retroactive justification example pack
- period-control and permission-control detailed notes

notes:
This rule is one of the highest-leverage separation
rules in the ERP v3 boundary layer.

