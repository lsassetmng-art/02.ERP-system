# ============================================================
# ERP ANALYTICS OBJECT ROLE REGISTRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Registers the first-pass role classification
for analytics-related objects.

role_registry:

  native_metric_and_judgement_core:
  - analytics.fact_metric
  - analytics.audit_alert_ai_judgement
  - analytics.ai_job

  public_trend_and_summary_surfaces:
  - public.v_ng_daily_trend
  - public.v_ng_event
  - public.v_ng_event_list
  - public.v_ng_reason_stats
  - public.v_policy_update_candidate
  - public.v_rls_table_status

  finance_and_accounting_boundary_surfaces:
  - public.v_finance_payment_allocation
  - public.accounting_period
  - public.journal_entries
  - public.journal_lines

  operational_boundary_surface:
  - system.v_operation_log_audit

  metric_adjacent_domain_analytics:
  - manufacturing.yield_metric
  - public.v_manufacturing_yield_metric

conclusion:
This registry provides the first formal analytics role split
across native core, public analytical surfaces, boundary surfaces,
and metric-adjacent domain analytics.
