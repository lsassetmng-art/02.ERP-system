# ============================================================
# ERP JSON EXAMPLE ACCOUNTING PERIOD CLOSE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/accounting/periods/{period_id}/close

request_json:
~~~json
{
  "close_reason_text": "Month-end close after reconciliation completion",
  "idempotency_key": "period-close-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_period_close_001",
  "action_result": "action_accepted",
  "accounting_period_id": "period_2026_04",
  "resulting_period_status": "closed",
  "blocker_summary": [],
  "emitted_events": [
    "accounting_period_closed"
  ],
  "downstream_processing_candidate": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- action_accepted means close action accepted in accounting scope
- does not mean all downstream reporting is complete
