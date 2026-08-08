# ============================================================
# ERP V3 RECONCILIATION FACING BOUNDARY REGISTRY EXTENSION NOTE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-519
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.v3.boundary_refinement.reconciliation_facing_registry_extension
component: reconciliation-facing-boundary-registry-extension-note


# ABSTRACT

Defines how explicit boundary registry entries should
later expand toward reconciliation-aware registry structure.


# WHY THIS NOTE EXISTS

The explicit entries created in this pass are enough
for rule identity and interpretation.

They are not yet the full reconciliation registry.

A later pass should extend them with case-oriented
classification and lifecycle detail.


# RECOMMENDED FUTURE EXTENSION FIELDS

Recommended reconciliation-facing extension fields:

- reconciliation_case_type
- reconciliation_trigger_condition
- reconciliation_required_inputs
- provisional_classification
- final_classification
- compensating_action_type
- carry_forward_rule
- unresolved_visibility_rule
- closure_approval_role
- closure_evidence_requirement


# EXTENSION PRINCIPLE

A boundary entry defines what kinds of gaps matter.

A reconciliation extension defines how those gaps
move through their lifecycle.


# HIGH-PRIORITY EXTENSION TARGETS

The first candidates for registry extension are:

- ERP-BR-B2A-001
- ERP-BR-B2A-002
- ERP-BR-M2A-002
- ERP-BR-CTA-001
- ERP-BR-HRC-001

These are the rules most likely to produce
timing gaps, evidence delays, retroactive basis,
and unresolved classification cases.


# CONSTRAINTS

Do not force reconciliation lifecycle detail into
the base entry if it harms readability.

Keep the base entry stable.
Layer lifecycle complexity on top later.

