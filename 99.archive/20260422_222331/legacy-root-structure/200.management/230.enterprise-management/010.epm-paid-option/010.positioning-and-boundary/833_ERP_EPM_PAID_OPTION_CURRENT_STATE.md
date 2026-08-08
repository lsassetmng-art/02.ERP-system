# ============================================================
# ERP EPM PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-833
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_paid_option.current_state
component: epm-paid-option-current-state


# ABSTRACT

Defines the current state for the first bundled
detailed design pass of EPM as an ERP-attached
paid option module.

EPM is positioned after LaborManager in the corrected
ERP active priority line and is now the next
major enterprise-management module-level line.


# CURRENT POSITION

EPM is treated as:
- optional
- paid
- organization-scoped
- management-heavy
- objective/KPI centered
- review-cycle centered
- auditable
- cross-department visible

EPM is not treated as:
- mandatory ERP core
- personal goal app
- simple dashboard-only layer
- payroll or labor execution system


# DESIGN GOAL

This bundled pass establishes:
- positioning
- boundaries
- object exactness
- request/response contracts
- state transition and review governance rules
- screen/stateflow
- permission matrix
- analytics/reporting surfaces
- integrated summary


# CONSTRAINTS

Do not collapse EPM into raw analytics.

Do not reduce EPM to only KPI charts.

Do not merge company_wide_mbo indistinctly into all EPM objects.

