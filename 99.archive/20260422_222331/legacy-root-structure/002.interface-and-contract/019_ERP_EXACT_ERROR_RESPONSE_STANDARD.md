# ============================================================
# ERP EXACT ERROR RESPONSE STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the common standard for exact ERP error responses.

goals:
- standardize error payloads
- support machine readability and human review
- distinguish retriable and non-retriable errors

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
ERP error responses must be explicit, structured, and scope-aware.

# ============================================================
# 2. COMMON ERROR RESPONSE FIELDS
# ============================================================

common_error_response_fields:
- correlation_id
- errors

error_item_fields:
- error_code
- error_message
- error_category
- retriable

optional_fields:
- target_field
- target_ref
- details
- blocking_reason_code

# ============================================================
# 3. ERROR CATEGORY EXAMPLES
# ============================================================

error_categories:
- request_validation
- permission
- lookup
- policy
- conflict
- execution
- downstream
- unknown

# ============================================================
# 4. RETRIABLE RULE
# ============================================================

retriable_rule:
Every important error should explicitly say whether retry is reasonable.

examples:
- invalid filter -> retriable false
- temporary downstream timeout -> retriable true
- permission denied -> retriable false by same caller context

# ============================================================
# 5. MULTI-ERROR RULE
# ============================================================

multi_error_rule:
When multiple issues apply, return structured error array
instead of collapsing into one vague message.

# ============================================================
# 6. WARNING VS ERROR RULE
# ============================================================

warning_vs_error_rule:
Warnings indicate successful or partially successful handling with caveats.
Errors indicate failed or rejected handling in the relevant scope.

# ============================================================
# 7. CONCLUSION
# ============================================================

conclusion:
ERP exact error responses must be structured, categorized,
and retry-aware.

This document becomes the formal basis for:
- API error response design
- contract review
- operational debugging consistency
