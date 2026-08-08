# ============================================================
# ERP CANONICAL WORKFLOW MODEL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical workflow model of ERP.

goals:
- define workflow as formal orchestration meaning
- separate workflow from approval, governance, and business truth
- define workflow stages and handoff points
- provide a basis for workflow engine and exact contract design

# ============================================================
# 1. WORKFLOW DEFINITION
# ============================================================

workflow_definition:
Workflow is the formal orchestration of how ERP moves work
across requests, actions, states, approvals, governance checks,
runtime executions, and downstream outcomes.

workflow_is_not:
- approval truth itself
- governance truth itself
- business document truth itself
- dashboard truth

core_rule:
Workflow coordinates;
owning modules still own their own truth.

# ============================================================
# 2. CANONICAL WORKFLOW SEGMENTS
# ============================================================

canonical_workflow_segments:
- intake
- mapping
- document_progression
- approval_gate
- governance_gate
- runtime_execution
- business_finalization
- accounting_effect
- reporting_and_analytics_followup

# ============================================================
# 3. HIGH-LEVEL FLOW
# ============================================================

high_level_flow:
- request received
- request accepted/rejected
- mapped to target if applicable
- business document/control record progression
- approval gate if required
- governance gate if required
- runtime execution if required
- business/accounting truth updated by owning modules
- events emitted
- analytics/reporting followup may occur later

# ============================================================
# 4. WORKFLOW OWNERSHIP RULE
# ============================================================

workflow_ownership_rule:
Workflow orchestration belongs structurally to platform/workflow,
while each truth mutation remains owned by its source module.

examples:
- workflow can move an approval step forward
- approval module still owns approval_status
- workflow can schedule retry
- runtime-related modules still own execution_status

# ============================================================
# 5. WORKFLOW STAGE RULES
# ============================================================

intake_stage:
- request is received
- request handling scope starts

mapping_stage:
- request may map to business document, approval record, governance record, or analytics run

document_progression_stage:
- business document lifecycle may move
- submit/withdraw/resubmit/finalize may occur

approval_gate_stage:
- used when approval control is required
- approval truth remains owned by management/approval

governance_gate_stage:
- used when policy/high-risk exception control is required
- governance truth remains owned by management/governance

runtime_execution_stage:
- used for async delivery/execution/retry orchestration

business_finalization_stage:
- business-owned completion meaning may occur

accounting_effect_stage:
- accounting-owned truth may be created/updated

reporting_and_analytics_followup_stage:
- later reporting or analytics updates may occur
- not part of source-of-truth mutation ownership

# ============================================================
# 6. WORKFLOW VS STATE RULE
# ============================================================

workflow_vs_state_rule:
Workflow describes movement and orchestration.
State describes current truth of owned entities.

rule:
Workflow stage must not be treated as a replacement for owned state families.

# ============================================================
# 7. WORKFLOW VS APPROVAL RULE
# ============================================================

workflow_vs_approval_rule:
Workflow may route into and out of approval,
but approval remains its own truth domain.

rule:
Workflow stage cannot replace approval route, lane, or approval status truth.

# ============================================================
# 8. WORKFLOW VS GOVERNANCE RULE
# ============================================================

workflow_vs_governance_rule:
Workflow may invoke governance gates,
but governance remains its own truth domain.

rule:
Workflow stage cannot replace governance exception state.

# ============================================================
# 9. WORKFLOW VS RUNTIME RULE
# ============================================================

workflow_vs_runtime_rule:
Workflow orchestration may schedule or observe runtime execution,
but execution truth remains runtime-related platform ownership.

# ============================================================
# 10. CANONICAL WORKFLOW OUTPUTS
# ============================================================

workflow_outputs:
- route to next stage
- schedule action
- trigger approval gate
- trigger governance gate
- trigger runtime execution
- mark workflow completion
- emit workflow events

# ============================================================
# 11. VALIDATION RULES
# ============================================================

validation_rules:
- workflow stage names must not duplicate owned state names without clarification
- workflow models must identify gate boundaries explicitly
- business truth mutation must remain in owning modules
- approval and governance gates must be modeled distinctly

# ============================================================
# 12. CONCLUSION
# ============================================================

conclusion:
ERP workflow is the canonical orchestration layer for moving work,
but not the owner of business, approval, governance, or accounting truth.

This document becomes the formal basis for:
- workflow engine design
- workflow stage design
- approval/governance gate integration
