# ============================================================
# ERP JSON EXAMPLE QUERY JOURNALS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/accounting/journals

response_json:
~~~json
{
  "correlation_id": "corr_journals_list_001",
  "items": [
    {
      "journal_id": "jnl_001",
      "journal_status": "posted",
      "accounting_period_id": "period_2026_04",
      "currency_code": "JPY",
      "total_debit": 50000,
      "total_credit": 50000,
      "source_summary": {
        "source_document_id": "invoice_001"
      },
      "created_at": "2026-04-11T10:00:00+09:00",
      "posted_at": "2026-04-11T10:05:00+09:00"
    }
  ],
  "next_cursor": null,
  "warnings": [],
  "errors": []
}
~~~

notes:
- currency_code is explicit
- journal_status belongs to accounting record state family
