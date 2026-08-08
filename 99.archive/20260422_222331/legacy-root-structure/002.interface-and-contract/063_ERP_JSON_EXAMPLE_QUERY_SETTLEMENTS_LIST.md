# ============================================================
# ERP JSON EXAMPLE QUERY SETTLEMENTS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/accounting/settlements

response_json:
~~~json
{
  "correlation_id": "corr_settlements_list_001",
  "items": [
    {
      "settlement_id": "stl_001",
      "settlement_type": "receipt_to_ar",
      "settlement_status": "applied",
      "settlement_currency_code": "JPY",
      "total_applied_amount": 50000,
      "applied_at": "2026-04-11T10:30:00+09:00",
      "source_summary": {
        "source_kind": "receipt",
        "source_id": "receipt_001"
      },
      "target_count": 1
    }
  ],
  "next_cursor": null,
  "warnings": [],
  "errors": []
}
~~~

notes:
- settlement_currency_code is explicit for multi-currency handling
- query is read-only
