# ============================================================
# ERP JSON EXAMPLE INTAKE PAYMENT REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/intake/requests/payment-requests

request_json:
~~~json
{
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "payment_title": "Supplier payment for April office supplies",
  "payee_partner_id": "partner_sup_001",
  "requested_payment_date": "2026-04-20",
  "currency_code": "JPY",
  "total_amount": 55000,
  "lines": [
    {
      "line_no": 1,
      "payable_category_code": "supplier_invoice",
      "description": "Office supplies April batch",
      "line_amount": 55000,
      "source_document_id": "supplier_invoice_001"
    }
  ],
  "request_reason_text": "Payment due this month",
  "idempotency_key": "payment-req-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_payment_request_001",
  "request_id": "req_pay_001",
  "request_status": "mapped",
  "acceptance_status": "accepted_for_processing",
  "mapped_record_id": "doc_payment_request_001",
  "mapped_record_type": "payment_request",
  "review_required": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- accepted_for_processing does not mean payment executed
- mapped_record_id does not mean approved or settled
