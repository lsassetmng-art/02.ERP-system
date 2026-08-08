# ============================================================
# APPROVAL MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 50.approval
owner: Boss
prepared_by: Zero

## 1. Purpose
The Approval module governs approval decision canon across ERP modules.
It is the canonical module for approval request, approval route, approver action,
approval decision result, escalation, delegation, and approval audit trace.

## 2. Canonical scope
The module owns:
- approval request canon
- approval route canon
- approval step canon
- approver decision canon
- delegation / escalation canon
- approval result canon

## 3. Non-scope
It does not own:
- source business document canon
- source accounting/order/invoice/stock/production/HR truth
- audit finding canon -> 51.audit
- shared identity reference truth -> 52.master-data

## 4. Lifecycle
Requested
-> In Review
-> Approved
or
-> Rejected
or
-> Cancelled
or
-> Expired

## 5. Boundary rule
Approval owns only gating/control decision truth.
The source module owns the business effect after consuming the decision.
