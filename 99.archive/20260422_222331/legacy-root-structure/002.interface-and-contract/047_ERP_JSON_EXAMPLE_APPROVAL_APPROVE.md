# ============================================================
# ERP JSON EXAMPLE APPROVAL APPROVE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/approvals/{approval_request_id}/approve

request_json:
~~~json
{
  "action_reason_text": "Validated and approved by department manager",
  "comment": "Budget and receipt checks passed",
  "idempotency_key": "approval-approve-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_approval_approve_001",
  "action_result": "action_accepted",
  "approval_request_id": "apr_001",
  "resulting_approval_status": "approved",
  "emitted_events": [
    "approval_approved"
  ],
  "downstream_processing_candidate": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- action_accepted means approval action recorded in approval scope
- does not mean business document finalized by default
