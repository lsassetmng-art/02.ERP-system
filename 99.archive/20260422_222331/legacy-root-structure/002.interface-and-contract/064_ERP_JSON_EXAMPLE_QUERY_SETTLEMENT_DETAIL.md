# ============================================================
# ERP JSON EXAMPLE QUERY SETTLEMENT DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/accounting/settlements/{settlement_id}

response_json:
~~~json
{
  "correlation_id": "corr_settlement_detail_001",
  "settlement_id": "stl_001",
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "settlement_type": "receipt_to_ar",
  "settlement_status": "applied",
  "settlement_currency_code": "JPY",
  "total_applied_amount": 50000,
  "applied_at": "2026-04-11T10:30:00+09:00",
  "source_summary": {
    "source_kind": "receipt",
    "source_id": "receipt_001"
  },
  "lines": [
    {
      "target_kind": "accounts_receivable",
      "target_id": "ar_001",
      "applied_amount": 50000
    }
  ],
  "warnings": [],
  "errors": []
}
~~~

notes:
- settlement_status is settlement-family state only
- query does not mutate settlement truth
