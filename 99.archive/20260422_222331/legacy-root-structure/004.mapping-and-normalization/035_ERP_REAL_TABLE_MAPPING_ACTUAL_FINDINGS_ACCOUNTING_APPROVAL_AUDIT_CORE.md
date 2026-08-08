# ============================================================
# ERP REAL TABLE MAPPING ACTUAL FINDINGS
# ACCOUNTING / APPROVAL / AUDIT / CORE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures actual first findings from the uploaded real ERP table inventory,
focusing on accounting, approval, audit, and core.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. ACCOUNTING ACTUAL FINDINGS
# ============================================================

schema_name:
- accounting

observed_tables:
- account_dictionary
- accounting_candidate
- invoice_period
- journal_candidate
- journal_draft
- paper_send_fee_journal
- revenue_recognition_candidate
- system_control

first_read:
The accounting schema is not composed only of final authoritative tables.
It contains:
- dictionary/support structures
- candidate/draft structures
- specialized journal structures
- system control

canonical implications:
- not every accounting schema table is source_of_truth
- several tables are likely support / staging / transitional
- accounting truth may also exist outside this schema

# ============================================================
# 2. APPROVAL ACTUAL FINDINGS
# ============================================================

schema_name:
- approval

observed_tail_findings:
- saas_plan_limit
- saas_subscription
- saas_usage_daily
- saas_usage_monthly
- stripe_webhook_event
- system_control

first_read:
The approval schema appears mixed.
It likely contains:
- approval-related truth
- SaaS/commercial control structures
- payment/webhook support
- system control tables

canonical implications:
- approval schema cannot be treated as purely 270.approval
- some tables may belong to management/support or even platform/integration concerns
- table-level review is mandatory

# ============================================================
# 3. AUDIT ACTUAL FINDINGS
# ============================================================

schema_name:
- audit

observed_tables:
- approval_log
- approval_notify_queue
- approval_reason_template
- approval_request
- audit_event
- audit_reason_policy
- audit_target_table
- audit_trail_db
- entity_status_history
- event
- exec_audit_event
- ng_event
- notification_channel
- notification_delivery_log
- ops_audit_log
- slack_interaction_log

first_read:
The audit schema is also mixed.
It contains:
- true audit structures
- approval-related structures
- notification-related structures
- event/history structures
- operational logging

canonical implications:
- audit remains structurally platform-owned
- but several tables may actually align semantically with approval, notify, or ops support
- approval_request inside audit is a strong duplicate/mixedness signal

# ============================================================
# 4. CORE ACTUAL FINDINGS
# ============================================================

schema_name:
- core

observed_tables_excerpt:
- accounting_period
- accounts
- admin_user
- app_user
- audit_column_weight
- audit_entity_pk_map
- audit_impact_rule
- audit_trail
- audit_trail_2025_12
- audit_trail_2026_01
- audit_trail_2026_02
- audit_trail_2026_03
- audit_trail_2026_04
- audit_trail_2026_05
- audit_trail_2026_06
- audit_trail_2026_07
- audit_trail_2026_08
- audit_trail_2026_09
- company
- company_license
- company_permission
- company_users
- document_sequence
- entity_attribute_def
- entity_attribute_value
- feature_toggle
- journal_entries
- journal_lines
- journal_source_link
- license_master
- login_history

first_read:
Core is strongly mixed.
It contains:
- shared company/system/platform data
- audit-related structures
- document sequencing
- accounting-related journal and period structures
- auth/user/platform-like structures

canonical implications:
- core must not be mapped wholesale to one canonical module
- accounting truth is physically present outside accounting schema
- audit truth is physically present outside audit schema
- company/platform data is also present here

# ============================================================
# 5. MAIN CONCLUSION
# ============================================================

main_conclusion:
The real ERP database is physically mixed enough that:
- schema name alone is insufficient
- table-level mapping is mandatory
- duplicate truth and transitional structures are likely present
- canonical ownership must be decided table-by-table, not schema-by-schema only
