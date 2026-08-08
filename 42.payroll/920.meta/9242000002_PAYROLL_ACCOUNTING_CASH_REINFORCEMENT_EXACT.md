# ============================================================
# PAYROLL ACCOUNTING / CASH REINFORCEMENT EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 42.payroll
target_modules:
- 30.accounting
- 34.cash-management

purpose:
Reinforce payroll handoff to accounting and cash management so payroll
calculation, payslip, GL posting, and salary payment execution remain separate.

canonical_role:
- payroll calculation / payslip / payroll close truth

# ============================================================
# 1. ACCOUNTING HANDOFF
# ============================================================

handoff_object_name:
- payroll_to_accounting_payroll_posting_basis

required_fields:
- payroll_posting_basis_id
- company_id
- source_module
- target_module
- payroll_cycle_id
- payroll_close_package_id
- payroll_calculation_run_id
- posting_period
- gross_pay_total
- employer_cost_total_or_null
- deduction_liability_total
- net_pay_total
- currency_code
- payroll_posting_line_basis_set
- posting_basis_status
- created_at
- lineage_reference

payroll_posting_line_basis_required_fields:
- payroll_posting_line_basis_id
- worker_id_or_group_reference
- earning_or_deduction_type
- amount
- currency_code
- account_mapping_reference_or_null
- cost_center_reference_or_null
- department_reference_or_null
- source_payroll_line_reference

allowed_posting_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- corrected
- cancelled
- superseded

rules:
- source_module must be 42.payroll
- target_module must be 30.accounting
- posting basis is not GL journal
- payroll close is not accounting close
- accounting owns GL/AP/liability posting

# ============================================================
# 2. CASH PAYMENT HANDOFF
# ============================================================

handoff_object_name:
- payroll_to_cash_salary_payment_basis

required_fields:
- salary_payment_basis_id
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
- validation_pending
- handoff_ready
- sent_to_cash_management
- accepted_by_cash_management
- rejected_by_cash_management
- scheduled
- payment_executed
- payment_failed
- cancelled
- superseded

rules:
- source_module must be 42.payroll
- target_module must be 34.cash-management
- payslip issued is not salary payment executed
- 34 owns bank execution and rejection
- payroll may update payment status from 34 feedback

# ============================================================
# 3. FEEDBACK RULES
# ============================================================

accounting_feedback_rules:
- accepted feedback may mark payroll posting basis accepted
- posted feedback may mark payroll accounting status posted
- rejected feedback requires payroll correction/resend workflow
- payroll may not edit GL journal

cash_feedback_rules:
- executed feedback may mark payslip/payment line paid
- failed feedback keeps payment unresolved
- partial execution must remain visible
- payroll may not fabricate bank execution

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- payroll close treated as GL posting
- payslip issue treated as bank payment completion
- cash payment execution changing payroll calculation amount directly
- accounting rejection editing payslip directly
- payroll posting basis treated as journal
- BI dashboard changing paid status

# ============================================================
# 5. COMPLETION STATE
# ============================================================

completion_state:
- payroll accounting handoff reinforced
- payroll cash handoff reinforced
- payslip vs payment execution boundary fixed
- payroll close vs accounting close boundary fixed

# ============================================================
