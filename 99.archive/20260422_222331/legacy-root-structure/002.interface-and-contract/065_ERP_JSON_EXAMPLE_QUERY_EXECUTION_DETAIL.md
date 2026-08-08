# ============================================================
# ERP JSON EXAMPLE QUERY EXECUTION DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

endpoint:
GET /erp/executions/{execution_request_id}

response_json:
~~~json
{
  "correlation_id": "corr_execution_detail_001",
  "execution_request_id": "exec_001",
  "execution_status": "retry_waiting",
  "execution_type": "notification_dispatch",
  "retry_count": 2,
  "next_retry_at": "2026-04-11T12:30:00+09:00",
  "latest_attempt": {
    "attempt_no": 2,
    "started_at": "2026-04-11T12:00:00+09:00",
    "finished_at": "2026-04-11T12:00:05+09:00"
  },
  "latest_result": {
    "result_status": "failed",
    "error_code": "downstream_timeout",
    "error_message": "Notification gateway timeout"
  },
  "source_summary": {
    "source_kind": "approval_event",
    "source_id": "apr_evt_001"
  },
  "warnings": [],
  "errors": []
}
~~~

notes:
- execution_status is runtime/execution family state only
- query is read-only
- source_summary does not mean source business workflow is complete
