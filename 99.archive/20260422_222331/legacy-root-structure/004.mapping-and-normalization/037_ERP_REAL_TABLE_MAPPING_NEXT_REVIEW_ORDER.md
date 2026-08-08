# ============================================================
# ERP REAL TABLE MAPPING NEXT REVIEW ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next review order after the actual mixed-schema findings.

# ============================================================
# 1. NEXT REVIEW ORDER
# ============================================================

recommended_next_review_order:

1. accounting critical tables
- accounting_candidate
- journal_candidate
- journal_draft
- invoice_period
- paper_send_fee_journal
- revenue_recognition_candidate
- system_control

2. core accounting-adjacent tables
- accounting_period
- journal_entries
- journal_lines
- journal_source_link
- document_sequence

3. approval critical tables
- all tables actually named approval_*
- plus saas_* / stripe_webhook_event / system_control for separation review

4. audit critical tables
- approval_request
- approval_log
- audit_event
- audit_trail_db
- entity_status_history
- event
- exec_audit_event
- notification_* tables

# ============================================================
# 2. REVIEW GOAL
# ============================================================

review_goal:
For each reviewed table, determine:
- canonical_layer
- canonical_module
- canonical_table_class
- ownership_confidence
- duplicate_candidate or not
- mixedness or not

# ============================================================
# 3. WHY THIS ORDER
# ============================================================

why_this_order:
This order targets the most obvious mixed and duplicate-risk tables first,
so the biggest semantic conflicts are resolved early.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
After the actual findings, the next best step is not broad schema review,
but targeted table-family review starting with accounting/core/approval/audit overlap.
