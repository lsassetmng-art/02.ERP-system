# ============================================================
# ERP ACTION RESULT MODEL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical action result model of ERP.

goals:
- define what action result means
- separate action result from business completion
- standardize action result wording
- support exact contract response design

# ============================================================
# 1. ACTION RESULT DEFINITION
# ============================================================

action_result_definition:
Action result is the formal result of attempting an action
within the scope of that action itself.

core_rule:
Action result is not automatically:
- final business completion
- full downstream completion
- external synchronization success
- accounting finality
- approval completion unless the action itself is approval-scoped

# ============================================================
# 2. CANONICAL ACTION RESULT VALUES
# ============================================================

canonical_action_result_values:
- action_accepted
- action_rejected
- action_failed
- action_partially_applied
- action_deferred
- action_blocked
- action_idempotent_replay

# ============================================================
# 3. VALUE MEANINGS
# ============================================================

action_accepted:
  meaning:
  - the action was accepted in its own scope
  does_not_mean:
  - downstream fully completed
  - all emitted events delivered
  - business finality reached

action_rejected:
  meaning:
  - the action was not accepted in its own scope
  does_not_mean:
  - no audit trace exists
  - request object did not exist

action_failed:
  meaning:
  - the action attempted execution but failed in its own scope
  does_not_mean:
  - all retries are impossible forever

action_partially_applied:
  meaning:
  - part of the action scope applied, with unresolved remainder
  does_not_mean:
  - semantic completion

action_deferred:
  meaning:
  - action handling postponed to later controlled processing

action_blocked:
  meaning:
  - action prevented by policy, authority, or prerequisite failure

action_idempotent_replay:
  meaning:
  - same prior accepted/rejected result replayed due to idempotency

# ============================================================
# 4. ACTION RESULT VS OTHER CONCEPTS
# ============================================================

action_result_vs_state:
- action result tells what happened to the action attempt
- state tells what is currently true

action_result_vs_event:
- action result is response-scope action handling outcome
- event is historical occurrence

action_result_vs_request_status:
- request status tracks request handling
- action result tracks action handling

action_result_vs_business_completion:
- action_accepted does not imply completed business lifecycle

# ============================================================
# 5. FAMILY-SPECIFIC NOTES
# ============================================================

document_progression_actions:
- submit -> action_accepted may yield lifecycle_state=submitted
- withdraw -> action_accepted may yield lifecycle_state=withdrawn
- resubmit -> action_accepted may yield lifecycle_state=submitted

approval_actions:
- approve/reject/return -> action_accepted means approval action recorded
- does not automatically mean business finalized

governance_actions:
- accept_reopen_request -> action_accepted means governance accepted
- does not automatically mean period reopened unless explicitly same-scope

runtime_actions:
- retry -> action_accepted may only mean retry was registered
- does not mean execution_succeeded

accounting_actions:
- create_settlement -> action_accepted may mean settlement created/applied in scope
- does not mean all reporting/dashboard downstream completed

# ============================================================
# 6. RESPONSE FIELD RULE
# ============================================================

recommended_response_fields:
- action_result
- resulting_state
- emitted_event_summary
- downstream_processing_candidate
- warnings
- errors

avoid:
- success
- completed
- done
without scope qualifier

# ============================================================
# 7. NON-GOAL RULE
# ============================================================

every_action_contract_should_define_non_goals:
- what action_accepted does not mean
- what action_failed does not imply
- which downstream outcomes remain outside action scope

# ============================================================
# 8. VALIDATION RULES
# ============================================================

validation_rules:
- every action contract must declare action result semantics
- action result wording must be scope-qualified
- response payload must separate action_result and resulting_state
- downstream completion must be explicitly declared if guaranteed

# ============================================================
# 9. CONCLUSION
# ============================================================

conclusion:
ERP action result must be explicit, scope-qualified, and separate from business completion.

This document becomes the formal basis for:
- mutation API response design
- action response wording
- downstream completion clarification
