# ============================================================
# ERP ESCALATION OVERRIDE DECISION AND TUNING EVIDENCE SUMMARY EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3234
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.escalation_override_decision_and_tuning_evidence_summary.exact_surface
component: escalation-override-decision-and-tuning-evidence-summary-exact-surface


# OBJECT 1

escalation_override_decision_case

Canonical fields:
- escalation_override_decision_case_id
- company_id
- linked_escalation_override_case_id
- decision_scope_code
- decision_code
- decided_by_reference_code
- decided_at
- decision_summary_text
- decision_state_code
- created_at
- updated_at


# OBJECT 2

tuning_evidence_summary

Canonical fields:
- tuning_evidence_summary_id
- company_id
- linked_objective_tuning_session_id
- linked_delegation_outcome_ledger_id
- evidence_scope_code
- evidence_strength_code
- evidence_consistency_code
- rollback_readiness_code
- evidence_summary_text
- summarized_at
- evidence_state_code
- created_at
- updated_at

