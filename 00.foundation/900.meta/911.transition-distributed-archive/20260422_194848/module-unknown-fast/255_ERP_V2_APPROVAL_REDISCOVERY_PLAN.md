# ============================================================
# ERP V2 APPROVAL REDISCOVERY PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rediscovery plan
if approval truth candidate names are not found directly.

current_assumed_targets:
- workflow.approval_request
- system.approval_request

rediscovery_rule:
If these names are absent,
search should shift from exact names to:
- approval submission families
- decision / status transition semantics
- workflow transition semantics
- governance / notify / audit separation semantics
- approval URL / rendering projection semantics

possible outcomes:
- original names confirmed
- renamed or aliased approval families found
- truth competition re-framed under different object names
- approval truth remains deferred with better naming confidence

conclusion:
Approval v2 should prefer semantic rediscovery
over forcing exact-name assumptions.
