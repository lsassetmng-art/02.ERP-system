# ============================================================
# ERP JSON EXAMPLE INTAKE EXPENSE CLAIM
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
POST /erp/intake/requests/expense-claims

request_json:
~~~json
{
  "company_id": "8f3c2e6a-9c1b-4c7a-a5d2-1c8c4b7f9e12",
  "claim_title": "Tokyo client visit transportation and meals",
  "expense_date": "2026-04-11",
  "currency_code": "JPY",
  "total_amount": 18400,
  "lines": [
    {
      "line_no": 1,
      "expense_category_code": "transportation",
      "description": "Round-trip train fare",
      "line_amount": 12400,
      "receipt_attachment_ref": "att_receipt_001"
    },
    {
      "line_no": 2,
      "expense_category_code": "meal",
      "description": "Client lunch meeting",
      "line_amount": 6000,
      "receipt_attachment_ref": "att_receipt_002"
    }
  ],
  "request_reason_text": "Client meeting related reimbursement",
  "idempotency_key": "exp-claim-20260411-001"
}
~~~

response_json:
~~~json
{
  "correlation_id": "corr_expense_claim_001",
  "request_id": "req_exp_001",
  "request_status": "mapped",
  "acceptance_status": "accepted_for_processing",
  "mapped_record_id": "doc_expense_claim_001",
  "mapped_record_type": "expense_claim",
  "review_required": true,
  "warnings": [],
  "errors": []
}
~~~

notes:
- accepted_for_processing does not mean approved
- mapped_record_id does not mean reimbursed or posted
