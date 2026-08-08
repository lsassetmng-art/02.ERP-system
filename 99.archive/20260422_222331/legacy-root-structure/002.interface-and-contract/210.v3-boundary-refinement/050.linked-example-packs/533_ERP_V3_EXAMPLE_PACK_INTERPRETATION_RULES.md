# ============================================================
# ERP V3 EXAMPLE PACK INTERPRETATION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-533
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.example_pack.interpretation_rules
component: example-pack-interpretation-rules


# ABSTRACT

Defines how linked example packs must be interpreted
inside the ERP v3 boundary refinement corpus.


# PRIMARY RULE

A linked example pack explains a rule.

It does not replace the rule.

If tension appears between a rule and an example,
the rule remains primary until the corpus explicitly
revises the rule.


# RULE OF GENERALITY

Examples are narrower than rules.

A single example must not silently redefine the
general scope of a boundary entry.


# RULE OF OWNERSHIP

Examples must preserve the primary truth owner and
secondary explainer model defined by the related rule.

Example convenience must not transfer truth ownership.


# RULE OF MISMATCH VISIBILITY

Example packs must keep mismatch states visible.

They must not be written as if all scenarios end
in perfect closure.


# RULE OF RECONCILIATION REALISM

Reconciliation variants in an example pack are
classification aids, not proofs that reconciliation
is trivial or always available.


# RULE OF TIME ORDER

If a scenario involves late evidence, retroactive basis,
or after-the-fact justification, the example must
preserve time order explicitly.

History must not be flattened.


# CONSTRAINTS

Do not let example packs become pseudo-DDL,
pseudo-test fixtures, or hidden implementation specs.

