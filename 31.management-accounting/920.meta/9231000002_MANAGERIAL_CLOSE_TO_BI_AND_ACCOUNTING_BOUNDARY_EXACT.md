# ============================================================
# MANAGERIAL CLOSE TO BI AND ACCOUNTING BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 31.management-accounting
related_modules:
- 30.accounting
- 60.business-intelligence

purpose:
Define managerial close ownership and how managerial close outputs are fed to BI
while preserving accounting source truth in 30.accounting.

canonical_role:
- internal managerial close and management reporting truth

# ============================================================
# 1. CORE MANAGERIAL CLOSE OBJECTS
# ============================================================

core_objects:
- ma_managerial_close_package
- ma_budget_actual_package
- ma_profitability_view
- ma_responsibility_center_report
- ma_variance_analysis_package
- ma_allocation_run
- ma_management_report_package
- ma_close_reopen_request

# ============================================================
# 2. MANAGERIAL CLOSE PACKAGE
# ============================================================

object_name:
- ma_managerial_close_package

meaning:
- canonical internal management accounting close package

required_fields:
- managerial_close_package_id
- company_id
- fiscal_period
- management_view_id_set
- included_budget_actual_package_set
- included_profitability_view_set
- included_responsibility_center_report_set
- included_variance_package_set
- source_accounting_close_package_reference_or_null
- source_cutoff_at
- close_status
- approved_flag
- approved_at_or_null
- approved_by_or_null
- frozen_at_or_null
- frozen_by_or_null
- reopened_from_package_id_or_null
- superseded_by_package_id_or_null
- lineage_reference

allowed_close_status:
- preparing
- review_pending
- approved
- frozen
- reopened
- superseded
- cancelled

rules:
- frozen managerial close is immutable
- change after freeze requires reopen or successor package
- source accounting lineage must remain visible
- managerial close does not lock statutory accounting close

# ============================================================
# 3. INPUT FROM 30 ACCOUNTING
# ============================================================

input_object_name:
- accounting_close_to_ma_handoff

acceptance_requires:
- source_module = 30.accounting
- target_module = 31.management-accounting
- accounting_close_package_id present
- fiscal_period resolvable
- trial_balance_reference present
- lineage_reference present
- close_status_at_handoff declared

rules:
- accepted accounting handoff becomes MA input basis
- MA may interpret / allocate / analyze
- MA may not modify source accounting package
- accounting correction must return to 30 workflow

# ============================================================
# 4. OUTPUT TO 60 BI
# ============================================================

BI_consumable_outputs:
- managerial_close_package_snapshot_basis
- budget_actual_package_snapshot_basis
- profitability_view_snapshot_basis
- responsibility_center_report_snapshot_basis
- variance_analysis_package_snapshot_basis
- allocation_run_snapshot_basis
- management_report_package_snapshot_basis

rules:
- 60 consumes via dataset snapshot
- 60 must show source managerial close package version
- 60 may not approve managerial close
- 60 may not reopen managerial close
- 60 may not correct MA allocation or variance package

# ============================================================
# 5. MANAGERIAL REOPEN
# ============================================================

object_name:
- ma_close_reopen_request

required_fields:
- reopen_request_id
- company_id
- managerial_close_package_id
- fiscal_period
- reopen_reason
- triggered_by_source_change_flag
- source_accounting_reopen_reference_or_null
- requested_by
- requested_at
- approval_reference_or_null
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
- source accounting reopen may trigger MA reopen review
- MA decides whether managerial close must reopen
- BI refresh never equals MA reopen
- MA reopen does not itself reopen 30 accounting close

# ============================================================
# 6. REPORT PACKAGE
# ============================================================

object_name:
- ma_management_report_package

required_fields:
- management_report_package_id
- company_id
- fiscal_period
- report_type
- management_view_id
- source_managerial_close_package_id
- included_section_set
- report_status
- approved_flag
- published_at_or_null
- lineage_reference

report_type_examples:
- executive_management_report
- responsibility_center_report
- profitability_report
- budget_actual_report
- variance_review_report

rules:
- report package is MA truth when used for internal management reporting
- BI may render projection from report package
- BI rendered dashboard is not the report approval source

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- MA correcting GL journal
- MA silently changing accounting actual basis
- BI publishing dashboard as MA approval
- BI changing allocation run result
- accounting close lock automatically freezing MA close without MA workflow
- MA reopen automatically reopening accounting close

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_test:
- If it is internal managerial close or management report package, 31 owns it.
- If it is statutory accounting close, 30 owns it.
- If it is dashboard projection, 60 owns projection only.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- managerial close exact design fixed
- accounting input boundary fixed
- BI output boundary fixed
- managerial reopen ownership fixed

# ============================================================
