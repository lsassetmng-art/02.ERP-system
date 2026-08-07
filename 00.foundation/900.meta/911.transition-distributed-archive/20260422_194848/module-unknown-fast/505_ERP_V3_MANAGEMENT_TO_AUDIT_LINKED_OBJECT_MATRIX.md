# ============================================================
# ERP V3 MANAGEMENT TO AUDIT LINKED OBJECT MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-505
owner: Boss
prepared_by: Zero
last_updated: 2026-04-14
scope: erp.v3.boundary_refinement.management_to_audit.linked_object_matrix
component: management-to-audit-linked-object-matrix


# ABSTRACT

Defines representative linked-object patterns for
the management_to_audit boundary family.

Management owns control decisions, permission
structures, operational oversight declarations,
and policy enforcement intent.

Audit preserves the historical explanation of
what was declared, what took effect, what was
bypassed, and what remained unresolved.


# PRINCIPLE

Management truth is not the same thing as
audit history.

Management may declare the intended control state.

Audit records how that control state appeared,
changed, was applied, or was violated over time.


# BOUNDARY ENTRY 1

boundary_id: ERP-BR-M2A-001
boundary_name: approval decision to audit oversight evidence

Representative route:
approval request -> approval decision -> execution -> audit oversight trace

Management source objects:
- approval_request
- approval_decision
- approver_role_assignment
- approval_policy_reference

Audit linked objects:
- audit_event for decision completion
- audit_evidence reference to decision basis
- actor / timestamp / delegated authority context

Primary truth owner:
- management

Audit role:
- preserve explainable oversight path

Mismatch signals:
- execution references approval that cannot be reconstructed
- decision trace exists but policy/role basis is missing
- delegated authority unclear

Expected reconciliation:
- reconstruct authority chain
- attach supporting basis references
- mark unresolved when authority path is not provable


# BOUNDARY ENTRY 2

boundary_id: ERP-BR-M2A-002
boundary_name: permission or role change to audit trace evidence

Representative route:
role assignment -> permission update -> effective access change -> audit trace

Management source objects:
- role_assignment
- permission_grant
- permission_revocation
- access_policy_version

Audit linked objects:
- audit_event for change execution
- audit_evidence reference to change request or policy basis
- actor / target / scope context

Primary truth owner:
- management

Audit role:
- preserve explainability of access change history

Mismatch signals:
- effective access changed with no explainable management action
- audit trace exists but target scope differs
- revocation timing differs from effective change time

Expected reconciliation:
- compare management change object with effective state trace
- preserve timing mismatch explicitly
- prohibit silent normalization


# BOUNDARY ENTRY 3

boundary_id: ERP-BR-M2A-003
boundary_name: policy publication to audit policy-effect trace

Representative route:
policy draft -> policy publication -> effective date -> audit reference trail

Management source objects:
- policy_document
- policy_version
- effective_scope
- publication_decision

Audit linked objects:
- audit_event for policy publication
- audit_evidence reference to published version snapshot
- distribution / acknowledgement trace when applicable

Primary truth owner:
- management

Audit role:
- preserve what policy version became effective and when

Mismatch signals:
- effective policy claimed in operations but no publication trace
- publication trace points to wrong version
- acknowledgement or rollout evidence missing for controlled areas

Expected reconciliation:
- align effective version, publication event, and evidence snapshot
- preserve unresolved rollout gap when impact exists


# BOUNDARY ENTRY 4

boundary_id: ERP-BR-M2A-004
boundary_name: manual override control to audit exception evidence

Representative route:
manual override approval -> operational bypass -> audit exception record

Management source objects:
- override_request
- override_decision
- override_scope
- override_expiry

Audit linked objects:
- audit_event for override execution
- audit_evidence reference to justification and approver context
- follow-up trace for expiry or closure

Primary truth owner:
- management

Audit role:
- preserve why the normal control route was intentionally bypassed

Mismatch signals:
- override used with no decision object
- override expiry not reflected in closure trace
- scope of actual bypass exceeds approved scope

Expected reconciliation:
- compare scope, duration, and actual bypass event
- preserve excess-scope condition as control failure candidate


# BOUNDARY ENTRY 5

boundary_id: ERP-BR-M2A-005
boundary_name: period control decision to audit period-state history

Representative route:
close/open decision -> effective period state -> exceptional posting -> audit history

Management source objects:
- period_control_decision
- period_state
- exception_posting_authorization

Audit linked objects:
- audit_event for state change
- audit_event for exception posting
- audit_evidence reference to authority basis and timing

Primary truth owner:
- management

Audit role:
- preserve historical explanation of effective control state over time

Mismatch signals:
- posting occurred during declared closed state with no exception basis
- audit history shows state not aligned with effective control record
- exception authorization after the fact

Expected reconciliation:
- compare effective control snapshot, posting time, and authority chain
- preserve retroactive authorization as special-case exception, not normal compliance


# REQUIRED LINKED OBJECT MINIMUM

For a promoted management_to_audit rule,
the minimum linked-object expectation is:

- one management control object set
- one audit history object
- one actor / authority context
- one policy or evidence basis reference


# CONSTRAINTS

Audit must not become the active owner of
current control intent.

Management must not overwrite audit history
simply to remove embarrassment or inconsistency.

Historical mismatch must remain visible.

