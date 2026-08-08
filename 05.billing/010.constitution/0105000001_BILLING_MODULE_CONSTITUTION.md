# ============================================================
# BILLING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 05.billing
owner: Boss
prepared_by: Zero

## 1. Purpose
The Billing module governs invoice canon after billable business events are established.
It is the canonical module for invoice creation, invoice line canon, billing schedule,
invoice issue, invoice cancellation, credit memo request surfaces, and receivable reference handoff to Accounting.

## 2. Canonical scope
The Billing module owns:
- invoice header canon
- invoice line canon
- billing schedule canon
- billable event consumption canon
- invoice issue canon
- invoice cancellation canon
- credit memo / debit memo request canon
- billing document rendering metadata
- invoice status transition canon

## 3. Non-scope
The Billing module does not own:
- opportunity / pursuit canon -> 02.sfa
- quote canon -> 01.sales
- order execution canon -> 04.order-management
- stock / warehouse / logistics execution canon -> 12/13/14
- accounting journal canon -> 30.accounting
- customer master identity canon -> 52.master-data
- shared UI canon -> 00.foundation / CommonOS

## 4. Core business intent
The module must allow finance/operations to:
- register billable references
- generate invoice drafts from billable references
- review and issue invoices
- manage invoice corrections through controlled memo/cancel flows
- expose accounting handoff references
- track invoice lifecycle until closed from billing perspective

## 5. Canonical lifecycle
Draft
-> Reviewed
-> Issued
-> Partially Settled Reference
-> Settled Reference
or
-> Cancelled
or
-> Credited / Closed

## 6. Boundary rule
Billing owns the commercial billing document canon.
Accounting owns journal entries, settlement truth, and receivable ledger truth.

## 7. CommonOS usage
Billing uses shared UI for:
- invoice list
- invoice detail
- invoice form
- billing schedule list
- search / filter
- attachment / export presentation
- offline queue status presentation
The business canon remains inside 05.billing.
