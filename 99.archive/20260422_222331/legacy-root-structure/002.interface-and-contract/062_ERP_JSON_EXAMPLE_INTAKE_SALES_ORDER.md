# ============================================================
# ERP JSON EXAMPLE INTAKE SALES ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/intake/requests/sales-orders

request_json:
~~~json
{
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "order_title": "April retail replenishment order",
  "customer_partner_id": "partner_customer_001",
  "order_date": "2026-04-11",
  "requested_delivery_date": "2026-04-18",
  "currency_code": "JPY",
  "total_amount": 240000,
  "lines": [
    {
      "line_no": 1,
      "product_id": "prod_retail_item_001",
      "item_description": "Retail item A",
      "quantity": 20,
      "unit_code": "EA",
      "unit_price": 12000,
      "line_amount": 240000,
      "warehouse_id": "wh_main_001"
    }
  ],
  "request_reason_text": "Customer replenishment request",
  "idempotency_key": "sales-order-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_sales_order_001",
  "request_id": "req_sales_001",
  "request_status": "mapped",
  "acceptance_status": "accepted_for_processing",
  "mapped_record_id": "doc_sales_order_001",
  "mapped_record_type": "sales_order",
  "review_required": false,
  "warnings": [],
  "errors": []
}
~~~

notes:
- accepted_for_processing does not mean shipment created
- mapped_record_id does not mean invoice finalized
