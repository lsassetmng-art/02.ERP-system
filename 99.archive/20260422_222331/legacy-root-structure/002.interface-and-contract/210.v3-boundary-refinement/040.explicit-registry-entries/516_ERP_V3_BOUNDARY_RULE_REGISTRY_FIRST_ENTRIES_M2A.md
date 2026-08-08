# ============================================================
# ERP V3 BOUNDARY RULE REGISTRY FIRST ENTRIES M2A
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-516
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.registry.first_entries.m2a
component: boundary-rule-registry-first-entries-m2a


# ABSTRACT

Materializes the first explicit registry entries
for the management_to_audit boundary family.


# ENTRY 1

boundary_id: ERP-BR-M2A-001
boundary_name: approval decision to audit oversight evidence
boundary_family: M2A
status: promoted
maturity_level: canonical-ready
source_domain: management
target_domain: audit
primary_truth_owner: management
secondary_explainer: audit

boundary_statement:
Management approval truth must remain distinct from
audit preservation of the oversight path.

source_object_set:
- approval_request
- approval_decision
- approver_role_assignment
- approval_policy_reference

linked_object_set:
- audit_event
- decision_basis_reference
- delegated_authority_context
- actor_context
- timestamp_context

required_context_set:
- requested action
- decision result
- approver authority basis
- delegation or substitution route
- policy version

evidence_expectation:
Approval-sensitive execution requires an explainable
decision basis and authority path.

mismatch_patterns:
- execution references approval but no reconstructable decision route
- decision exists without clear authority basis
- delegation path unclear
- policy reference absent or inconsistent

reconciliation_patterns:
- aligned
- aligned_with_late_basis_attachment
- retroactive_basis_attachment
- unresolved_authority_gap
- unresolved_oversight_gap

escalation_condition:
Escalate when execution depends on approval but
authority path cannot be proven.

owner_decision_role:
- management owner for approval intent
- audit owner for oversight explanation
- designated authority reviewer for unresolved authority gaps

related_documents:
- 505_ERP_V3_MANAGEMENT_TO_AUDIT_LINKED_OBJECT_MATRIX.md
- 506_ERP_V3_RULE_CONTROL_TRUTH_VS_AUDIT_TRUTH_DEEPER.md
- 507_ERP_V3_HANDOFF_AND_RECONCILIATION_BOUNDARY_RULES.md

future_extension_targets:
- approval chain example pack
- delegated authority registry note
- retroactive justification classification memo

notes:
Management decides.
Audit preserves the explainability of that decision path.


# ENTRY 2

boundary_id: ERP-BR-M2A-002
boundary_name: permission or role change to audit trace evidence
boundary_family: M2A
status: promoted
maturity_level: canonical-ready
source_domain: management
target_domain: audit
primary_truth_owner: management
secondary_explainer: audit

boundary_statement:
Effective control change must remain distinct from
audit history of how the change occurred.

source_object_set:
- role_assignment
- permission_grant
- permission_revocation
- access_policy_version

linked_object_set:
- audit_event
- change_request_reference
- actor_context
- target_scope_context
- effective_time_context

required_context_set:
- subject identity
- permission scope
- effective time
- revocation time
- policy basis
- change request or authorization basis

evidence_expectation:
Security-sensitive access change requires
reconstructable change history and basis.

mismatch_patterns:
- effective access changed without explainable management action
- trace exists but target scope differs
- revocation timing differs from effective state
- change basis attached after the fact

reconciliation_patterns:
- aligned
- aligned_with_delayed_trace
- retroactive_justification
- unresolved_control_gap
- unresolved_audit_gap

escalation_condition:
Escalate when access-sensitive actions rely on a
change that cannot be historically explained.

owner_decision_role:
- management owner for effective control state
- audit owner for historical trace adequacy
- security or governance reviewer for unresolved access gaps

related_documents:
- 505_ERP_V3_MANAGEMENT_TO_AUDIT_LINKED_OBJECT_MATRIX.md
- 506_ERP_V3_RULE_CONTROL_TRUTH_VS_AUDIT_TRUTH_DEEPER.md
- 491_ERP_V3_BOUNDARY_RULE_REGISTRY_SUMMARY.md

future_extension_targets:
- access change example pack
- control snapshot linkage note
- security exception extension memo

notes:
A current correct permission state does not erase
historical timing mismatch.

