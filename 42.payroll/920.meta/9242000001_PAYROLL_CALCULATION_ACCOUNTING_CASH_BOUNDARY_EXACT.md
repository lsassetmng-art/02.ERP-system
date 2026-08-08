# ============================================================
# PAYROLL CALCULATION / ACCOUNTING / CASH BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 42.payroll
related_modules:
- 40.human-resources
- 41.labor-management
- 30.accounting
- 34.cash-management
- 50.approval
- 51.audit
- 60.business-intelligence

purpose:
Define payroll calculation, payslip, payroll adjustment, and handoff boundaries
to accounting and cash management without taking over HR master, labor result,
GL journal, or payment execution truth.

canonical_role:
- payroll calculation / payslip / wage payment basis truth

# ============================================================
# 1. CORE PAYROLL OBJECTS
# ============================================================

core_objects:
- payroll_employee_profile_intake
- payroll_time_pay_basis_intake
- payroll_cycle
- payroll_calculation_run
- payroll_calculation_line
- payroll_earning_line
- payroll_deduction_line
- payroll_tax_social_basis
- payroll_adjustment
- payroll_payslip
- payroll_approval_package
- payroll_close_package
- payroll_to_accounting_posting_basis
- payroll_to_cash_payment_basis

# ============================================================
# 2. INPUTS FROM HR AND LABOR
# ============================================================

accepted_input_objects:
- hr_to_payroll_employee_payroll_profile_snapshot
- labor_to_payroll_time_pay_basis

HR_profile_acceptance_requires:
- source_module = 40.human-resources
- target_module = 42.payroll
- worker_id present
- employment_status payroll-eligible
- compensation_basis_reference present
- payroll_frequency present
- lineage_reference present

labor_basis_acceptance_requires:
- source_module = 41.labor-management
- target_module = 42.payroll
- worker_id present
- payroll period valid
- approved_work_result_reference present
- payroll_eligible_flag declared
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- WORKER_UNRESOLVABLE
- EMPLOYMENT_NOT_PAYROLL_ELIGIBLE
- COMPENSATION_BASIS_MISSING
- PAYROLL_PERIOD_MISMATCH
- WORK_RESULT_NOT_APPROVED
- TIME_BASIS_MISSING
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_INPUT

rules:
- payroll consumes HR and labor basis
- payroll does not modify HR or labor source truth
- source correction requires new snapshot/basis and payroll recalculation workflow

# ============================================================
# 3. PAYROLL CYCLE
# ============================================================

object_name:
- payroll_cycle

required_fields:
- payroll_cycle_id
- company_id
- payroll_period_start
- payroll_period_end
- payroll_frequency
- payroll_group_or_null
- cycle_status
- input_cutoff_at_or_null
- calculation_started_at_or_null
- calculation_completed_at_or_null
- approved_at_or_null
- approved_by_or_null
- closed_at_or_null
- closed_by_or_null
- lineage_reference

allowed_cycle_status:
- preparing
- input_collecting
- calculation_ready
- calculating
- calculation_completed
- review_pending
- approved
- closed
- reopened
- cancelled
- superseded

rules:
- payroll cycle belongs to 42
- closed payroll cycle is controlled
- correction after close requires reopen or adjustment workflow
- payroll close does not equal accounting close

# ============================================================
# 4. PAYROLL CALCULATION RUN
# ============================================================

object_name:
- payroll_calculation_run

meaning:
- canonical payroll calculation execution for payroll cycle

required_fields:
- payroll_calculation_run_id
- company_id
- payroll_cycle_id
- run_type
- run_status
- input_hr_profile_snapshot_set
- input_time_pay_basis_set
- calculation_rule_version_reference
- calculated_worker_count
- warning_count
- error_count
- started_at
- completed_at_or_null
- run_by_system_actor
- superseded_by_run_id_or_null
- lineage_reference

run_type_examples:
- regular
- bonus
- offcycle
- correction
- termination
- retroactive

allowed_run_status:
- queued
- running
- completed
- completed_with_warning
- failed
- cancelled
- superseded

rules:
- completed run is immutable
- correction requires successor run or adjustment
- failed run must retain evidence
- calculation run does not post accounting journal directly

# ============================================================
# 5. PAYROLL CALCULATION LINES
# ============================================================

object_name:
- payroll_earning_line

required_fields:
- earning_line_id
- payroll_calculation_run_id
- worker_id
- earning_type
- source_basis_reference
- quantity_or_minutes_or_null
- rate_or_amount_basis_or_null
- calculated_amount
- currency_code
- taxable_flag
- accounting_mapping_reference_or_null
- line_status
- lineage_reference

earning_type_examples:
- base_salary
- hourly_wage
- overtime
- night_shift
- holiday_work
- allowance
- bonus
- paid_leave
- adjustment_earning

object_name:
- payroll_deduction_line

required_fields:
- deduction_line_id
- payroll_calculation_run_id
- worker_id
- deduction_type
- source_basis_reference_or_null
- calculated_amount
- currency_code
- statutory_flag
- accounting_mapping_reference_or_null
- line_status
- lineage_reference

deduction_type_examples:
- income_tax
- residence_tax
- social_insurance
- employment_insurance
- pension
- advance_repayment
- other_deduction
- adjustment_deduction

rules:
- earning / deduction lines are payroll truth
- source basis references must remain traceable
- payroll line does not rewrite HR compensation or labor attendance

# ============================================================
# 6. PAYSLIP
# ============================================================

object_name:
- payroll_payslip

meaning:
- employee-facing payroll statement generated from payroll calculation

