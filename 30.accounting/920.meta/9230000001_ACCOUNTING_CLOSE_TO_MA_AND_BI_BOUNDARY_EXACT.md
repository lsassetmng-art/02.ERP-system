# ============================================================
# ACCOUNTING CLOSE TO MA AND BI BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 30.accounting
related_modules:
- 31.management-accounting
- 60.business-intelligence

purpose:
Define the statutory accounting close boundary and how accounting close outputs
may be consumed by management accounting and BI without transferring accounting
truth ownership.

canonical_role:
- statutory / financial accounting truth

# ============================================================
# 1. CORE ACCOUNTING CLOSE OBJECTS
# ============================================================

core_objects:
- accounting_period
- gl_journal
- gl_posting_batch
- trial_balance
- accounting_close_package
- accounting_adjustment_journal
- accounting_close_reopen_request
- statutory_report_basis
- accounting_close_audit_trail

# ============================================================
# 2. ACCOUNTING CLOSE PACKAGE
# ============================================================

object_name:
- accounting_close_package

meaning:
- canonical statutory accounting close package for a fiscal period

required_fields:
- accounting_close_package_id
- company_id
- fiscal_period
- ledger_id
- close_status
- trial_balance_reference
- gl_journal_set_reference
- adjustment_journal_set_reference
- subledger_reconciliation_reference_set
- close_check_result_reference
- close_started_at
- close_completed_at_or_null
- closed_by_or_null
- locked_at_or_null
- locked_by_or_null
- reopened_from_package_id_or_null
- superseded_by_package_id_or_null
- lineage_reference

allowed_close_status:
- open
- pre_close
- close_review
- closed
- locked
- reopened
- superseded

rules:
- closed package is controlled
- locked package is immutable
- correction after lock requires reopen or adjustment workflow
- package lineage must remain queryable

# ============================================================
# 3. OUTPUT TO 31 MANAGEMENT ACCOUNTING
# ============================================================

handoff_object_name:
- accounting_close_to_ma_handoff

meaning:
- controlled handoff of accounting close basis to management accounting

required_fields:
- handoff_id
- company_id
- source_module
- target_module
- accounting_close_package_id
- fiscal_period
- ledger_id
- trial_balance_reference
- accounting_actuals_reference
- adjustment_journal_summary_reference
- source_cutoff_at
- close_status_at_handoff
- handoff_created_at
- handoff_created_by
- lineage_reference
- handoff_status

allowed_handoff_status:
- draft
- validation_pending
- handoff_ready
- accepted_by_ma
- rejected_by_ma
- superseded

rules:
- source_module must be 30.accounting
- target_module must be 31.management-accounting
- 31 may consume handoff as accounting actual basis
- 31 may not mutate accounting_close_package
- correction must return to 30 accounting workflow

# ============================================================
# 4. OUTPUT TO 60 BI
# ============================================================

BI_consumable_outputs:
- trial_balance_snapshot_basis
- accounting_close_package_snapshot_basis
- statutory_report_basis
- accounting_close_status
- adjustment_journal_summary
- close_check_result_summary

rules:
- 60 consumes through BI dataset snapshot
- 60 must preserve source close package lineage
- 60 may not approve close
- 60 may not correct close package
- 60 must show stale state when source close changes after snapshot

# ============================================================
# 5. REOPEN / CORRECTION
# ============================================================

reopen_object_name:
- accounting_close_reopen_request

required_fields:
- reopen_request_id
- company_id
- accounting_close_package_id
- fiscal_period
- reopen_reason
- requested_by
- requested_at
- approval_reference
- reopen_status
- resulting_package_id_or_null

allowed_reopen_status:
- requested
- review_pending
- approved
- rejected
- executed
- cancelled

rules:
- reopen belongs to 30.accounting
- 31 and 60 may receive notification
- 31 may decide whether managerial close must reopen
- 60 may refresh snapshots
- 31 and 60 may not execute accounting reopen

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- 31 directly creating GL adjustment journal
- 60 directly creating GL adjustment journal
- BI dashboard refresh reopening accounting period
- managerial close approval locking statutory accounting close
- accounting close package silently overwritten after lock
- trial balance corrected outside 30 workflow

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_test:
- If it is GL / ledger / statutory close truth, 30 owns it.
- If it is internal interpretation of accounting actuals, 31 owns it.
- If it is a dashboard or snapshot, 60 owns projection only.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- 30 accounting close boundary fixed
- 30 to 31 handoff fixed
- 30 to 60 reporting boundary fixed
- correction and reopen ownership fixed

# ============================================================
