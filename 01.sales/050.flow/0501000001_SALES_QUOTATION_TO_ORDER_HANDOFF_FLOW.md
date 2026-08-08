# ============================================================
# SALES QUOTATION TO ORDER HANDOFF FLOW
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Quote creation flow
1. user creates draft quote
2. customer and base conditions are selected
3. line items are entered
4. commercial snapshot is generated for revision
5. draft is saved

## 2. Review flow
1. user submits revision for review
2. module validates mandatory fields
3. if approval required, request goes to 50.approval
4. approval result returns as projection/input
5. revision becomes issue_ready when all gates pass

## 3. Issue flow
1. user issues quote
2. module freezes issued revision snapshot
3. issue timestamp is recorded
4. customer-facing document projection is generated
5. quote status becomes issued

## 4. Acceptance flow
1. customer response is recorded
2. result = accepted / rejected / expired
3. accepted revision is fixed
4. quote status is updated accordingly

## 5. Order handoff flow
1. accepted quote triggers handoff preparation
2. handoff payload is built from accepted revision
3. payload is sent to 04.order-management request surface
4. downstream reference is stored
5. handoff status becomes sent or failed

## 6. Exception flow
- approval rejected -> back to draft or review correction
- quote expired before response -> expired
- downstream handoff failed -> retryable failed state
- accepted revision cannot be overwritten
