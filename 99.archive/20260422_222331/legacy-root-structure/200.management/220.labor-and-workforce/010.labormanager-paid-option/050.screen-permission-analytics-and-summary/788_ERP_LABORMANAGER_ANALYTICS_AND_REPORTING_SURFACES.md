# ============================================================
# ERP LABORMANAGER ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-788
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.analytics_and_reporting_surfaces
component: labormanager-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- attendance exception count
- leave request count by status
- onboarding completion rate
- offboarding completion backlog
- overdue training count
- compliance blocking count by department


# RULE

These are derived labor analytical surfaces.

They must drill down to exact staff, attendance,
leave, onboarding, training, or compliance objects
when permissions allow.

