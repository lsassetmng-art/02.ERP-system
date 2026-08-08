# ============================================================
# BILLING OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Daily operations
- monitor pending billable events
- monitor draft invoices awaiting issue
- monitor failed accounting reference handoff
- monitor cancellation / memo requests

## 2. Scheduled jobs
- billing schedule execution job
- stale draft invoice review job
- failed accounting handoff retry job
- duplicate billable event detection job

## 3. Operational dashboards
- invoices by status
- pending billable event queue
- accounting handoff failure queue
- memo / cancellation request queue
- invoice aging by due date reference

## 4. Manual procedures
- invoice draft correction
- issue retry
- memo request review
- accounting handoff resubmission

## 5. Evidence
- issue action log
- billable event consumption log
- accounting handoff retry log
- cancellation / credit memo audit trail
