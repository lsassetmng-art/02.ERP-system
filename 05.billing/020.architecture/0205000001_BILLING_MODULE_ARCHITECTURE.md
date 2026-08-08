# ============================================================
# BILLING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Logical components
1. Invoice Aggregate Service
2. Billable Event Consumption Service
3. Billing Schedule Service
4. Invoice Issue / Delivery Service
5. Credit Memo / Cancellation Service
6. Accounting Reference Bridge Service
7. Search / Filter Projection Service

## 2. Main aggregates
- billing_invoice
- billing_invoice_revision
- billing_invoice_line
- billing_billable_event_consumption
- billing_schedule
- billing_credit_memo_request
- billing_accounting_reference

## 3. Inbound dependencies
From 04.order-management:
- billable reference surface
- shipment / fulfillment milestone reference

From 52.master-data:
- customer reference
- bill-to reference
- payment term reference
- tax category reference
- item reference
- currency reference

From 50.approval:
- approval result for exceptional billing actions when required

From 00.foundation / CommonOS:
- list/detail/form/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 30.accounting:
- invoice accounting reference payload
- credit memo reference payload
- cancellation/accounting reversal reference payload

To customer-facing document delivery surfaces:
- issued invoice rendering payload
- statement/export payload

## 5. User surfaces
- Invoice List
- Invoice Detail
- Invoice Draft / Review Form
- Billing Schedule Monitor
- Billable Event Consumption Monitor
- Credit Memo Request Screen
- Invoice Export / Delivery Screen

## 6. Architecture rule
- command side updates invoice canon
- query side serves list/detail/monitor/search projections
- accounting handoff is payload/event based
- no accounting journal canon is stored in Billing
- billable event consumption must be idempotent

## 7. CommonOS boundary
UI shell, table, form, dialog, export/attachment, queue UI use Foundation.
Invoice lifecycle, billable event consumption, and accounting reference canon remain inside 05.billing.
