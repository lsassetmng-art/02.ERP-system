# ============================================================
# ERP ANALYTICS FIRST PASS SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the first-pass analytics architecture reading.

main_result:
Analytics has at least five distinguishable layers:
- analytics native core
- public analytical views
- finance/accounting read surfaces
- operational analytical view
- metric-adjacent domain analytics

strongest current anchors:
- analytics.fact_metric
- analytics.audit_alert_ai_judgement
- analytics.ai_job
- public.v_ng_daily_trend
- system.v_operation_log_audit

important_design_consequence:
Analytics architecture should be expanded
as a layered derived-information domain,
not as a miscellaneous bucket of views.

conclusion:
The analytics inventory pass is strong enough
to support a first architecture-layer design step.
