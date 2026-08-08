# ============================================================
# ERP EXACT QUERY RESPONSE STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the common standard for exact ERP query responses.

goals:
- standardize query response structure
- separate current state, related summaries, and warnings
- support list/detail/dashboard query consistency

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
A query response should expose current truth and related summaries,
not mutation semantics.

# ============================================================
# 2. COMMON QUERY RESPONSE BLOCKS
# ============================================================

common_query_response_blocks:
- correlation_block
- identity_block
- current_state_block
- related_summary_block
- pagination_block when list query
- warnings_errors_block

# ============================================================
# 3. DETAIL QUERY RULE
# ============================================================

detail_query_rule:
Detail queries should return:
- primary identity
- current state fields
- authoritative amounts/dates if applicable
- related summaries
- warnings

# ============================================================
# 4. LIST QUERY RULE
# ============================================================

list_query_rule:
List queries should return:
- items
- next_cursor
- warnings

items should contain:
- identifier
- concise current state
- essential summary only

# ============================================================
# 5. DASHBOARD QUERY RULE
# ============================================================

dashboard_query_rule:
Dashboard queries should return:
- freshness information
- section summaries
- warnings

dashboard must not imply source-of-truth equality at all times.

# ============================================================
# 6. FIELD RULES
# ============================================================

preferred_fields:
- correlation_id
- items
- next_cursor
- warnings
- errors
- lifecycle_state
- approval_status
- execution_status
- settlement_status
- period_status
- freshness

avoid:
- status
without family qualifier

# ============================================================
# 7. CONCLUSION
# ============================================================

conclusion:
ERP exact query responses must prioritize explicit current truth,
clear summaries, and pagination/freshness discipline.
