# ============================================================
# CRM OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Daily operations
- monitor overdue follow-ups
- monitor dormant customers
- monitor customers with risk health
- reconcile interaction capture quality

## 2. Scheduled jobs
- overdue follow-up escalation job
- dormancy detection job
- engagement snapshot generation job
- stale relationship review job

## 3. Operational dashboards
- relationship health distribution
- overdue follow-up queue
- dormant customer queue
- interaction volume trend
- customer engagement trend

## 4. Manual procedures
- interaction correction with audit note
- follow-up reassignment
- customer relationship closure
- risk flag review and release

## 5. Evidence
- interaction append log
- follow-up reassignment log
- health status adjustment log
- dormancy detection run log
