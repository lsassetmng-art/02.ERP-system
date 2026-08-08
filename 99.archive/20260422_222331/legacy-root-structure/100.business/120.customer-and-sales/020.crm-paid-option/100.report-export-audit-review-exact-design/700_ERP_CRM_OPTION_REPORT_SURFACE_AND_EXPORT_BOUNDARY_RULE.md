# ============================================================
# ERP CRM OPTION REPORT SURFACE AND EXPORT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-700
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.report_surface_and_export.boundary_rule
component: crm-option-report-surface-and-export-boundary-rule


# RULE

Report viewing and export must remain distinct.


# REPORT SURFACE

Examples:
- segment distribution report
- lifecycle movement report
- inquiry workload report
- response timing report
- owner assignment report


# EXPORT SURFACE

Examples:
- CSV export
- structured external download
- review extract for audit or governance use


# CONSEQUENCE

A user may be allowed to view a report without being
allowed to export its underlying rows or sensitive details.

