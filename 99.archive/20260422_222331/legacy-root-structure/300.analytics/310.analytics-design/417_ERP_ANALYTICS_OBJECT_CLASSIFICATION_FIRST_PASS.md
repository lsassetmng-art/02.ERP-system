# ============================================================
# ERP ANALYTICS OBJECT CLASSIFICATION FIRST PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass classification
for analytics-related objects after inventory review.

classification:

  analytics_native_core:
  - analytics.fact_metric
  - analytics.audit_alert_ai_judgement
  - analytics.ai_job

  public_analytical_views:
  - public.v_ng_daily_trend
  - public.v_ng_event
  - public.v_ng_event_list
  - public.v_ng_reason_stats
  - public.v_policy_update_candidate
  - public.v_rls_table_status

  finance_and_accounting_read_surfaces:
  - public.v_finance_payment_allocation
  - public.accounting_period
  - public.journal_entries
  - public.journal_lines

  operational_analytical_view:
  - system.v_operation_log_audit

  metric_adjacent_domain_analytics:
  - manufacturing.yield_metric
  - public.v_manufacturing_yield_metric

conclusion:
Analytics is best understood as a multi-layer architecture
with native analytics tables, analytical views, read surfaces,
operational analytical views, and metric-adjacent domain layers.
