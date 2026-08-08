# ============================================================
# ERP V3 EXAMPLE PACK M2A 001 APPROVAL AUTHORITY CHAIN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-529
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.example_pack.m2a001.approval_authority_chain
component: example-pack-m2a-001-approval-authority-chain


# ABSTRACT

First linked example pack for:

- ERP-BR-M2A-001
- approval decision to audit oversight evidence


# EXAMPLE PACK ID

example_pack_id: ERP-EP-M2A-001-A
related_boundary_id: ERP-BR-M2A-001
scenario_name: delegated approval with partially reconstructable authority path


# SOURCE OBJECT STORY

An approval-sensitive business action requires
managerial approval.

Management source objects:

- approval_request
- approval_decision
- approver_role_assignment
- approval_policy_reference

The action is later executed based on the approval.


# LINKED OBJECT STORY

Expected audit-linked objects:

- audit_event for decision completion
- decision basis reference
- delegated authority context
- actor / timestamp context

Audit preserves whether the oversight path is
historically explainable.


# EXPECTED CONTEXT SET

- required approver role
- actual approver identity
- delegation basis
- policy version
- timing of request, decision, and execution


# BASELINE INTERPRETATION

Management owns the approval decision and authority model.

Audit preserves whether that decision path can be
historically reconstructed and reviewed.


# MISMATCH VARIANT SET

## Variant A
Decision exists, but delegation basis is missing.

Interpretation:
Authority-path incompleteness.

## Variant B
Execution occurred based on approval, but policy
version at the time is unclear.

Interpretation:
Oversight ambiguity.

## Variant C
The approver identity is known, but role assignment
history does not prove authority at that time.

Interpretation:
Unresolved authority gap.

## Variant D
Basis is attached only after the approval is used.

Interpretation:
Retroactive basis attachment.


# RECONCILIATION VARIANT SET

## Variant R1
aligned

Decision, authority, and execution timing are consistent.

## Variant R2
aligned_with_late_basis_attachment

Late supporting basis still reconstructs the route
without changing the original decision meaning.

## Variant R3
retroactive_basis_attachment

The historical route depended on basis added later,
which must remain visible as such.

## Variant R4
unresolved_authority_gap

The approval path exists, but authority cannot
be proven sufficiently.

## Variant R5
unresolved_oversight_gap

Execution relied on a route whose oversight history
remains materially incomplete.


# INTERPRETATION NOTE

This example clarifies that approval truth and
oversight explainability are related but separable.

A management decision is not fully reviewable if
its authority path cannot be reconstructed.


# ANTI-MISREADING NOTE

Do not interpret this example as saying that a
stored approval record is automatically sufficient.

Do not normalize late-added authority basis into
ordinary compliant flow.

