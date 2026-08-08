# ============================================================
# SFA LEAD TO QUOTE REQUEST FLOW
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Lead intake flow
1. user registers lead
2. lead source and basic contact information are captured
3. lead is assigned to salesperson or queue
4. first contact activity may be recorded

## 2. Lead qualification flow
1. user records contact and discovery activities
2. qualification score/result is updated
3. qualified lead may be converted into opportunity
4. disqualified lead is closed with reason

## 3. Opportunity pipeline flow
1. opportunity is opened
2. stage moves from discover -> qualify -> propose -> negotiate -> commit
3. amount, expected close date, and probability are updated
4. next actions are tracked until closed

## 4. Quote request flow
1. opportunity reaches quote-needed point
2. quote request is created from opportunity context
3. payload is sent to 01.sales
4. SFA keeps only request status and reference
5. Sales owns the quote canon after acceptance

## 5. Closure flow
- won when commercial pursuit succeeds
- lost when opportunity is closed unsuccessfully
- disqualified when pursuit is stopped before valid opportunity maturity

## 6. Exception flow
- failed quote request -> retryable failed state
- overdue next action -> escalated work queue
- stale opportunity -> review candidate
