# ============================================================
# ERP JSON EXAMPLE QUERY PERIODS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/accounting/periods

response_json:
~~~json
{
  "correlation_id": "corr_periods_list_001",
  "items": [
    {
      "accounting_period_id": "period_2026_04",
      "period_code": "2026-04",
      "localized_period_label": "2026年4月",
      "period_status": "closed",
      "start_date": "2026-04-01",
      "end_date": "2026-04-30",
      "closed_at": "2026-05-01T18:00:00+09:00",
      "locked_flag": false
    }
  ],
  "next_cursor": null,
  "warnings": [],
  "errors": []
}
~~~

notes:
- localized_period_label is display support only
- query is read-only
