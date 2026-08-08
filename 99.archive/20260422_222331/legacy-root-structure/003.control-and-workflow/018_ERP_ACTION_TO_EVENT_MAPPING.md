# ============================================================
# ERP ACTION TO EVENT MAPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines canonical mapping rules between actions and emitted events in ERP.

goals:
- define how actions relate to events
- prevent action/event confusion
- support event design and exact contract documentation

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
An action may emit zero, one, or multiple events.
An event is not the same thing as the action itself.

mapping_patterns:
- one_action -> one_event
- one_action -> multiple_events
- one_action -> zero_immediate_events
- one_action -> async_events_later

# ============================================================
# 2. CANONICAL MAPPINGS
# ============================================================

canonical_mappings:

  submit:
    likely_events:
    - document_submitted

  withdraw:
    likely_events:
    - document_withdrawn

  resubmit:
    likely_events:
    - document_resubmitted

  approve:
    likely_events:
    - approval_approved

  reject:
    likely_events:
    - approval_rejected

  return:
    likely_events:
    - approval_returned

  retry:
    likely_events:
    - execution_retried
    - possibly execution_queued later

  create_settlement:
    likely_events:
    - settlement_applied
    - possibly receivable_settled/payable_settled later

  post_journal:
    likely_events:
    - journal_posted

  close_period:
    likely_events:
    - accounting_period_closed

  accept_reopen_request:
    likely_events:
    - governance_request_accepted
    - possibly accounting_period_reopened later if separate scope

# ============================================================
# 3. ACTION TO EVENT RULES
# ============================================================

rules:
- action accepted does not require all potential downstream events to happen synchronously
- emitted event ownership follows event semantic ownership
- action contracts must declare whether events are sync, async, optional, or internal_only
- absence of immediate event in response does not mean no event will exist later

# ============================================================
# 4. ZERO-EVENT CASE
# ============================================================

zero_event_case:
Some actions may record state or control change without publishing a business-visible event immediately.

examples:
- internal scheduler maintenance action
- cache invalidation action
- internal delivery retry bookkeeping

# ============================================================
# 5. MULTI-EVENT CASE
# ============================================================

multi_event_case:
One action may emit a primary event and additional secondary events.

examples:
- create_settlement may emit settlement_applied and later receivable_settled
- approve may emit approval_approved and later workflow_step_completed
- close_period may emit accounting_period_closed and later report_generation triggers

# ============================================================
# 6. ASYNC RULE
# ============================================================

async_rule:
Contracts must distinguish:
- emitted now
- scheduled for later emission
- internal-only event consequences

recommended_contract_fields:
- emitted_events
- scheduled_events
- internal_event_note

# ============================================================
# 7. VALIDATION RULES
# ============================================================

validation_rules:
- every major action should have mapped likely events
- mapping should declare sync vs async where relevant
- action docs must not claim event certainty beyond scope

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
ERP actions and events must be mapped explicitly but kept separate.

This document becomes the formal basis for:
- action/event documentation
- event emission notes in contracts
- workflow/event linkage design
