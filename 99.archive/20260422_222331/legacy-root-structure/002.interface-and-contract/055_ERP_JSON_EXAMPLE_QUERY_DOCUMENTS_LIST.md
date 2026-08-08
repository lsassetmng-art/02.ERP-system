# ============================================================
# ERP JSON EXAMPLE QUERY DOCUMENTS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/documents

response_json:
~~~json
{
  "correlation_id": "corr_documents_list_001",
  "items": [
    {
      "document_id": "doc_expense_claim_001",
      "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
      "document_type": "expense_claim",
      "lifecycle_state": "submitted",
      "title_summary": "Tokyo client visit transportation and meals",
      "localized_title_summary": "東京クライアント訪問 交通費・会食費",
      "owner_summary": "Boss",
      "created_at": "2026-04-11T09:15:00+09:00",
      "updated_at": "2026-04-11T09:18:00+09:00",
      "approval_status_summary": "under_approval",
      "high_risk_flag": false
    }
  ],
  "next_cursor": null,
  "warnings": [],
  "errors": []
}
~~~

notes:
- localized_title_summary is display support only
- query is read-only
