# ============================================================
# CONTROL DOMAIN BOUNDARY ALIGNMENT BUNDLE
# ============================================================

status: generated
scope:
- 50.approval
- 51.audit
- 52.master-data

owner: Boss
prepared_by: Zero

## 1. Canonical ownership summary
- 50.approval owns approval request / approval route / approval decision canon
- 51.audit owns audit trail interpretation, audit finding, control review result, and audit package canon
- 52.master-data owns shared reference identity and shared reference truth for ERP-wide master domains

## 2. Explicit non-ownership
- Approval does not own business document canon
- Audit does not own business transaction canon
- Master Data does not own operational execution canon
- Approval does not own final journal/order/invoice/stock/production truth
- Audit does not overwrite source truth; it records audit interpretation and findings

## 3. Handoff chain
Operational / accounting / HR / supply / manufacturing modules
-> Approval request / decision reference when gated
-> Audit trail / evidence capture / control review
-> Master Data shared reference support across all modules

## 4. ERP-wide role
- 50.approval provides gating decision truth
- 51.audit provides independent review/control truth
- 52.master-data provides shared identity/reference truth

## 5. Design rule
Every handoff is payload/event based.
No control module directly mutates another module's business canon.
