# ============================================================
# DEMAND FORECASTING OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Daily operations
- monitor draft/review forecast versions
- monitor unreviewed high-variance lines
- monitor failed S&OP handoff queue
- monitor stale frozen candidates

## 2. Scheduled jobs
- baseline generation refresh job
- forecast anomaly detection job
- failed handoff retry job
- superseded version archive candidate job

## 3. Operational dashboards
- forecast versions by status
- forecast variance candidates
- promotion impact review queue
- new product forecast queue
- handoff failure queue

## 4. Manual procedures
- override correction with audit note
- freeze cancellation before send
- supersession by new version
- S&OP handoff resubmission

## 5. Evidence
- baseline generation log
- adjustment audit log
- freeze action log
- handoff retry log
