# ============================================================
# ERP ANALYTICS VIEW AND SUMMARY ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for public analytical views and summaries.

main_objects:
- public.v_ng_daily_trend
- public.v_ng_event
- public.v_ng_event_list
- public.v_ng_reason_stats
- public.v_policy_update_candidate
- public.v_rls_table_status

role_split:
- trend layer
- event/list layer
- stats layer
- candidate layer
- status/control summary layer

main_rule:
These views should be modeled
as derived analytical read surfaces,
not as analytics native-core ownership objects.

conclusion:
Public analytical views form the main summary-and-exposure subdomain
inside ERP analytics architecture.
