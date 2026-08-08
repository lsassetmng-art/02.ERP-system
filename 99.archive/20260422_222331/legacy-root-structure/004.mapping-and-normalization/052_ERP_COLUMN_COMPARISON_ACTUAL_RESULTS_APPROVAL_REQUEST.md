# ============================================================
# ERP COLUMN COMPARISON ACTUAL RESULTS APPROVAL REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures the actual current findings for approval_request-family tables
based on uploaded schema column data.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED SCHEMAS
# ============================================================

observed_schemas_with_approval_request:
- ai
- audit
- govern
- governance
- notify
- system
- workflow

# ============================================================
# 2. OBSERVED COLUMN DIFFERENCE SIGNALS
# ============================================================

ai.approval_request excerpt:
- approval_id
- company_id
- ai_name
- status
- requested_at
- decided_at
- decided_by

governance.approval_request excerpt:
- request_id
- company_id
- notification_id
- status
- requested_by
- requested_at
- decided_by
- decided_at
- reason

notify.approval_request excerpt:
- approval_request_id
- company_id
- request_type
- entity_id
- title
- detail
- status
- requested_at
- decided_by_line_user_id
- decided_at

main_observation:
approval_request is not one single duplicated table copy.
It appears as multiple semantically related but structurally different table families.

# ============================================================
# 3. ACTUAL JUDGMENT
# ============================================================

actual_judgment:
Current evidence supports:

- not a simple one-table duplicate family
- a broader approval_request-like concept spread across multiple schemas
- some tables may be:
  - approval truth
  - governance/notification request truth
  - AI approval support
  - workflow/system approval support

duplicate confidence:
- medium for shared concept
- low for exact structural duplication

# ============================================================
# 4. CANONICAL CONSEQUENCE
# ============================================================

canonical_consequence:
approval_request-like tables must be split into subfamilies:
- true approval truth
- governance approval/control request
- notify approval request support
- AI approval request support
- workflow/system approval support

This family must not be flattened prematurely into one duplicate table claim.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The actual column data revises the earlier suspicion:
approval_request is a mixed concept family,
not yet proven to be a simple duplicate table family.
