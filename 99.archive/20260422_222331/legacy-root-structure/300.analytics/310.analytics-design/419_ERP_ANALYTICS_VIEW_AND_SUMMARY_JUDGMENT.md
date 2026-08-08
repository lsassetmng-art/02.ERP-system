# ============================================================
# ERP ANALYTICS VIEW AND SUMMARY JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for public analytical views and summaries.

current_reading:
- public.v_ng_daily_trend is a trend view
- public.v_ng_event_list is a summary/list view
- public.v_ng_reason_stats is a stats view
- public.v_policy_update_candidate is a candidate-oriented analytical view
- public.v_rls_table_status is a control/status summary view

important note:
These objects are analytical surfaces,
but not necessarily analytics native-core truth.

conclusion:
Public analytical views should be modeled
as derived analytical read surfaces.
