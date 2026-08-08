# ============================================================
# ERP REQUEST ACCEPTANCE CONTRACT RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical rule for request acceptance semantics in ERP contracts.

goals:
- define what acceptance means
- separate acceptance from business completion
- standardize acceptance wording
- reduce contract ambiguity

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Acceptance is request-scope meaning only,
unless the contract explicitly declares broader guarantees.

acceptance_must_not_default_to:
- approved
- finalized
- posted
- settled
- completed
- delivered
- externally synchronized

# ============================================================
# 2. CANONICAL ACCEPTANCE WORDING
# ============================================================

recommended_acceptance_values:
- received
- accepted_for_processing
- accepted_for_review
- mapped
- completed_for_request_scope
- rejected

wording_rules:
- use accepted_for_processing when normal handling begins
- use accepted_for_review when governance/approval review begins
- use mapped when request is mapped to target record
- use completed_for_request_scope only when request handling itself is done

avoid:
- success
- completed
- done
- processed
without scope qualifier

# ============================================================
# 3. ACCEPTANCE EXAMPLES
# ============================================================

invoice_generation_request:
- accepted_for_processing
does_not_mean:
- invoice finalized
- receivable recorded
- delivered

reopen_request:
- accepted_for_review
does_not_mean:
- period reopened

cancel_request:
- accepted_for_review
does_not_mean:
- document cancelled

purchase_request:
- mapped
does_not_mean:
- approved
- ordered
- received

# ============================================================
# 4. CONTRACT FIELD RULE
# ============================================================

contract_field_rule:
Contracts should use explicit acceptance fields.

recommended_fields:
- acceptance_status
- request_status
- review_required
- mapped_record_id
- mapped_record_type
- warnings
- errors

avoid_fields:
- status
when it is unclear whether the status means request, action, or domain state

# ============================================================
# 5. ACCEPTANCE VS ACTION RULE
# ============================================================

acceptance_vs_action_rule:
Request acceptance is not the same thing as action acceptance.

examples:
- request accepted_for_review
- later governance action accepted
- later business action completed

rule:
Different scopes must be modeled separately.

# ============================================================
# 6. ACCEPTANCE VS STATE RULE
# ============================================================

acceptance_vs_state_rule:
Acceptance is request handling meaning.
State is current domain truth.

examples:
- acceptance_status = accepted_for_processing
- lifecycle_state = draft

- acceptance_status = accepted_for_review
- period_status = closed

# ============================================================
# 7. ACCEPTANCE VS EVENT RULE
# ============================================================

acceptance_vs_event_rule:
Acceptance may emit events, but acceptance itself is not the whole event model.

examples:
- acceptance may lead to request_received
- acceptance may lead to request_accepted_for_processing
- acceptance does not imply later completion events

# ============================================================
# 8. RESPONSE WRITING RULE
# ============================================================

response_writing_rule:
Every acceptance response must make scope explicit.

good_examples:
- accepted_for_processing
- accepted_for_review
- completed_for_request_scope

bad_examples:
- completed
- success
- processed
without explicit scope

# ============================================================
# 9. VALIDATION RULES
# ============================================================

validation_rules:
- every request contract must define acceptance meaning
- every acceptance value must list non-goals
- acceptance wording must be scope-qualified
- acceptance must be distinguished from domain state in payloads

# ============================================================
# 10. CONCLUSION
# ============================================================

conclusion:
ERP request acceptance must be scope-qualified and explicit.

Key rules:
- acceptance is request-scope only by default
- acceptance never implies final business completion unless explicitly declared
- wording must be precise and non-ambiguous

This document becomes the formal basis for:
- intake response wording
- request API exact contracts
- acceptance semantics across ERP
