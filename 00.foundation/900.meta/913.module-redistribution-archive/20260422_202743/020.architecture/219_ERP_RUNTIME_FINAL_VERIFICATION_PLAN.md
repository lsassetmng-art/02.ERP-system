# ============================================================
# ERP RUNTIME FINAL VERIFICATION PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the final verification plan
for unresolved runtime authority competition.

verification_target:
- system.exec_run_request
- integration.integration_job

main_question:
Which entry is the stronger final active runtime truth carrier?

verification_points:
- first authoritative insert path
- current status update path
- retry mutation path
- relation to queue/outbox family
- whether one is orchestration support while the other is active truth

possible_outcomes:
- exec_run_request frozen, integration_job support-side
- integration_job frozen, exec_run_request request-side only
- both remain non-frozen pending deeper operational proof

conclusion:
Runtime freeze promotion depends mainly on narrowing
this final active-truth competition.
