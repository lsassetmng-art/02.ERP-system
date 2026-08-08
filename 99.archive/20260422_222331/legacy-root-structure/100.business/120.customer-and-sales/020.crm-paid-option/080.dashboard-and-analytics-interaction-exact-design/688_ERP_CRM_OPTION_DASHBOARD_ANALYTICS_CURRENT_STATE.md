# ============================================================
# ERP CRM OPTION DASHBOARD ANALYTICS CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-688
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.dashboard_analytics.current_state
component: crm-option-dashboard-analytics-current-state


# ABSTRACT

Defines the current state for the first exact dashboard
and analytics interaction pass for the CRM paid option.

The previous passes fixed:
- paid option positioning
- exact object families
- request / response contracts
- state transitions
- screen/stateflow
- permission / role matrix

This pass fixes:
- dashboard surfaces
- analytics interaction rules
- owner / inquiry / lifecycle analytical views
- source-truth vs derived-surface treatment


# GOAL

The goal is not BI implementation.

The goal is exact CRM analytical interaction design:
- what the dashboard surfaces are
- what they summarize
- what they must not overwrite
- how users navigate from derived surface to exact CRM objects


# CONSTRAINTS

Do not treat dashboard numbers as source truth.

Do not flatten account, inquiry, interaction, lifecycle,
and ownership into one vague summary layer.

