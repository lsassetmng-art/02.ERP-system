# ============================================================
# BILLING POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Boundary policy
- Order Management owns billable source reference
- Billing owns invoice canon
- Accounting owns journal and receivable ledger canon

## 2. Billing policy
- every invoice must link to billable references or approved manual billing basis
- issued invoice snapshot is immutable
- duplicate billable consumption must be prevented

## 3. Correction policy
- direct overwrite of issued invoice is forbidden
- correction uses cancellation / credit / debit memo request flows
- correction remains historically visible

## 4. Accounting handoff policy
- Billing sends accounting reference payload
- Billing tracks send/ack/fail only
- Accounting decides booking and settlement truth

## 5. Payment / settlement policy
- Billing may display settlement-reference status
- Billing does not become settlement canon
