# ============================================================
# ERP JSON EXAMPLE INTAKE PURCHASE REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/intake/requests/purchase-requests

request_json:
~~~json
{
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "request_title": "Office chairs for expansion area",
  "needed_by_date": "2026-04-25",
  "currency_code": "JPY",
  "total_amount_estimate": 120000,
  "lines": [
    {
      "line_no": 1,
      "product_id": "prod_office_chair_001",
      "item_description": "Ergonomic office chair",
      "quantity": 4,
      "unit_code": "EA",
      "estimated_unit_price": 30000,
      "estimated_line_amount": 120000,
      "supplier_partner_id": "partner_supplier_010",
      "cost_center_id": "cc_admin_001"
    }
  ],
  "request_reason_text": "Additional seating for new workspace",
  "idempotency_key": "purchase-req-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_purchase_request_001",
  "request_id": "req_pur_001",
  "request_status": "mapped",
  "acceptance_status": "accepted_for_processing",
  "mapped_record_id": "doc_purchase_request_001",
  "mapped_record_type": "purchase_request",
  "review_required": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- accepted_for_processing does not mean approved
- mapped_record_id does not mean purchase order issued
