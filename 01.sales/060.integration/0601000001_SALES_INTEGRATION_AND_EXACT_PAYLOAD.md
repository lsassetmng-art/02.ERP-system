# ============================================================
# SALES INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. API surfaces

### 1.1 Create quote draft
POST /sales/quotes

request example:
{
  "customer_id": "uuid",
  "currency_code": "JPY",
  "validity_end_date": "2026-05-31",
  "lines": [
    {
      "item_id": "uuid",
      "quantity": 10,
      "uom_code": "EA",
      "unit_price": 1200,
      "discount_amount": 0,
      "requested_delivery_date": "2026-06-10",
      "note": "initial offer"
    }
  ]
}

response example:
{
  "sales_quote_id": "uuid",
  "quote_number": "SQ-2026-000001",
  "quote_status": "draft",
  "latest_revision_no": 1
}

### 1.2 Submit revision for review
POST /sales/quotes/{sales_quote_id}/revisions/{revision_no}/submit-review

response example:
{
  "sales_quote_id": "uuid",
  "revision_no": 2,
  "revision_status": "review_pending",
  "approval_request_id": "uuid"
}

### 1.3 Issue quote
POST /sales/quotes/{sales_quote_id}/revisions/{revision_no}/issue

response example:
{
  "sales_quote_id": "uuid",
  "revision_no": 2,
  "quote_status": "issued",
  "issued_at": "2026-04-22T10:00:00+09:00"
}

### 1.4 Record acceptance
POST /sales/quotes/{sales_quote_id}/acceptance

request example:
{
  "revision_no": 2,
  "acceptance_result": "accepted",
  "acceptance_channel": "email",
  "acceptance_reference_no": "MAIL-12345",
  "acceptance_note": "customer approved"
}

### 1.5 Request order handoff
POST /sales/quotes/{sales_quote_id}/handoff

response example:
{
  "sales_quote_handoff_request_id": "uuid",
  "handoff_status": "sent",
  "downstream_reference_no": "SO-REQ-2026-000034"
}

## 2. Downstream handoff payload to Order Management
{
  "source_module": "01.sales",
  "sales_quote_id": "uuid",
  "revision_no": 2,
  "customer_id": "uuid",
  "currency_code": "JPY",
  "commercial_snapshot_id": "uuid",
  "lines": [
    {
      "line_no": 1,
      "item_id": "uuid",
      "quantity": 10,
      "uom_code_snapshot": "EA",
      "unit_price": 1200,
      "discount_amount": 0,
      "requested_delivery_date": "2026-06-10"
    }
  ]
}

## 3. Integration rule
- Sales emits request payload
- Order Management owns order canon after acceptance of the request
- no shared mutable object between modules
