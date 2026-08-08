# ============================================================
# ERP AUDIT FIRST PASS SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the first-pass audit architecture reading.

main_result:
Audit has at least six distinguishable layers:
- approval audit truth
- generic audit event truth
- execution-linked audit
- status/anomaly audit
- export/delivery boundary
- cross-cutting audit infrastructure

strongest current anchor:
- audit.approval_request

important design consequence:
Audit architecture should be expanded as a layered domain,
not as a single log bucket.

conclusion:
The audit inventory pass is strong enough
to support a first architecture-layer design step.
