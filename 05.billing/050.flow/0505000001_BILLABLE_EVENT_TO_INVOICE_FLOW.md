# ============================================================
# BILLABLE EVENT TO INVOICE FLOW
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Billable event intake flow
1. billable reference arrives from Order Management
2. Billing validates idempotency and customer context
3. billable event consumption record is created
4. event becomes available for invoice draft generation

## 2. Invoice draft flow
1. one or more billable events are selected or grouped
2. invoice draft is generated
3. invoice lines are created from consumed events
4. invoice totals and tax are calculated
5. draft is saved

## 3. Review and issue flow
1. invoice draft is reviewed
2. optional approval route runs for exceptional cases
3. invoice is issued
4. invoice snapshot is frozen
5. customer-facing rendering/export becomes available

## 4. Accounting reference flow
1. issued invoice produces accounting reference payload
2. payload is sent to Accounting
3. Billing tracks send/ack/fail status only
4. Accounting owns journal and receivable truth

## 5. Correction flow
1. cancellation or memo request is raised
2. approval may be required
3. credit/debit/cancel reference is produced
4. Accounting receives reversal/correction reference separately

## 6. Closure flow
- invoice may be closed from Billing perspective after settlement reference acknowledgement
- settlement truth remains outside Billing

## 7. Exception flow
- duplicate billable event -> skipped or rejected
- failed accounting handoff -> retryable failed state
- issue blocked by approval or data validation -> remains unissued
