# ============================================================
# ERP EPM KPI SCORECARD FORECAST STATUS RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-858
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.kpi_scorecard_forecast.status_rules
component: epm-kpi-scorecard-forecast-status-rules


# KPI STATUS SET

- draft
- active
- replaced
- retired


# FORECAST STATUS SET

- draft
- submitted
- reviewed
- locked
- superseded


# VARIANCE STATUS SET

- draft
- reviewed
- explained
- escalated
- closed


# RULE

Reviewed is not explained.
Superseded forecast must remain historically visible.

