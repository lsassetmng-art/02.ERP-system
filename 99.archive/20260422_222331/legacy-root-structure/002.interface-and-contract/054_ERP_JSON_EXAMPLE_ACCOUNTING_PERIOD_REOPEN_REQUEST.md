# ============================================================
# ERP JSON EXAMPLE ACCOUNTING PERIOD REOPEN REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/accounting/periods/{period_id}/reopen-request

request_json:
~~~json
{
  "reopen_reason_code": "post_close_adjustment_required",
  "reopen_reason_text": "Late supplier invoice requires controlled adjustment",
  "requested_scope_code": "limited_adjustment",
  "supporting_refs": [
    {
      "ref_type": "supplier_invoice",
      "ref_id": "supplier_invoice_009"
    }
  ],
  "idempotency_key": "period-reopen-request-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_period_reopen_req_001",
  "request_id": "gov_req_001",
  "request_status": "received",
  "acceptance_status": "accepted_for_review",
  "mapped_record_id": "reopen_req_001",
  "mapped_record_type": "reopen_request",
  "review_required": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- accepted_for_review means governance review started
- does not mean resulting_period_status=open
