# ============================================================
# SFA OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Daily operations
- monitor new leads without first contact
- monitor overdue next actions
- monitor stagnant opportunities by stage aging
- monitor failed quote requests to Sales

## 2. Scheduled jobs
- overdue action escalation job
- stale opportunity review job
- pipeline forecast snapshot job
- inactive lead archive candidate job

## 3. Operational dashboards
- pipeline by stage
- forecast by month
- salesperson work queue
- lead conversion rate
- win/loss trend

## 4. Manual procedures
- reassignment of lead/opportunity owner
- stage correction with audit note
- lost reason correction
- quote request retry

## 5. Evidence
- stage change log
- activity registration log
- quote request retry log
- owner reassignment log
