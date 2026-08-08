# ============================================================
# ERP JSON EXAMPLE QUERY APPROVAL PENDING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/approvals/pending

response_json:
~~~json
{
  "correlation_id": "corr_approval_pending_001",
  "items": [
    {
      "approval_request_id": "apr_001",
      "target_document_id": "doc_expense_claim_001",
      "target_document_type": "expense_claim",
      "approval_status": "under_approval",
      "current_lane": "department_manager",
      "submitted_at": "2026-04-11T09:18:00+09:00",
      "requester_summary": "Boss",
      "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12"
    },
    {
      "approval_request_id": "apr_002",
      "target_document_id": "doc_payment_request_001",
      "target_document_type": "payment_request",
      "approval_status": "under_approval",
      "current_lane": "finance_manager",
      "submitted_at": "2026-04-11T10:05:00+09:00",
      "requester_summary": "Boss",
      "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12"
    }
  ],
  "next_cursor": null,
  "warnings": [],
  "errors": []
}
~~~

notes:
- approval_status is approval-family state only
- list visibility does not imply mutation authority for every row
- query is read-only
