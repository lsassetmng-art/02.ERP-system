# ============================================================
# BUSINESS INTELLIGENCE OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Daily operations
- monitor failed refresh runs
- monitor stale dashboards
- monitor broken drill-down links
- monitor KPI definition change queue

## 2. Scheduled jobs
- daily executive KPI refresh job
- hourly operational dashboard refresh job
- drill-down link validation job
- stale snapshot archive candidate job

## 3. Operational dashboards
- refresh status dashboard
- broken-link queue
- stale snapshot queue
- KPI coverage dashboard

## 4. Manual procedures
- rerun failed refresh
- retire outdated dashboard
- repair broken drill-down link
- supersede KPI definition with new version

## 5. Evidence
- refresh execution log
- dashboard publish log
- broken-link remediation log
