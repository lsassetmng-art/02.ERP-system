# ============================================================
# ERP EXACT RESPONSE FIELD STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the standard structure and naming for ERP exact response payloads.

goals:
- standardize response field composition
- separate request scope, action scope, and state scope
- make exact contract responses consistent across ERP

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Response payloads must expose scope explicitly.

scopes_to_distinguish:
- request scope
- action scope
- resulting current state
- event emission summary
- warnings/errors
- mapping summary

# ============================================================
# 2. STANDARD RESPONSE BLOCKS
# ============================================================

standard_response_blocks:
- correlation block
- identity block
- request handling block
- action handling block
- resulting state block
- mapping block
- event summary block
- warnings/errors block

# ============================================================
# 3. MINIMUM COMMON FIELDS
# ============================================================

minimum_common_fields:
- correlation_id
- warnings
- errors

# ============================================================
# 4. REQUEST RESPONSE FIELDS
# ============================================================

request_response_fields:
- request_id
- request_status
- acceptance_status
- review_required
- mapped_record_id
- mapped_record_type

# ============================================================
# 5. ACTION RESPONSE FIELDS
# ============================================================

action_response_fields:
- action_result
- action_id if recorded
- acted_at if needed
- resulting_lifecycle_state
- resulting_approval_status
- resulting_execution_status
- resulting_settlement_status
- resulting_period_status

# ============================================================
# 6. QUERY RESPONSE FIELDS
# ============================================================

query_response_fields:
- correlation_id
- target identity fields
- current state fields
- related summaries
- warnings
- errors

pagination_fields:
- items
- next_cursor

# ============================================================
# 7. EVENT SUMMARY FIELDS
# ============================================================

event_summary_fields:
- emitted_events
- scheduled_events
- event_visibility_note

rule:
Do not imply sync emission if events are async.

# ============================================================
# 8. WARNING / ERROR RULE
# ============================================================

warning_error_rule:
Warnings and errors must be explicit arrays.

preferred_error_fields:
- error_code
- error_message
- error_category
- retriable

# ============================================================
# 9. AVOID RULE
# ============================================================

avoid:
- status
- success
- done
- completed
without scope qualifier

# ============================================================
# 10. CONCLUSION
# ============================================================

conclusion:
ERP exact responses must be scope-structured and explicit.

This document becomes the formal basis for:
- exact response payload review
- consistent response composition
- action/request/query response design
