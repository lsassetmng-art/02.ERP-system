# ============================================================
# ERP CRM OPTION ACCOUNT SEGMENT LIFECYCLE ANALYTICS STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-690
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_segment_lifecycle.analytics_stateflow
component: crm-option-account-segment-lifecycle-analytics-stateflow


# PRIMARY ANALYTICS SURFACES

- total account count
- account count by segment
- account count by lifecycle
- newly activated accounts
- dormant account count
- reactivated account count


# PRIMARY STATEFLOW

dashboard entry
-> card selected
-> filtered analytics surface
-> exact account list
-> exact account detail


# REQUIRED FILTER DIMENSIONS

- segment_code
- lifecycle_code
- owner_user_id
- country_code
- region_code
- account_kind_code
- time window where relevant


# RULE

Segment distribution and lifecycle distribution must remain distinct.
A dashboard surface must not imply they are the same analytical dimension.


# USER-VISIBLE STATES

- loading
- ready
- empty
- filter_updating
- permission_denied
- failed

