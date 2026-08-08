# ============================================================
# ERP V3 BOUNDARY LINKED EXAMPLE PACK POLICY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-520
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.linked_example_pack_policy
component: boundary-linked-example-pack-policy


# ABSTRACT

Defines the policy for future linked example packs
attached to explicit boundary rule registry entries.


# PURPOSE

A boundary rule becomes easier to review when it has
one or more concrete example packs.

Example packs are not implementation fixtures.

They are explanatory design objects that show how
the rule behaves in realistic scenarios.


# REQUIRED EXAMPLE PACK COMPONENTS

Each linked example pack should contain:

- example_pack_id
- related_boundary_id
- scenario_name
- source_object_story
- linked_object_story
- expected_context_set
- mismatch_variant_set
- reconciliation_variant_set
- interpretation_note
- anti-misreading_note


# MINIMUM FIRST EXAMPLE TARGETS

Recommended first example packs:

- invoice issuance explainability for ERP-BR-B2A-001
- inventory adjustment escalation for ERP-BR-B2A-002
- approval authority chain for ERP-BR-M2A-001
- permission timing mismatch for ERP-BR-M2A-002
- retroactive override case for ERP-BR-CTA-001
- incomplete handoff / delayed evidence case for ERP-BR-HRC-001


# INTERPRETATION RULE

An example pack clarifies a rule.

It does not replace the rule.

If an example conflicts with the rule,
the rule remains primary and the example must be revised.


# CONSTRAINTS

Do not let examples silently narrow a general rule
without explicit design decision.

Do not let examples become hidden truth ownership transfers.

