# ============================================================
# SALES POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Boundary policy
- SFA owns pre-quote opportunity activity
- CRM owns customer relationship activity
- Sales owns quote canon
- Order Management owns operational order execution
- Billing owns invoice canon

## 2. Quote validity policy
- every quote must have validity_end_date
- expired quote cannot be accepted
- re-issue requires new revision

## 3. Revision policy
- issued revision becomes immutable snapshot
- any commercial change after issue requires new revision
- accepted revision is final commercial source for handoff

## 4. Approval policy
- approval logic itself is externalized to 50.approval
- Sales stores approval snapshot and gating result only

## 5. Pricing / tax policy
- quote stores snapshot, not live mutable dependency
- issued quote must preserve price and tax snapshots used at issue time

## 6. Attachment policy
- attachments may exist at quote or revision scope
- attachments used in issued quote must remain historically referencable
