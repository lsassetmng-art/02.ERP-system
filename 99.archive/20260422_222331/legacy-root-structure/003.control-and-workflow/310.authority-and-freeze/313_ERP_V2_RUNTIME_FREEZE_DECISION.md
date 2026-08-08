# ============================================================
# ERP V2 RUNTIME FREEZE DECISION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current freeze decision
for the runtime-side v2 candidate.

target:
- system.exec_run_request

current_reading:
- strongest current runtime active-request truth candidate
- stronger than integration.integration_job
- direct insert/update evidence is strong
- trigger/policy evidence is strong

decision:
- freeze_now

deferred_companion:
- integration.integration_job

reason_for_deferred_companion:
- real object exists
- still operationally relevant
- weaker than exec_run_request for main truth

conclusion:
Runtime v2 is strong enough
to freeze system.exec_run_request as the next runtime truth layer.
