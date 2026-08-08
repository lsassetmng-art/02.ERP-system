# ============================================================
# ERP V3 BOUNDARY ID CANONICAL POLICY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-503
owner: Boss
prepared_by: Zero
last_updated: 2026-04-14
scope: erp.v3.boundary_refinement.boundary_id_policy
component: boundary-id-canonical-policy


# ABSTRACT

Defines the canonical ID policy for promoted
boundary rules in ERP v3 boundary refinement.

Boundary IDs are required so that refinement
rules can be:
- referenced stably
- linked from registries
- attached to examples
- matured from draft to canonical
- used in navigation and governance notes


# POLICY GOAL

A boundary rule must not remain a free-text idea.

It must become a stable design object.


# BOUNDARY ID FORMAT

Canonical format:

ERP-BR-<FAMILY>-<NNN>

Where:

- ERP = system prefix
- BR = boundary rule
- FAMILY = boundary family code
- NNN = stable sequence number


# FAMILY CODES

Approved first family codes:

- STV = source_truth_vs_derived_surface
- NCB = native_core_vs_boundary_surface
- A2B = analytics_to_business
- A2M = analytics_to_management
- B2A = business_to_audit
- M2A = management_to_audit
- CTA = control_truth_vs_audit_truth
- HRC = handoff_and_reconciliation


# EXAMPLE IDS

Representative examples:

- ERP-BR-B2A-001
- ERP-BR-B2A-002
- ERP-BR-M2A-001
- ERP-BR-CTA-001
- ERP-BR-HRC-001


# REQUIRED REGISTRY FIELDS

Every promoted boundary rule entry must carry
at minimum the following fields:

- boundary_id
- boundary_name
- boundary_family
- status
- maturity_level
- source_domain
- target_domain
- primary_truth_owner
- secondary_explainer
- native_object_set
- linked_object_set
- evidence_expectation
- mismatch_pattern
- reconciliation_pattern
- owner_decision_role
- related_rule_documents
- related_navigation_documents
- notes


# STATUS MODEL

Recommended lifecycle:

- proposed
- drafted
- reviewed
- promoted
- canonical
- superseded

A superseded rule must keep its original ID.

Renumbering is prohibited.


# VERSIONING RULE

If semantics materially change, version the rule
document or attach a revision note.

Do not recycle the same boundary ID for a
different meaning.


# OWNERSHIP RULE

A boundary ID identifies the rule object.

It does not transfer truth ownership.

Truth ownership must still be declared separately
inside the rule fields.


# LINKAGE RULE

A boundary ID may link to:

- rule draft documents
- summary documents
- registry entries
- navigation rules
- example packs
- handoff packs
- reconciliation notes

But the ID itself must remain short and stable.


# FIRST ASSIGNED IDS

The following IDs are reserved by this pass:

- ERP-BR-B2A-001 = business event to audit evidence alignment
- ERP-BR-B2A-002 = business exception to audit escalation alignment
- ERP-BR-M2A-001 = management decision to audit oversight evidence
- ERP-BR-M2A-002 = permission/control change to audit trace evidence
- ERP-BR-CTA-001 = effective control truth vs historical audit truth
- ERP-BR-HRC-001 = handoff package vs reconciliation closure boundary


# CONSTRAINTS

Boundary IDs are immutable once promoted.

Human-readable labels may improve later,
but IDs must stay stable.

Do not mix one ID with multiple unrelated
comparison problems.

One ID should represent one clear boundary rule.

