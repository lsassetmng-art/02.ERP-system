# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 ACTUAL RUNTIME
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual newly frozen runtime entries in v2.

actual_frozen_entries:

  system.exec_run_request:
    semantic_owner:
    - 000.platform runtime execution request truth
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    freeze_cycle:
    - v2
    rationale:
    - strongest current runtime active-request truth
    - direct insert/update evidence is strong
    - trigger/policy evidence is strong
    - stronger than integration.integration_job

kept_outside_main_freeze:
- integration.integration_job

conclusion:
Runtime v2 adds system.exec_run_request
as an actual newly frozen truth entry.
