# ============================================================
# ERP AUDIT ESCALATION AUTOMATION CASE AND AUDIT ESCALATION SUMMARY EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3299
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_escalation_automation_case_and_audit_escalation_summary.exact_surface
component: audit-escalation-automation-case-and-audit-escalation-summary-exact-surface


# OBJECT 1

audit_escalation_automation_case

Canonical fields:
- audit_escalation_automation_case_id
- company_id
- linked_audit_escalation_automation_profile_id
- linked_override_audit_pack_case_id
- automation_case_scope_code
- automation_started_at
- automation_completed_at
- automation_result_code
- escalation_route_result_code
- automation_summary_text
- automation_state_code
- created_at
- updated_at


# OBJECT 2

audit_escalation_summary

Canonical fields:
- audit_escalation_summary_id
- company_id
- linked_audit_escalation_automation_case_id
- linked_override_audit_summary_id
- summary_scope_code
- summary_result_code
- summary_risk_code
- summarized_at
- summary_text
- summary_state_code
- created_at
- updated_at

