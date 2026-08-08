# ============================================================
# SOP CONSENSUS OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Daily operations
- monitor open consensus versions
- monitor unresolved issue queue
- monitor failed production-planning handoff queue
- monitor stale executive review candidates

## 2. Scheduled jobs
- scenario refresh job
- unresolved issue escalation job
- failed handoff retry job
- superseded version archive candidate job

## 3. Operational dashboards
- consensus versions by status
- unresolved issue aging
- capacity risk queue
- inventory policy exception queue
- handoff failure queue

## 4. Manual procedures
- agreed quantity correction before freeze
- freeze cancellation before send
- supersession by new version
- production-planning handoff resubmission

## 5. Evidence
- scenario comparison log
- agreement change audit log
- freeze action log
- handoff retry log
