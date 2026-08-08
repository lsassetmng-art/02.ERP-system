# ============================================================
# ERP PLANNING TO EXECUTION PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2827
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.planning_to_execution_progression.rule
component: planning-to-execution-progression-rule


# RULE

Planning-side handoff may justify execution-side object creation,
but planning truth does not disappear.

Progression should preserve:
- linked planning reference
- item and quantity visibility
- timing visibility
- source and target family visibility
- reject and retry trace when applicable

