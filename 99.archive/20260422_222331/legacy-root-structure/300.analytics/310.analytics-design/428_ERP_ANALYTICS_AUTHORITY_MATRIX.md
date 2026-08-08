# ============================================================
# ERP ANALYTICS AUTHORITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass authority matrix
for analytics-related objects.

authority_matrix:

  analytics.fact_metric:
    authority_role:
    - metric/fact analytics authority
    authority_strength:
    - strong
    notes:
    - strongest native metric anchor in analytics

  analytics.audit_alert_ai_judgement:
    authority_role:
    - alert/judgement analytics authority
    authority_strength:
    - strong
    notes:
    - strongest analytical judgement anchor

  analytics.ai_job:
    authority_role:
    - analytics-driven job/control bridge authority
    authority_strength:
    - medium
    notes:
    - bridge from analytics decision to controlled action

  public.v_ng_daily_trend:
    authority_role:
    - trend exposure surface
    authority_strength:
    - medium_as_derived
    notes:
    - derived trend surface, not analytics native core

  public.v_ng_event:
    authority_role:
    - event exposure surface
    authority_strength:
    - medium_as_derived
    notes:
    - derived event-facing analytical surface

  public.v_ng_event_list:
    authority_role:
    - event-list summary surface
    authority_strength:
    - medium_as_derived
    notes:
    - summary/list oriented analytical surface

  public.v_ng_reason_stats:
    authority_role:
    - stats exposure surface
    authority_strength:
    - medium_as_derived
    notes:
    - reason-statistics analytical surface

  public.v_policy_update_candidate:
    authority_role:
    - candidate analytical surface
    authority_strength:
    - medium_as_derived
    notes:
    - policy-update candidate exposure layer

  public.v_rls_table_status:
    authority_role:
    - status/control analytical surface
    authority_strength:
    - medium_as_derived
    notes:
    - control/status summary exposure layer

  public.v_finance_payment_allocation:
    authority_role:
    - finance analytical/read boundary surface
    authority_strength:
    - low_as_analytics_truth
    notes:
    - analytical usability exists, but also writable/read-surface traits

  public.accounting_period:
    authority_role:
    - accounting read boundary surface
    authority_strength:
    - low_as_analytics_truth
    notes:
    - exposed accounting read surface with analytical usability

  public.journal_entries:
    authority_role:
    - accounting read boundary surface
    authority_strength:
    - low_as_analytics_truth
    notes:
    - exposed read surface, not analytics native core

  public.journal_lines:
    authority_role:
    - accounting read boundary surface
    authority_strength:
    - low_as_analytics_truth
    notes:
    - exposed read surface, not analytics native core

  system.v_operation_log_audit:
    authority_role:
    - operational analytical boundary view
    authority_strength:
    - low_as_analytics_truth
    notes:
    - sits near management/audit boundary

  manufacturing.yield_metric:
    authority_role:
    - metric-adjacent domain analytics anchor
    authority_strength:
    - medium
    notes:
    - manufacturing-owned metric layer with analytics relevance

  public.v_manufacturing_yield_metric:
    authority_role:
    - metric exposure surface
    authority_strength:
    - medium_as_derived
    notes:
    - derived metric surface over manufacturing.yield_metric

conclusion:
Analytics authority is distributed across native analytics anchors,
derived exposure surfaces, and boundary analytical surfaces.
