# ============================================================
# ERP PERFORMANCE EVALUATION CYCLE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2253
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.performance_evaluation_cycle.exact_payload
component: performance-evaluation-cycle-exact-payload


# OBJECT

performance_evaluation_cycle

Canonical payload:
- object_id
- company_id
- object_type = performance_evaluation_cycle
- status
- performance_evaluation_cycle_code
- evaluation_status_code
- evaluation_scope_code
- linked_subject_reference_code
- linked_dispatched_ai_robot_evaluation_reference_code
- evaluation_period_code
- evaluator_reference_code
- evaluation_requested_at
- finalized_at
- evaluation_summary_text
- created_at
- created_by
- updated_at
- updated_by

