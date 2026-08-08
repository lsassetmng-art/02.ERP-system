# ============================================================
# ERP JSON EXAMPLE ACCOUNTING SETTLEMENT CREATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/accounting/settlements

request_json:
~~~json
{
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "settlement_type": "receipt_to_ar",
  "settlement_currency_code": "JPY",
  "source_ref": {
    "source_kind": "receipt",
    "source_id": "receipt_001"
  },
  "target_items": [
    {
      "target_kind": "accounts_receivable",
      "target_id": "ar_001",
      "applied_amount": 50000
    }
  ],
  "settlement_reason_text": "Customer payment matched to open receivable",
  "idempotency_key": "settlement-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_settlement_create_001",
  "action_result": "action_accepted",
  "settlement_id": "stl_001",
  "resulting_settlement_status": "applied",
  "related_balance_effect_summary": {
    "target_kind": "accounts_receivable",
    "target_id": "ar_001",
    "remaining_amount": 0
  },
  "emitted_events": [
    "settlement_applied"
  ],
  "downstream_processing_candidate": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- action_accepted does not mean dashboard/report refresh completion
- related balance summary is not a replacement for AR detail query
