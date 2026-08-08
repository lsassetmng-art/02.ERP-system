# ============================================================
# ERP EXACT PAYLOAD NAMING STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines canonical naming rules for exact request and response payload fields in ERP.

goals:
- standardize payload field naming
- reduce ambiguity across modules
- support exact contract consistency
- align payload naming with state/event/request/action separation

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Payload field names must express semantic meaning,
not UI wording, screen wording, or temporary implementation convenience.

naming_priorities:
- semantic clarity
- ownership clarity
- scope clarity
- consistency across ERP
- explicit family naming when ambiguity is likely

# ============================================================
# 2. GENERAL RULES
# ============================================================

general_rules:
- use snake_case
- use singular names for scalar fields
- use plural names for arrays
- use _id for identifiers
- use _code for controlled vocabulary values
- use _status only when the status family is unambiguous
- prefer explicit family names over generic status names
- do not overload one field to mean request, action, state, and event at once

# ============================================================
# 3. IDENTIFIER RULES
# ============================================================

identifier_rules:
- request_id
- document_id
- approval_request_id
- settlement_id
- journal_id
- accounting_period_id
- company_id
- actor_id
- organization_id

avoid:
- id
- target
- ref
without qualifier

# ============================================================
# 4. STATE FAMILY RULES
# ============================================================

state_family_rules:
Use explicit names for state families.

preferred:
- lifecycle_state
- approval_status
- governance_review_state
- execution_status
- settlement_status
- period_status
- dashboard_freshness

avoid:
- status
when multiple meanings are possible

# ============================================================
# 5. REQUEST FIELD RULES
# ============================================================

request_field_rules:
Use explicit request-scope names.

preferred:
- request_status
- acceptance_status
- requested_by
- requested_at
- request_reason_code
- request_reason_text
- mapped_record_id
- mapped_record_type
- review_required

avoid:
- success
- processed
- completed
without request scope

# ============================================================
# 6. ACTION FIELD RULES
# ============================================================

action_field_rules:
Use explicit action-scope names.

preferred:
- action_result
- acted_by
- acted_at
- resulting_lifecycle_state
- resulting_approval_status
- resulting_execution_status
- resulting_settlement_status
- resulting_period_status

avoid:
- result
- outcome
- status
without scope

# ============================================================
# 7. EVENT FIELD RULES
# ============================================================

event_field_rules:
Use explicit event names and event metadata.

preferred:
- event_code
- event_family
- occurred_at
- emitted_events
- scheduled_events
- event_visibility_class

avoid:
- history_status
- log_status
when actual event meaning is intended

# ============================================================
# 8. BOOLEAN RULES
# ============================================================

boolean_rules:
Booleans should read clearly as yes/no conditions.

preferred:
- review_required
- high_risk_flag
- partial_order_allowed_flag
- include_lines
- include_domain_payload

avoid:
- flag
- enabled
without qualifier

# ============================================================
# 9. MONEY / AMOUNT RULES
# ============================================================

money_rules:
- original_amount
- open_amount
- applied_amount
- total_applied_amount
- debit_amount
- credit_amount
- line_amount
- tax_amount

currency_rules:
- currency_code
- settlement_currency_code
- ar_currency_code
- ap_currency_code

# ============================================================
# 10. DATE / TIME RULES
# ============================================================

date_time_rules:
- requested_at
- acted_at
- occurred_at
- created_at
- updated_at
- finalized_at
- posted_at
- closed_at
- due_date
- business_date

# ============================================================
# 11. QUERY PARAMETER RULES
# ============================================================

query_param_rules:
- include_lines
- include_source_links
- include_related_documents
- created_from
- created_to
- applied_from
- applied_to
- limit
- cursor
- company_id

avoid:
- from
- to
- page
when cursor semantics are intended

# ============================================================
# 12. CONCLUSION
# ============================================================

conclusion:
ERP payload names must be semantic, explicit, and family-aware.

This document becomes the formal basis for:
- exact request payload design
- exact response payload design
- API field naming review
