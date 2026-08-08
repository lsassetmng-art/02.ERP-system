# ============================================================
# ERP JSON EXAMPLE QUERY DOCUMENT HISTORY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/documents/{document_id}/history

response_json:
~~~json
{
  "correlation_id": "corr_document_history_001",
  "document_id": "doc_expense_claim_001",
  "timeline": [
    {
      "occurred_at": "2026-04-11T09:15:00+09:00",
      "entry_type": "event",
      "code": "document_created",
      "summary": "Expense claim document created",
      "localized_summary": "経費申請書が作成されました",
      "actor_summary": "Boss"
    },
    {
      "occurred_at": "2026-04-11T09:18:00+09:00",
      "entry_type": "event",
      "code": "document_submitted",
      "summary": "Expense claim submitted",
      "localized_summary": "経費申請が提出されました",
      "actor_summary": "Boss"
    }
  ],
  "next_cursor": null,
  "warnings": [],
  "errors": []
}
~~~

notes:
- timeline is history, not current authoritative state
