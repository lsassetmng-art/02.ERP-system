# ============================================================
# ERP V3 BOUNDARY AMBIGUITY PRIORITY SHORTLIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first ambiguity-priority shortlist
for v3 boundary refinement.

priority_shortlist:

  tier_1:
  - source_truth_vs_derived_surface
  - native_core_vs_boundary_surface
  - analytics_to_business
  - analytics_to_management

  tier_2:
  - business_to_audit
  - management_to_audit
  - control_truth_vs_audit_truth

  tier_3:
  - handoff_boundary
  - reconciliation_boundary
  - decision_to_action_boundary

reasoning:
Tier 1 targets the ambiguity that most directly affects
later design quality across multiple domains.

conclusion:
The first refinement pass should begin from tier_1,
not from the full boundary field at once.
