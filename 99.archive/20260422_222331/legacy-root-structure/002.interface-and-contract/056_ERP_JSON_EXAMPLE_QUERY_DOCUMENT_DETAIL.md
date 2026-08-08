# ============================================================
# ERP JSON EXAMPLE QUERY DOCUMENT DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/documents/{document_id}

response_json:
~~~json
{
  "correlation_id": "corr_document_detail_001",
  "document_id": "doc_expense_claim_001",
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "document_type": "expense_claim",
  "lifecycle_state": "submitted",
  "header_summary": {
    "title_summary": "Tokyo client visit transportation and meals",
    "owner_actor_id": "actor_boss_001",
    "created_at": "2026-04-11T09:15:00+09:00",
    "currency_code": "JPY"
  },
  "localized_header_summary": {
    "title_summary": "東京クライアント訪問 交通費・会食費"
  },
  "lines": [
    {
      "line_no": 1,
      "description": "Round-trip train fare",
      "line_amount": 12400
    },
    {
      "line_no": 2,
      "description": "Client lunch meeting",
      "line_amount": 6000
    }
  ],
  "approval_summary": {
    "approval_status": "under_approval",
    "current_lane": "department_manager"
  },
  "warnings": [],
  "errors": []
}
~~~

notes:
- lifecycle_state and approval_summary.approval_status are different scopes
- query is read-only
