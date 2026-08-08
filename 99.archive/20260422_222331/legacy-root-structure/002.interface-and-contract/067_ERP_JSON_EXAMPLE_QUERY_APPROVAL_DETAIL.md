# ============================================================
# ERP JSON EXAMPLE QUERY APPROVAL DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/approvals/{approval_request_id}

response_json:
~~~json
{
  "correlation_id": "corr_approval_detail_001",
  "approval_request_id": "apr_001",
  "approval_status": "under_approval",
  "current_lane": "department_manager",
  "target_document": {
    "document_id": "doc_expense_claim_001",
    "document_type": "expense_claim",
    "lifecycle_state": "submitted"
  },
  "requester_summary": "Boss",
  "actions": [
    {
      "acted_at": "2026-04-11T09:18:00+09:00",
      "action_code": "submit_for_approval",
      "actor_summary": "Boss"
    }
  ],
  "lane_history": [
    {
      "lane_code": "department_manager",
      "entered_at": "2026-04-11T09:19:00+09:00",
      "lane_status": "active"
    }
  ],
  "warnings": [],
  "errors": []
}
~~~

notes:
- approval_status and target_document.lifecycle_state are different scopes
- query is read-only
- actions are approval action summaries, not a replacement for generic audit history
