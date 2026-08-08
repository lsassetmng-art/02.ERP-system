# ============================================================
# ERP V3 RULE CONTROL TRUTH VS AUDIT TRUTH DEEPER
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-506
owner: Boss
prepared_by: Zero
last_updated: 2026-04-14
scope: erp.v3.boundary_refinement.control_truth_vs_audit_truth.deeper
component: control-truth-vs-audit-truth-deeper


# ABSTRACT

Deepens the boundary rule for
control_truth_vs_audit_truth.

This distinction is one of the highest-leverage
boundary separations in ERP because control state
is often confused with historical audit narrative.

This document fixes the distinction and its
consequences for exception handling,
retroactive changes, and reconciliation.


# DEFINITIONS

Control truth:
the effective declared control state that governs
what the system or operator is currently allowed
or expected to do.

Examples:
- whether a period is open
- whether an approval is required
- whether a role has permission
- whether an override is currently active

Audit truth:
the historical explanatory record of what control
state was declared, applied, changed, bypassed,
or violated at a particular time.


# PRIMARY DISTINCTION

Control truth answers:
"What is or was the effective control state for operation?"

Audit truth answers:
"How can we explain and verify what happened
regarding that control state over time?"


# CORE RULE

Control truth governs operation.

Audit truth governs historical explainability.

They are related but not interchangeable.


# BOUNDARY ID

boundary_id: ERP-BR-CTA-001
boundary_name: effective control truth vs historical audit truth


# CONSEQUENCE 1

A corrected control state does not erase
prior audit history.

If management fixes a permission issue today,
audit truth must still preserve that the wrong
permission existed yesterday.


# CONSEQUENCE 2

An audit discrepancy does not automatically mean
the current control truth is wrong.

It may mean:
- the historical trace is incomplete
- the evidence is delayed
- the bypass was unrecorded
- the control rule was violated


# CONSEQUENCE 3

Retroactive control justification is not normal compliance.

If an approval or override is created after the
fact to explain an earlier action, that must be
preserved as a retroactive justification case.


# CONSEQUENCE 4

Control truth snapshots and audit truth traces
must be linkable but separable.

Recommended linkage set:

- control_snapshot_id
- audit_event_id
- control_decision_id
- exception_case_id
- reconciliation_case_id


# CANONICAL SCENARIOS

## Scenario A
Period closed, but posting occurred.

Control truth question:
Was the period effectively closed at posting time?

Audit truth question:
What trace exists showing why posting still occurred?

Required result:
Do not rewrite period history to hide the event.
Preserve discrepancy or exception path.

## Scenario B
Permission granted late.

Control truth question:
When did access become effective?

Audit truth question:
Was the earlier action performed before valid access existed?

Required result:
Preserve timing mismatch.
Do not backfill normal compliance.

## Scenario C
Override used outside approved scope.

Control truth question:
What override scope was actually effective?

Audit truth question:
What historical evidence shows the overreach?

Required result:
Keep scope mismatch visible and reviewable.

## Scenario D
Policy version changed after operation.

Control truth question:
Which version was effective at operation time?

Audit truth question:
How do we explain later reinterpretation?

Required result:
Use historical effective version for evaluation,
not current rewritten memory.


# RECONCILIATION RULE

When control truth and audit truth appear misaligned,
reconciliation must classify the condition into one
of the following:

- explainable and aligned
- aligned but evidence delayed
- effective exception with complete basis
- effective exception with incomplete basis
- retroactive justification
- unresolved control failure
- unresolved audit gap

These classifications must remain visible until resolved.


# PROHIBITIONS

Prohibited patterns:

- rewriting control history only to make audit look clean
- rewriting audit history to pretend control was valid
- collapsing historical mismatch into a silent update
- treating missing evidence as automatically compliant


# DECISION ROLES

Management decides control intent.

Audit preserves historical traceability.

Reconciliation compares and classifies the gap.

These roles must not be collapsed into one hidden function.

