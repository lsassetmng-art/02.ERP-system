# ============================================================
# ERP JSON EXAMPLE QUERY DASHBOARD CONTROL TOWER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/dashboard/control-tower

response_json:
~~~json
{
  "correlation_id": "corr_dashboard_control_tower_001",
  "freshness": "near_realtime",
  "summary_sections": [
    {
      "section_code": "approvals",
      "section_title": "Pending Approvals",
      "metrics": [
        {
          "metric_code": "pending_count",
          "metric_value": 12
        }
      ],
      "alert_summary": {
        "high_priority_count": 2
      }
    },
    {
      "section_code": "accounting",
      "section_title": "Open Receivables",
      "metrics": [
        {
          "metric_code": "open_amount",
          "metric_value": 1250000,
          "metric_unit": "JPY"
        }
      ]
    }
  ],
  "warnings": [],
  "errors": []
}
~~~

notes:
- freshness is dashboard freshness-family meaning
- summary_sections are analytical summaries, not transactional source-of-truth
