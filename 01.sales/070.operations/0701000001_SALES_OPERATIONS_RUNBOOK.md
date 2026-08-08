# ============================================================
# SALES OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Daily operations
- monitor quotes pending review
- monitor quotes near validity expiration
- monitor handoff failures to Order Management
- reconcile issued vs accepted counts

## 2. Scheduled jobs
- quote expiration check job
- issue reminder job
- handoff retry job
- stale draft cleanup candidate report

## 3. Operational dashboards
- quotes by status
- quotes nearing expiration
- revision aging
- issue success/failure trend
- handoff retry queue

## 4. Manual procedures
- quote cancellation correction
- acceptance registration correction
- downstream handoff resubmission
- attachment replacement with audit trace

## 5. Evidence
- issue action log
- acceptance log
- handoff retry log
- user audit trail
