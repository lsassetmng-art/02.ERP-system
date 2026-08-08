# ============================================================
# SALES MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 01.sales
owner: Boss
prepared_by: Zero

## 1. Purpose
The Sales module governs commercial offer formation before operational order lifecycle execution.
It is the canonical module for quote construction, quote revision history, commercial condition snapshot,
quote issuance, quote acceptance capture, and handoff preparation to Order Management.

## 2. Canonical scope
The Sales module owns:
- sales quote header
- sales quote line
- quote revision history
- commercial condition snapshot used for the quote
- quote issue event
- quote acceptance event
- quote-to-order handoff request payload
- quote document rendering metadata
- quote status transition canon

## 3. Non-scope
The Sales module does not own:
- opportunity / pipeline / field sales activity canon -> 02.sfa
- customer relationship activity canon -> 03.crm
- sales order lifecycle canon -> 04.order-management
- invoice / billing canon -> 05.billing
- approval decision core -> 50.approval
- accounting booking canon -> 30.accounting
- customer master canon -> 52.master-data
- shared UI canon -> 00.foundation / CommonOS

## 4. Core business intent
The module must allow a commercial team to:
- create a quote
- revise a quote
- freeze a commercial snapshot per revision
- issue a quote to customer-facing output
- record acceptance / rejection / expiration
- request downstream order creation from an accepted quote

## 5. Canonical lifecycle
Draft
-> Internal Review
-> Approved For Issue
-> Issued
-> Accepted / Rejected / Expired / Cancelled
-> Accepted quote may generate handoff request to Order Management

## 6. Boundary rule
Sales owns the commercial promise before order execution.
Order Management owns execution after accepted quote is converted into order lifecycle intent.

## 7. CommonOS usage
Sales uses shared UI for:
- quote list
- quote detail
- quote form
- search / filter
- attachment presentation
- offline queue status presentation
The business canon remains inside 01.sales.
