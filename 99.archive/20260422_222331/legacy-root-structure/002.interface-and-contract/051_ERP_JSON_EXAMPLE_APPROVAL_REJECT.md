# ============================================================
# ERP JSON EXAMPLE APPROVAL REJECT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/approvals/{approval_request_id}/reject

request_json:
~~~json
{
  "rejection_reason_code": "budget_exceeded",
  "rejection_reason_text": "Requested amount exceeds department budget threshold",
  "comment": "Please revise and resubmit with updated budget approval",
  "idempotency_key": "approval-reject-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_approval_reject_001",
  "action_result": "action_accepted",
  "approval_request_id": "apr_002",
  "resulting_approval_status": "rejected",
  "emitted_events": [
    "approval_rejected"
  ],
  "downstream_processing_candidate": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- action_accepted means reject action recorded in approval scope
- does not mean business rollback fully completed
