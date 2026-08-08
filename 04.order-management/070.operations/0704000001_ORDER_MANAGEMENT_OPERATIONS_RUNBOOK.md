# ============================================================
# ORDER MANAGEMENT OPERATIONS RUNBOOK
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Daily operations
- monitor unreleased confirmed orders
- monitor orders on hold
- monitor downstream allocation/shipment failures
- monitor partially fulfilled orders

## 2. Scheduled jobs
- stale hold review job
- downstream retry job
- unfulfilled order aging job
- closed-order candidate job

## 3. Operational dashboards
- orders by status
- hold queue
- release backlog
- fulfillment aging
- downstream failure queue

## 4. Manual procedures
- hold release correction
- downstream request resubmission
- revision correction with audit note
- cancellation correction for open quantities

## 5. Evidence
- release action log
- hold / release log
- downstream retry log
- cancellation audit trail
