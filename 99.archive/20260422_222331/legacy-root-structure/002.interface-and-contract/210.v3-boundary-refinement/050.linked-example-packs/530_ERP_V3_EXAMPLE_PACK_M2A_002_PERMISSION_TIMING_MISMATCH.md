# ============================================================
# ERP V3 EXAMPLE PACK M2A 002 PERMISSION TIMING MISMATCH
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-530
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.example_pack.m2a002.permission_timing_mismatch
component: example-pack-m2a-002-permission-timing-mismatch


# ABSTRACT

First linked example pack for:

- ERP-BR-M2A-002
- permission or role change to audit trace evidence


# EXAMPLE PACK ID

example_pack_id: ERP-EP-M2A-002-A
related_boundary_id: ERP-BR-M2A-002
scenario_name: effective permission change with delayed trace and action timing mismatch


# SOURCE OBJECT STORY

A user performs an access-sensitive action.

Management source objects involved:

- role_assignment
- permission_grant
- permission_revocation
- access_policy_version

Later review asks whether the user truly had
the effective permission at the time of action.


# LINKED OBJECT STORY

Expected audit-linked objects:

- audit_event for permission change
- change request reference
- actor / target / scope context
- effective time context

Audit preserves how the access state changed over time.


# EXPECTED CONTEXT SET

- subject identity
- permission scope
- action time
- grant effective time
- revocation effective time
- policy basis
- change authorization reference


# BASELINE INTERPRETATION

Management owns the effective access control state.

Audit explains when and how that state changed,
and whether the historical route is reconstructable.


# MISMATCH VARIANT SET

## Variant A
Permission grant exists, but was effective only
after the action already happened.

Interpretation:
Timing mismatch.

## Variant B
Effective access state is correct now, but no
change trace explains how it became correct.

Interpretation:
Historical trace gap.

## Variant C
Revocation time in management state differs from
revocation trace in audit history.

Interpretation:
State-history inconsistency.

## Variant D
A basis reference is attached after the fact to
justify earlier action.

Interpretation:
Retroactive justification risk.


# RECONCILIATION VARIANT SET

## Variant R1
aligned

Access-sensitive action occurred within proven valid scope.

## Variant R2
aligned_with_delayed_trace

Historical trace was delayed, but timing still
supports the action.

## Variant R3
retroactive_justification

Later records attempt to justify an earlier
access-sensitive action.

## Variant R4
unresolved_control_gap

The effective permission state at action time
cannot be validated.

## Variant R5
unresolved_audit_gap

The action may be valid, but the historical
change trail is materially incomplete.


# INTERPRETATION NOTE

This example highlights that a correct present
permission state does not settle the past.

The timing of control validity matters.


# ANTI-MISREADING NOTE

Do not read this example as allowing present-day
state to erase past access uncertainty.

Do not treat after-the-fact basis attachment as
ordinary proof of prior compliance.

