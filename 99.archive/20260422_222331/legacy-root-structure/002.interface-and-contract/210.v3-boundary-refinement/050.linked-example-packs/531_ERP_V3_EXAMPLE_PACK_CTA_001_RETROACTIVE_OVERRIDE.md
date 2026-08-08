# ============================================================
# ERP V3 EXAMPLE PACK CTA 001 RETROACTIVE OVERRIDE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-531
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.example_pack.cta001.retroactive_override
component: example-pack-cta-001-retroactive-override


# ABSTRACT

First linked example pack for:

- ERP-BR-CTA-001
- effective control truth vs historical audit truth


# EXAMPLE PACK ID

example_pack_id: ERP-EP-CTA-001-A
related_boundary_id: ERP-BR-CTA-001
scenario_name: retroactive override attached after control-sensitive posting


# SOURCE OBJECT STORY

A posting occurs during a period that appears to
have been closed at the time.

Relevant control-side objects:

- period_state
- override_scope
- approval_requirement_state
- policy_effective_version

After the posting is noticed, an override record
is created to justify the action.


# LINKED OBJECT STORY

Expected audit-linked objects:

- audit_event for posting
- control_decision reference
- control snapshot reference
- exception case reference
- reconciliation case reference

Audit preserves how the action and later
justification relate over time.


# EXPECTED CONTEXT SET

- actual posting time
- period control state at posting time
- override decision time
- approver authority basis
- scope and duration of override
- historical trace of detection and review


# BASELINE INTERPRETATION

Management owns control truth:
what the effective control state actually was.

Audit owns historical explainability:
how that state and its later justification are preserved.


# MISMATCH VARIANT SET

## Variant A
Period was closed, posting occurred, and no override existed.

Interpretation:
Potential control breach.

## Variant B
Override exists, but was created only after posting.

Interpretation:
Retroactive justification.

## Variant C
Override existed, but scope does not clearly cover the posting.

Interpretation:
Scope mismatch.

## Variant D
Current records were cleaned to look compliant,
but historical sequence still shows late approval.

Interpretation:
History rewrite risk.


# RECONCILIATION VARIANT SET

## Variant R1
effective_exception_with_complete_basis

An override truly existed in time and scope.

## Variant R2
effective_exception_with_incomplete_basis

An exception route seems real, but evidence remains incomplete.

## Variant R3
retroactive_justification

Later approval or override was added to explain
an earlier control-sensitive action.

## Variant R4
unresolved_control_failure

The posting cannot be justified without rewriting control history.

## Variant R5
unresolved_audit_gap

The control state may be inferable, but the
historical record remains materially incomplete.


# INTERPRETATION NOTE

This example shows why control truth and audit truth
must remain separated.

A later explanation does not change what the
effective control state was at the moment of action.


# ANTI-MISREADING NOTE

Do not normalize retroactive override into
standard compliant operation.

Do not rewrite control history to make audit
narrative cleaner.

