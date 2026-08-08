# ============================================================
# ERP OVERRIDE AUDIT PACK CASE AND OVERRIDE AUDIT SUMMARY EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3267
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.override_audit_pack_case_and_override_audit_summary.exact_surface
component: override-audit-pack-case-and-override-audit-summary-exact-surface


# OBJECT 1

override_audit_pack_case

Canonical fields:
- override_audit_pack_case_id
- company_id
- linked_override_audit_pack_profile_id
- linked_escalation_override_case_id
- pack_scope_code
- pack_started_at
- pack_completed_at
- pack_result_code
- pack_completeness_code
- pack_summary_text
- pack_state_code
- created_at
- updated_at


# OBJECT 2

override_audit_summary

Canonical fields:
- override_audit_summary_id
- company_id
- linked_override_audit_pack_case_id
- linked_escalation_override_decision_case_id
- audit_summary_scope_code
- audit_result_code
- audit_risk_code
- summarized_at
- audit_summary_text
- audit_summary_state_code
- created_at
- updated_at

