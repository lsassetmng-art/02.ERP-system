# ============================================================
# ERP DEMAND / S&OP / PRODUCTION PLANNING / BI
# HANDOFF AND STATUS MATRIX EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 06.demand-forecasting
- 07.sop-consensus
- 16.production-planning
- 60.business-intelligence

purpose:
Define a minimal exact matrix for status progression and handoff gates across
forecasting, consensus, production planning, and BI.

# ============================================================
# 1. STATUS TAXONOMY
# ============================================================

## 1.1 06.demand-forecasting status
allowed_status:
- draft
- calculated
- adjusted
- review_pending
- frozen_candidate
- superseded
- cancelled

rules:
- calculated = system/statistical baseline prepared
- adjusted = planner edits and override trace attached
- frozen_candidate = handoff-ready immutable package
- superseded = newer version exists
- frozen_candidate may not return to draft in place

## 1.2 07.sop-consensus status
allowed_status:
- intake_pending
- scenario_preparing
- review_in_progress
- issue_open
- executive_review
- approved_freeze
- rejected
- superseded

rules:
- intake_pending starts from 06 frozen candidate
- issue_open means unresolved issue register is active
- approved_freeze is immutable
- approved_freeze with unresolved items requires accepted_risk trace

## 1.3 16.production-planning status
allowed_status:
- awaiting_consensus_input
- plan_generating
- feasibility_review
- release_pending
- released
- replanning_required
- superseded

rules:
- released is execution handoff-ready
- replanning_required does not alter prior released version in place
- new executable version must be issued when replanning is approved

## 1.4 60.business-intelligence status
allowed_status:
- definition_draft
- snapshot_ready
- dashboard_published
- executive_summary_published
- refresh_pending
- retired

rules:
- dashboard_published is not business approval
- refresh_pending means source snapshot refresh is needed
- BI published state does not imply source truth changed

# ============================================================
# 2. HANDOFF GATES
# ============================================================

| from | to | gate_name | required_condition | immutable_after_gate |
|---|---|---|---|---|
| 06 | 07 | forecast_candidate_gate | frozen_candidate + override_trace complete | yes |
| 07 | 16 | consensus_freeze_gate | approved_freeze + executive decision reference | yes |
| 16 | 15 | executable_release_gate | released + feasibility checks complete | yes |
| source modules | 60 | analytical_snapshot_gate | approved read model or snapshot basis declared | snapshot immutable |

# ============================================================
# 3. MINIMUM TRACE FIELDS
# ============================================================

common_trace_fields:
- object_id
- version_id
- predecessor_version_id
- successor_version_id
- status
- changed_by
- changed_at
- change_reason
- source_module
- snapshot_or_freeze_reference if applicable

06_specific_trace:
- override_reason
- override_actor
- override_at
- assumption_reference

07_specific_trace:
- issue_register_reference
- accepted_risk_reference
- executive_decision_reference

16_specific_trace:
- feasibility_result_reference
- capacity_exception_reference
- material_exception_reference
- release_reference

60_specific_trace:
- dataset_snapshot_id
- source_module_reference
- source_version_reference
- refresh_executed_at

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- BI dashboard number copied back as source truth without formal module workflow
- 07 editing 06 frozen candidate in place
- 16 editing 07 approved freeze in place
- 15 actuals overwriting 16 released plan history
- CommonOS component state treated as business canon

# ============================================================
# 5. REVIEW CHECKLIST
# ============================================================

review_checklist:
- Is source truth owner explicit?
- Is freeze point explicit?
- Is immutable rule explicit?
- Is new-version rule explicit?
- Is BI only consuming projection/snapshot basis?
- Is accepted_risk required when freezing unresolved consensus?
- Is override trace required for manual demand changes?
- Is released plan separated from execution actuals?

completion_state:
- cross-module status and gate matrix fixed
- handoff shortcut violations made explicit

# ============================================================
