# ============================================================
# ERP ANALYTICS RESPONSIBILITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass responsibility matrix
for analytics-related objects.

responsibility_matrix:

  analytics.fact_metric:
    responsibility:
    - metric storage
    - fact-level analytical measurement
    - analytics-native measurement responsibility

  analytics.audit_alert_ai_judgement:
    responsibility:
    - analytical judgement
    - alert interpretation
    - review-oriented analytical decision support

  analytics.ai_job:
    responsibility:
    - analytics-driven job coordination
    - analytical decision-to-action bridge

  public.v_ng_daily_trend:
    responsibility:
    - daily trend exposure

  public.v_ng_event:
    responsibility:
    - event-oriented analytical exposure

  public.v_ng_event_list:
    responsibility:
    - event list and summary exposure

  public.v_ng_reason_stats:
    responsibility:
    - reason-statistics exposure

  public.v_policy_update_candidate:
    responsibility:
    - candidate-oriented analytical exposure

  public.v_rls_table_status:
    responsibility:
    - control/status summary exposure

  public.v_finance_payment_allocation:
    responsibility:
    - finance-side analytical/read exposure

  public.accounting_period:
    responsibility:
    - accounting period read exposure

  public.journal_entries:
    responsibility:
    - journal-entry read exposure

  public.journal_lines:
    responsibility:
    - journal-line read exposure

  system.v_operation_log_audit:
    responsibility:
    - operational audit/log analytical exposure

  manufacturing.yield_metric:
    responsibility:
    - metric-adjacent domain measurement

  public.v_manufacturing_yield_metric:
    responsibility:
    - manufacturing metric exposure

conclusion:
Analytics responsibilities are layered across
measurement, judgement, trend, summary, and boundary-surface exposure.
