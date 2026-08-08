# ============================================================
# ERP ACTION TO STATE TRANSITION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines canonical rules for how actions cause authoritative state transitions in ERP.

goals:
- define action-driven state transition rules
- separate action result from resulting state
- prevent unauthorized or cross-module state mutation

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
An action may cause a state transition only in the state family
owned by the module that authorizes that mutation.

state_transition_rule:
- action owner must have mutation authority
- resulting state family must be explicit
- resulting state must be distinct from action result

# ============================================================
# 2. CANONICAL PATTERNS
# ============================================================

canonical_patterns:

  submit:
    state_family: document_lifecycle_state
    transition:
    - draft -> submitted

  withdraw:
    state_family: document_lifecycle_state
    transition:
    - submitted/under_review_context -> withdrawn

  resubmit:
    state_family: document_lifecycle_state
    transition:
    - returned -> submitted

  approve:
    state_family: approval_state
    transition:
    - under_approval -> approved

  reject:
    state_family: approval_state
    transition:
    - under_approval -> rejected

  return:
    state_family: approval_state
    transition:
    - under_approval -> returned

  retry:
    state_family: execution_state
    transition:
    - failed/dead_lettered -> retry_waiting or queued

  create_settlement:
    state_family: settlement_state
    transition:
    - none -> applied or partially_applied

  post_journal:
    state_family: accounting_record_state
    transition:
    - validated/draft -> posted

  close_period:
    state_family: period_state
    transition:
    - open -> closed

# ============================================================
# 3. RULES
# ============================================================

rules:
- one action may affect multiple related entities, but each state family transition must remain explicit
- resulting state must be named by family
- action result must not stand in for state transition
- non-owning modules must not directly mutate authoritative state

# ============================================================
# 4. MULTI-ENTITY TRANSITION RULE
# ============================================================

multi_entity_rule:
Some actions may affect multiple entities.

examples:
- create_settlement may affect settlement_state and AR/AP balance_state
- approve may affect approval_state first, then allow later business progression
- close_period may affect period_state and block future posting actions

rule:
Each affected entity/state family must be modeled separately.

# ============================================================
# 5. INVALID TRANSITION RULE
# ============================================================

invalid_transitions:
- analytics module mutating business lifecycle state
- dashboard refresh mutating approval status
- approval module mutating journal_status directly
- governance request submission mutating cancelled/open directly without proper acceptance/execution flow

# ============================================================
# 6. API CONSEQUENCES
# ============================================================

api_rules:
- action responses should state resulting state family clearly
- use explicit fields:
  - resulting_lifecycle_state
  - resulting_approval_status
  - resulting_execution_status
  - resulting_settlement_status
  - resulting_period_status

avoid:
- generic resulting_status when multiple state families exist

# ============================================================
# 7. VALIDATION RULES
# ============================================================

validation_rules:
- each action contract should define expected state transitions
- state family must be declared
- disallowed assumptions must be documented
- cross-entity effects must be explicit

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
ERP action-driven state transitions must be explicit, state-family-aware, and owner-controlled.

This document becomes the formal basis for:
- workflow state machine design
- mutation contract design
- authorization-aware transition design
