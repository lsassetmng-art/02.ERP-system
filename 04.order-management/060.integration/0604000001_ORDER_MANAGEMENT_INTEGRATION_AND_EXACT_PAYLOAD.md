# ============================================================
# ORDER MANAGEMENT INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. API surfaces

### 1.1 Create order from accepted quote
POST /order-management/orders

request example:
{
  "order_source_type": "accepted_quote",
  "source_sales_quote_id": "uuid",
  "source_sales_quote_revision_no": 2,
  "customer_id": "uuid",
  "ship_to_id": "uuid",
  "currency_code": "JPY",
  "requested_ship_date": "2026-06-10",
  "lines": [
    {
      "item_id": "uuid",
      "ordered_quantity": 10,
      "uom_code": "EA",
      "unit_price": 1200,
      "discount_amount": 0
    }
  ]
}

response example:
{
  "om_sales_order_id": "uuid",
  "sales_order_number": "SO-2026-000001",
  "order_status": "confirmed",
  "latest_revision_no": 1
}

### 1.2 Release order
POST /order-management/orders/{om_sales_order_id}/release

response example:
{
  "om_sales_order_id": "uuid",
  "order_status": "released",
  "released_at": "2026-04-22T16:00:00+09:00",
  "allocation_request_status": "pending"
}

### 1.3 Place hold
POST /order-management/orders/{om_sales_order_id}/holds

request example:
{
  "hold_type": "credit",
  "hold_reason_code": "credit_check_pending"
}

### 1.4 Cancel open quantity
POST /order-management/orders/{om_sales_order_id}/cancel

request example:
{
  "cancellation_scope": "remaining_open_only",
  "cancellation_reason_code": "customer_request",
  "cancellation_note": "partial order no longer needed"
}

## 2. Downstream request payload to Warehouse
{
  "source_module": "04.order-management",
  "om_sales_order_id": "uuid",
  "sales_order_number": "SO-2026-000001",
  "customer_id": "uuid",
  "ship_to_id": "uuid",
  "requested_ship_date": "2026-06-10",
  "lines": [
    {
      "line_no": 1,
      "item_id": "uuid",
      "ordered_quantity": 10,
      "open_quantity": 10,
      "uom_code_snapshot": "EA",
      "warehouse_preference_id": "uuid"
    }
  ]
}

## 3. Billable reference surface to Billing
{
  "source_module": "04.order-management",
  "om_sales_order_id": "uuid",
  "sales_order_number": "SO-2026-000001",
  "customer_id": "uuid",
  "billable_event_type": "shipment_confirmed",
  "billable_quantity_summary": 10,
  "currency_code": "JPY"
}

## 4. Integration rule
- Order Management emits operational request payloads
- Warehouse and Logistics own execution canon
- Billing consumes billable reference but owns invoice canon
- no shared mutable order execution object across modules
