# ============================================================
# ERP JSON EXAMPLE QUERY JOURNAL DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/accounting/journals/{journal_id}

response_json:
~~~json
{
  "correlation_id": "corr_journal_detail_001",
  "journal_id": "jnl_001",
  "journal_status": "posted",
  "accounting_period_id": "period_2026_04",
  "source_summary": {
    "source_document_id": "invoice_001"
  },
  "lines": [
    {
      "line_no": 1,
      "account_code": "1100",
      "debit_amount": 50000,
      "credit_amount": 0
    },
    {
      "line_no": 2,
      "account_code": "4100",
      "debit_amount": 0,
      "credit_amount": 50000
    }
  ],
  "warnings": [],
  "errors": []
}
~~~

notes:
- query does not mutate journal truth
