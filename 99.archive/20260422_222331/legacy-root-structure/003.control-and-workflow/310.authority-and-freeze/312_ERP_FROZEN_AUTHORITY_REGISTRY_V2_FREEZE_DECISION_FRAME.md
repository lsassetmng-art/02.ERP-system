# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 FREEZE DECISION FRAME
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the decision frame
for moving from frozen authority registry v2 draft
to actual v2 freeze decisions.

decision_classes:
- freeze_now
- freeze_in_layered_form
- keep_as_working_draft
- keep_deferred

decision_rule:
- freeze_now:
  use when truth role is strong and scope ambiguity is low

- freeze_in_layered_form:
  use when base truth and surface/projection split are both stable

- keep_as_working_draft:
  use when hierarchy is visible but scope split is not fully closed

- keep_deferred:
  use when competition or ambiguity remains too central

current_target_families:
- runtime
- approval
- settlement
- AR/AP

conclusion:
V2 now needs explicit freeze decisions,
not only draft placement.
