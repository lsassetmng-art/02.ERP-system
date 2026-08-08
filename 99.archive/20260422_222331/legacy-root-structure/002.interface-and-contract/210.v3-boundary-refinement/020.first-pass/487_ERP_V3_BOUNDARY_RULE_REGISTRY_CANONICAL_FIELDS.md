# ============================================================
# ERP V3 BOUNDARY RULE REGISTRY CANONICAL FIELDS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the canonical fields
for the v3 boundary rule registry.

canonical_fields:
- boundary_id
- boundary_family
- domain_pair
- truth_type_pair
- surface_type_pair
- stable_rule_statement
- interpretation_note
- linked_objects
- example_surfaces
- authority_effect
- maturity
- review_status
- source_documents

field_rules:
- boundary_id must be stable and human-readable
- boundary_family must match the approved family set
- domain_pair may be explicit pair or "cross-pair" when needed
- linked_objects should list anchor objects, not every downstream object
- maturity should use a small stable set:
  - draft
  - first-pass
  - reviewed
  - stable-candidate
- review_status should remain separate from maturity

conclusion:
The registry must stay small, explicit, and reusable
for later boundary expansion.
