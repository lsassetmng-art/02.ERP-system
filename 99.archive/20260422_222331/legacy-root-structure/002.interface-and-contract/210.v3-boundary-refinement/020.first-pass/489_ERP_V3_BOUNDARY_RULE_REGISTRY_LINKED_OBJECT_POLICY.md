# ============================================================
# ERP V3 BOUNDARY RULE REGISTRY LINKED OBJECT POLICY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how linked objects should be recorded
inside the boundary rule registry.

main_policy:
Linked objects should identify the minimum anchor set
needed to understand the boundary,
not an exhaustive dump of every related object.

selection_rule:
Prefer:
- canonical source anchors
- native-core anchors
- main boundary surfaces
- representative edge views
- main control or audit anchors when relevant

avoid:
- excessively long object lists
- trivial duplicates
- downstream convenience objects without boundary value

conclusion:
Linked objects should explain the boundary,
not bury it under volume.
