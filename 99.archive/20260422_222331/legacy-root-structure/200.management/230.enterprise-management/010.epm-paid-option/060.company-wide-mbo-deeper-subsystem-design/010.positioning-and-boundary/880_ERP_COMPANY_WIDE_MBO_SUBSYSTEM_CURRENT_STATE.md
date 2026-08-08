# ============================================================
# ERP COMPANY WIDE MBO SUBSYSTEM CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-880
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo_subsystem.current_state
component: company-wide-mbo-subsystem-current-state


# ABSTRACT

Defines the current state for the first deeper subsystem
design pass of company_wide_mbo under the EPM paid option.

This subsystem is not treated as an ERP top-level line.
It is treated as a governed EPM-side deeper subsystem.


# CURRENT POSITION

company_wide_mbo is treated as:
- EPM-embedded
- enterprise roll-down oriented
- hierarchy-aware
- review-cycle-aware
- evaluation-support oriented
- cross-level traceable

company_wide_mbo is not treated as:
- standalone ERP core
- personal goal app
- lightweight memo tracker
- generic dashboard-only surface

