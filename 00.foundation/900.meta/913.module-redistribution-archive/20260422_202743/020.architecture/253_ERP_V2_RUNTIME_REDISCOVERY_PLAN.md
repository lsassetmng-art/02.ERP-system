# ============================================================
# ERP V2 RUNTIME REDISCOVERY PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rediscovery plan
if runtime truth candidate names are not found directly.

current_assumed_targets:
- system.exec_run_request
- integration.integration_job

rediscovery_rule:
If these names are absent,
search should shift from exact names to:
- execution request families
- integration process families
- queue / retry / picked / requested semantics
- scheduler / runner / execution lifecycle semantics

possible outcomes:
- original names confirmed
- renamed or aliased objects found
- family-level truth narrowed without exact original names
- unresolved naming mismatch retained for later cycle

conclusion:
Runtime v2 should not force unstable object names.
Rediscovery is preferable to false certainty.
