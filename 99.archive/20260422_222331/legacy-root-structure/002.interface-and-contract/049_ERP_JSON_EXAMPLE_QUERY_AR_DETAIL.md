# ============================================================
# ERP JSON EXAMPLE QUERY AR DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/accounting/receivables/{ar_id}

response_json:
~~~json
{
  "correlation_id": "corr_ar_detail_001",
  "ar_id": "ar_001",
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "balance_state": "settled",
  "original_amount": 50000,
  "open_amount": 0,
  "currency_code": "JPY",
  "due_date": "2026-04-20",
  "source_document_summary": {
    "source_document_id": "invoice_001",
    "source_document_type": "sales_invoice"
  },
  "settlement_summary": {
    "settled_amount": 50000,
    "remaining_amount": 0
  },
  "warnings": [],
  "errors": []
}
~~~

notes:
- balance_state is accounting balance-family state
- query is read-only
