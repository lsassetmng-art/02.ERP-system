# ============================================================
# ERP V2 RESET AND REDISCOVERY SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the reset logic for v2 preparation
after zero-hit verification results.

main_meaning:
Zero-hit results do not invalidate v1.
They indicate that current v2 unresolved-object naming
must be re-confirmed before further freezing work.

next_possible_paths:
- continue with same names if existence is confirmed
- move to rediscovery if names are unstable
- narrow unresolved families semantically if exact object names are missing

relationship_to_v1:
Frozen authority registry v1 remains valid,
because the zero-hit problem affects deferred next-cycle work,
not the already frozen stable core.

conclusion:
The v2 reset is a naming and evidence-input correction step,
not a rollback of frozen v1.
