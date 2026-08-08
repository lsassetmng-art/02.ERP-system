# ============================================================
# BILLING SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Screens
- BillingInvoiceListScreen
- BillingInvoiceDetailScreen
- BillingInvoiceDraftScreen
- BillingScheduleMonitorScreen
- BillableEventConsumptionScreen
- BillingCreditMemoRequestScreen
- BillingAccountingReferenceMonitorScreen
- BillingExportDeliveryScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- issue_failed
- accounting_reference_failed
- issued
- cancelled
- credited
- closed

## 3. CommonOS use
- list / table / form / dialog / export / queue status / conflict presentation
- dense ERP input variant may be used where needed

## 4. API integration points
- consume billable event
- create invoice draft
- issue invoice
- request credit memo
- send accounting reference
- list / detail / search / monitor

## 5. Exact frontend modules
- presenter/invoice-list
- presenter/invoice-detail
- presenter/invoice-form
- presenter/billable-event-monitor
- presenter/accounting-reference-monitor
- mapper/invoice-summary
- bridge/billing-api
- sync/billing-command-queue
