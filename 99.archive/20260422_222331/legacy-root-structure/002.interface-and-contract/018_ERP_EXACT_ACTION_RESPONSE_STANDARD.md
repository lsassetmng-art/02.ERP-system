# ============================================================
# ERP EXACT ACTION RESPONSE STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the common standard for exact ERP action responses.

goals:
- standardize mutation/action responses
- separate action result from resulting state
- make downstream uncertainty explicit

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
An action response must expose action-scope result first,
then any resulting current-state information second.

# ============================================================
# 2. COMMON ACTION RESPONSE BLOCKS
# ============================================================

common_action_response_blocks:
- correlation_block
- action_result_block
- target_identity_block
- resulting_state_block
- event_summary_block
- downstream_note_block
- warnings_errors_block

# ============================================================
# 3. REQUIRED ACTION RESPONSE FIELDS
# ============================================================

required_action_response_fields:
- correlation_id
- action_result
- warnings
- errors

recommended_fields:
- target_id
- resulting_lifecycle_state
- resulting_approval_status
- resulting_execution_status
- resulting_settlement_status
- resulting_period_status
- emitted_events
- downstream_processing_candidate

# ============================================================
# 4. ACTION RESULT RULE
# ============================================================

action_result_rule:
Use explicit values such as:
- action_accepted
- action_rejected
- action_failed
- action_blocked
- action_deferred
- action_partially_applied
- action_idempotent_replay

# ============================================================
# 5. DOWNSTREAM RULE
# ============================================================

downstream_rule:
If downstream processing may still occur,
the response should say so explicitly.

good_patterns:
- downstream_processing_candidate: true
- emitted_events: [...]
- warnings: [...]

# ============================================================
# 6. FORBIDDEN RESPONSE WORDING
# ============================================================

forbidden_wording:
- completed
- success
- done
without scope qualifier

# ============================================================
# 7. CONCLUSION
# ============================================================

conclusion:
ERP exact action responses must be action-scope explicit,
state-family explicit, and downstream-aware.
