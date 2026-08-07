# ============================================================
# ERP V3 BOUNDARY DEEPER PASS CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-502
owner: Boss
prepared_by: Zero
last_updated: 2026-04-14
scope: erp.v3.boundary_refinement.deeper_pass.current_state
component: boundary-deeper-pass-current-state


# ABSTRACT

Defines the current state for the deeper pass of the
first promoted v3 program:
boundary_refinement_program.

The first pass already established:
- ambiguity shortlist
- first refinement targets
- first rule drafts
- first registry direction
- audit-facing extension
- root navigation integration through 501

This document formalizes the second step:
explicit boundary IDs, linked-object examples,
handoff rules, and reconciliation-aware boundary design.


# CURRENT POSITION

The design is no longer deciding whether boundary
refinement is needed.

That decision has already been taken.

The active task now is to deepen the promoted
boundary refinement program so that the rules
become operationally traceable and registry-safe.


# FIRST PASS ALREADY COMPLETED

The first pass established:

- source_truth_vs_derived_surface
- native_core_vs_boundary_surface
- analytics_to_business
- analytics_to_management
- business_to_audit
- management_to_audit
- control_truth_vs_audit_truth

However, the first pass still left several areas
at summary level.


# REMAINING GAPS

The remaining gaps are:

1. explicit boundary ID policy is not fixed enough
2. linked-object examples are still too abstract
3. second-wave rules need concrete comparison objects
4. handoff boundaries are not yet formalized
5. reconciliation-facing boundary rules are not yet
   connected explicitly
6. control truth and audit truth still require a more
   exact distinction for exception handling


# DEEPER PASS OBJECTIVES

The deeper pass must achieve all of the following:

- make each promoted boundary rule traceable
- define stable boundary IDs
- define mandatory registry fields
- attach representative linked-object examples
- define handoff package expectations
- define reconciliation consequences for mismatch
- preserve domain ownership while improving
  cross-domain explainability


# ACTIVE FOCUS

The deeper pass focuses primarily on:

- business_to_audit
- management_to_audit
- control_truth_vs_audit_truth
- handoff / reconciliation boundary extension


# OUTPUTS OF THIS PASS

This deeper pass produces:

- canonical boundary ID policy
- business_to_audit linked-object matrix
- management_to_audit linked-object matrix
- control_truth_vs_audit_truth rule refinement
- handoff and reconciliation boundary rules
- deeper pass summary
- root patch notes
- root navigation continuation


# CONSTRAINTS

Do not reopen already-root-connected domains
from scratch.

Do not collapse audit into business,
or business into audit.

Do not collapse management control into audit
history.

Do not use derived surfaces as if they are
native domain truths.

Domain ownership must remain explicit even when
evidence, summaries, and reconciliations cross
domain boundaries.

