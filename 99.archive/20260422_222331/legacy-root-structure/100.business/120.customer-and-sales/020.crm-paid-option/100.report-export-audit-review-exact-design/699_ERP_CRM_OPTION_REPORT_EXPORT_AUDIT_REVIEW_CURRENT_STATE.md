# ============================================================
# ERP CRM OPTION REPORT EXPORT AUDIT REVIEW CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-699
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.report_export_audit_review.current_state
component: crm-option-report-export-audit-review-current-state


# ABSTRACT

Defines the current state for the first exact report,
export, and audit review pass for the CRM paid option.

This pass fixes:
- report surface treatment
- export boundary and permission treatment
- audit review interaction line for sensitive actions


# GOAL

The goal is to separate:
- read
- export
- audit review
- operational detail use

These must not be treated as one permission or one UI mode.

