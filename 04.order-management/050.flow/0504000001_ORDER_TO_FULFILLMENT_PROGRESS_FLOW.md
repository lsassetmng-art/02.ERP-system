# ============================================================
# ORDER TO FULFILLMENT PROGRESS FLOW
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Order creation flow
1. accepted quote handoff or direct order entry arrives
2. order draft is created
3. customer, ship-to, dates, and line data are validated
4. confirmed revision snapshot is recorded
5. order status becomes confirmed

## 2. Release flow
1. release gate checks holds and approval conditions
2. order is released
3. allocation request is created
4. downstream warehouse/logistics preparation begins

## 3. Fulfillment progression flow
1. allocation responses update integrated progress
2. shipment execution signals arrive from warehouse/logistics
3. delivered state may be updated by downstream confirmation
4. fulfillment progress summary is recalculated

## 4. Hold flow
1. hold may be placed for credit, compliance, stock, or manual review reason
2. active hold changes order status to on_hold when blocking
3. release action removes or resolves hold
4. order may return to confirmed or released path

## 5. Revision / change flow
1. order revision is initiated for allowed open quantities
2. revision captures change reason
3. approval may be required
4. superseded revision remains historically visible

## 6. Cancellation flow
1. open quantity cancellation request is recorded
2. downstream cancellation/refusal signals are coordinated
3. cancelled quantity is fixed
4. order may move to cancelled or closed depending on remaining open/fulfilled quantities

## 7. Billing handoff flow
1. billable milestone condition is met
2. billable reference surface is exposed to 05.billing
3. Billing creates invoice canon separately

## 8. Exception flow
- downstream request failed -> retryable failed state
- partial fulfillment -> partially_fulfilled
- release blocked by active hold -> on_hold
