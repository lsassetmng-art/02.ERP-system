# ============================================================
# ERP JSON EXAMPLE APPROVAL RETURN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/approvals/{approval_request_id}/return

request_json:
~~~json
{
  "return_reason_code": "missing_supporting_detail",
  "return_reason_text": "Receipt image and project code are required",
  "comment": "Please attach the missing receipt and project allocation",
  "idempotency_key": "approval-return-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_approval_return_001",
  "action_result": "action_accepted",
  "approval_request_id": "apr_003",
  "resulting_approval_status": "returned",
  "emitted_events": [
    "approval_returned"
  ],
  "downstream_processing_candidate": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- action_accepted means return action recorded in approval scope
- does not mean document resubmission already happened