required_fields:
- payslip_id
- company_id
- payroll_cycle_id
- payroll_calculation_run_id
- worker_id
- payslip_status
- gross_pay_amount
- total_deduction_amount
- net_pay_amount
- currency_code
- earning_line_set_reference
- deduction_line_set_reference
- issued_at_or_null
- issued_by_or_null
- correction_of_payslip_id_or_null
- lineage_reference

allowed_payslip_status:
- draft
- review_pending
- approved
- issued
- corrected
- cancelled
- superseded

rules:
- payslip belongs to 42
- payslip issue does not equal cash payment completion
- correction requires payroll adjustment / recalculation workflow

# ============================================================
# 7. PAYROLL ADJUSTMENT
# ============================================================

object_name:
- payroll_adjustment

required_fields:
- payroll_adjustment_id
- company_id
- worker_id
- payroll_cycle_id_or_null
- adjustment_type
- adjustment_reason
- amount
- currency_code
- source_reference_or_null
- approval_reference_or_null
- adjustment_status
- created_at
- created_by
- lineage_reference

adjustment_type_examples:
- retroactive_pay
- underpayment_correction
- overpayment_recovery
- tax_correction
- deduction_correction
- attendance_correction_pay_effect
- manual_adjustment

allowed_adjustment_status:
- draft
- approval_pending
- approved
- applied
- rejected
- cancelled
- superseded

rules:
- adjustment changes payroll truth
- source attendance or HR correction must remain in source module
- accounting/cash impacts require downstream handoff

# ============================================================
# 8. PAYROLL CLOSE PACKAGE
# ============================================================

object_name:
- payroll_close_package

required_fields:
- payroll_close_package_id
- company_id
- payroll_cycle_id
- payroll_calculation_run_id
- included_worker_count
- gross_pay_total
- deduction_total
- net_pay_total
- approval_reference
- close_status
- closed_at_or_null
- closed_by_or_null
- reopened_from_package_id_or_null
- superseded_by_package_id_or_null
- lineage_reference

allowed_close_status:
- preparing
- review_pending
- approved
- closed
- reopened
- cancelled
- superseded

rules:
- closed payroll package is controlled
- correction after close requires reopen / adjustment / successor package
- payroll close does not directly post GL or execute cash payment

# ============================================================
# 9. PAYROLL TO ACCOUNTING POSTING BASIS
# ============================================================

handoff_object_name:
- payroll_to_accounting_posting_basis

meaning:
- payroll accounting basis sent to 30.accounting

required_fields:
- payroll_posting_basis_id
- company_id
- source_module
- target_module
- payroll_cycle_id
- payroll_close_package_id
- posting_period
- gross_pay_total
- employer_cost_total_or_null
- deduction_liability_total
- net_pay_total
- accounting_mapping_summary
- posting_line_basis_set
- posting_basis_status
- created_at
- created_by
- lineage_reference

allowed_posting_basis_status:
- building
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

rules:
- source_module must be 42.payroll
- target_module must be 30.accounting
- posting basis is not GL journal
- 30.accounting owns journal posting
- rejection requires payroll correction/resend workflow

# ============================================================
# 10. PAYROLL TO CASH PAYMENT BASIS
# ============================================================

handoff_object_name:
- payroll_to_cash_payment_basis

meaning:
- payroll net payment basis sent to 34.cash-management

required_fields:
- payroll_payment_basis_id
- company_id
- source_module
- target_module
- payroll_cycle_id
- payroll_close_package_id
- payment_date
- currency_code
- payment_line_set
- total_payment_amount
- payment_basis_status
- created_at
- created_by
- lineage_reference

payment_line_required_fields:
- payment_line_id
- worker_id
- payslip_id
- net_pay_amount
- currency_code
- payment_method
- bank_account_reference_or_null
- payment_hold_flag
- payment_note_or_null

allowed_payment_basis_status:
- building
- handoff_ready
- sent_to_cash_management
- accepted_by_cash_management
- rejected_by_cash_management
- payment_executed
- cancelled
- superseded

rules:
- source_module must be 42.payroll
- target_module must be 34.cash-management
- payment basis is not bank transfer execution
- 34.cash-management owns cash execution and payment status
- payment rejection requires payroll/cash review workflow

# ============================================================
# 11. OUTPUT TO BI / AUDIT / APPROVAL
# ============================================================

BI_consumable_outputs:
- payroll cycle snapshot
- payroll calculation summary snapshot
- earning / deduction aggregate snapshot
- payslip status snapshot
- payroll close package snapshot
- accounting posting basis status snapshot
- cash payment basis status snapshot

approval_rules:
- 50.approval may approve payroll run / close / adjustment
- approval does not replace payroll source object

audit_rules:
- 51.audit may audit payroll controls and findings
- audit finding does not directly mutate payroll calculation

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- payroll editing HR employment status directly
- payroll editing attendance actuals directly
- payslip issue treated as cash payment execution
- payroll close treated as accounting close
- payroll posting basis treated as GL journal
- payroll payment basis treated as bank transfer completion
- BI dashboard changing payslip amount
- audit finding changing payroll calculation directly

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it calculates pay, deduction, payslip, or payroll close, 42 owns it.
- If it is HR master / compensation basis, 40 owns it.
- If it is attendance / shift / overtime result, 41 owns it.
- If it is GL journal, 30 owns it.
- If it is payment execution, 34 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- payroll exact design fixed
- HR/labor input boundaries fixed
- payslip and adjustment ownership fixed
- payroll to accounting handoff fixed
- payroll to cash payment handoff fixed
- downstream mutation shortcuts forbidden

# ============================================================
