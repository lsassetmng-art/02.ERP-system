# ============================================================
# ERP FROZEN V2 ENTRY CONDITIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the conditions for admitting deferred entries
into frozen authority registry v2.

entry_conditions:
- competing authority candidates are narrowed or resolved
- base-truth ambiguity is materially reduced
- write path or feeder path is evidenced
- registry classification is stable across related documents
- remaining risk is low enough for frozen promotion

likely_v2_candidate_directions:
- one of exec_run_request / integration_job may enter v2 as runtime truth
- one of workflow.approval_request / system.approval_request may enter v2 as approval truth
- AR/AP preview entries may enter v2 as frozen projection-only even if base truth remains separately deferred
- payment_allocation may enter v2 as line/application truth if settlement ambiguity narrows enough

conclusion:
Frozen v2 should admit only entries whose remaining ambiguity
is no longer central to operational interpretation.
