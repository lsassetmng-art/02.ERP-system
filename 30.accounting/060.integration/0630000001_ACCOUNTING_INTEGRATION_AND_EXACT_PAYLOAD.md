# ============================================================
# ACCOUNTING INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 30.accounting

Posting request example:
{
  "source_module": "05.billing",
  "source_reference_id": "uuid",
  "reference_type": "invoice_issue",
  "posting_date": "2026-04-22",
  "currency_code": "JPY",
  "lines": [
    {
      "account_code": "1100",
      "debit_amount": 132000,
      "credit_amount": 0
    },
    {
      "account_code": "4100",
      "debit_amount": 0,
      "credit_amount": 120000
    },
    {
      "account_code": "2100",
      "debit_amount": 0,
      "credit_amount": 12000
    }
  ]
}

Posting response example:
{
  "acc_journal_entry_id": "uuid",
  "journal_number": "JE-2026-000001",
  "posting_status": "posted"
}
