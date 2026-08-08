# ============================================================
# BILLING INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. API surfaces

### 1.1 Consume billable reference
POST /billing/billable-events/consume

request example:
{
  "source_module": "04.order-management",
  "source_reference_id": "uuid",
  "billable_event_type": "shipment_confirmed",
  "customer_id": "uuid",
  "bill_to_id": "uuid",
  "currency_code": "JPY",
  "payload_hash": "sha256-xxxxx"
}

response example:
{
  "billing_billable_event_consumption_id": "uuid",
  "consumption_status": "pending"
}

### 1.2 Create invoice draft
POST /billing/invoices

request example:
{
  "customer_id": "uuid",
  "bill_to_id": "uuid",
  "currency_code": "JPY",
  "payment_term_id": "uuid",
  "billable_event_consumption_ids": ["uuid", "uuid"]
}

response example:
{
  "billing_invoice_id": "uuid",
  "invoice_number": "INV-2026-000001",
  "invoice_status": "draft",
  "latest_revision_no": 1
}

### 1.3 Issue invoice
POST /billing/invoices/{billing_invoice_id}/issue

response example:
{
  "billing_invoice_id": "uuid",
  "invoice_status": "issued",
  "issued_at": "2026-04-22T17:00:00+09:00"
}

### 1.4 Request credit memo
POST /billing/invoices/{billing_invoice_id}/credit-memo-request

request example:
{
  "request_reason_code": "price_adjustment",
  "requested_amount": 5000
}

### 1.5 Accounting handoff reference
POST /billing/invoices/{billing_invoice_id}/accounting-reference/send

response example:
{
  "billing_accounting_reference_id": "uuid",
  "accounting_reference_status": "sent"
}

## 2. Accounting reference payload
{
  "source_module": "05.billing",
  "billing_invoice_id": "uuid",
  "invoice_number": "INV-2026-000001",
  "customer_id": "uuid",
  "bill_to_id": "uuid",
  "invoice_date": "2026-04-22",
  "due_date": "2026-05-31",
  "currency_code": "JPY",
  "total_amount": 132000,
  "tax_amount": 12000,
  "reference_type": "invoice_issue"
}

## 3. Integration rule
- Billing consumes billable references and creates invoice canon
- Billing emits accounting reference payloads
- Accounting owns financial truth after receipt
- no shared mutable receivable/journal object between modules
