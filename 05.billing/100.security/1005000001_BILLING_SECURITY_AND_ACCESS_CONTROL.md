# ============================================================
# BILLING SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Access scopes
- billing.invoice.read
- billing.invoice.write
- billing.invoice.issue
- billing.memo.request
- billing.accounting_reference.send
- billing.admin.correct

## 2. Segregation of duties
- preparer may draft
- issuer may be narrower than drafter
- memo/cancel approval path may require elevated authority
- accounting handoff control may be restricted

## 3. Sensitive surfaces
- invoice amounts
- tax information
- bill-to information
- correction request reasons
- accounting reference payload metadata

## 4. Audit requirements
- invoice issue logged
- billable consumption logged
- memo request logged
- accounting handoff hash/reference logged
