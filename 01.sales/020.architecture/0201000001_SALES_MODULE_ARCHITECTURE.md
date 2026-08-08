# ============================================================
# SALES MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Logical components
1. Quote Aggregate Service
2. Commercial Snapshot Service
3. Quote Review / Issue Service
4. Quote Acceptance Service
5. Quote Handoff Service
6. Quote Document Projection Service
7. Search / Filter Projection Service

## 2. Main aggregates
- sales_quote
- sales_quote_revision
- sales_quote_line
- sales_quote_attachment
- sales_quote_acceptance
- sales_quote_handoff_request

## 3. Inbound dependencies
From 52.master-data:
- customer reference
- item reference
- unit of measure reference
- price list reference
- tax category reference
- salesperson reference

From 50.approval:
- approval request result
- approval status projection

From 00.foundation / CommonOS:
- list/detail/form/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 04.order-management:
- accepted quote handoff payload
- commercial condition snapshot
- requested order creation surface

To 05.billing:
- optional billing-ready commercial reference only after order stage
Sales does not create invoice canon.

To 30.accounting:
- reference-only reporting or analysis surfaces
Sales does not create accounting canon.

## 5. User surfaces
- Quote List
- Quote Detail
- Quote Draft Form
- Quote Revision Compare
- Quote Review Panel
- Quote Issue Preview
- Quote Acceptance Registration
- Quote Handoff Monitor

## 6. Architecture rule
- command side updates quote canon
- query side serves search / detail / compare / dashboard projections
- every issued quote references a frozen commercial snapshot
- downstream handoff is event/payload based, not shared mutable canon

## 7. CommonOS boundary
UI shell, table, form, drawer, dialog, attachment UI, queue UI use Foundation.
Quote state machine, pricing snapshot rule binding, issue gating, and handoff canon remain inside 01.sales.
