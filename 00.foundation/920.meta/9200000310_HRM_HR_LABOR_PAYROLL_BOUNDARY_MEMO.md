# ============================================================
# ERP HRM / HR / LABOR / PAYROLL BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 40.human-resources
- 41.labor-management
- 42.payroll
- 30.accounting
- 34.cash-management
- 50.approval
- 51.audit
- 60.business-intelligence

purpose:
Fix the upper boundary across HR master, employment, organization assignment,
attendance, shift, leave, overtime, work results, payroll calculation,
accounting posting, and cash payment so HRM ownership does not drift.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 40.human-resources
canonical_role:
- HR master / employment / organization / assignment truth

owns_truth:
- employee / worker master
- employment contract basis
- hire / termination / retirement state
- department / organization assignment
- position / job assignment
- manager / reporting line assignment
- employee status
- work eligibility basis
- compensation master basis where HR-owned
- HR profile snapshot for labor and payroll
- HR lifecycle event

does_not_own:
- attendance result truth
- shift execution truth
- leave usage truth
- overtime actual truth
- payroll calculation truth
- payslip truth
- payroll payment truth
- accounting journal truth
- BI projection truth

## 1.2 41.labor-management
canonical_role:
- attendance / shift / leave / overtime / work result truth

owns_truth:
- work schedule
- shift plan
- shift assignment
- shift change
- clock-in / clock-out
- attendance record
- break record
- leave request and leave usage
- overtime request and overtime result
- absence / lateness / early leave
- labor correction request
- approved work result
- payroll time basis handoff

does_not_own:
- HR employment master truth
- compensation master truth
- payroll calculation truth
- payslip truth
- payroll payment truth
- accounting journal truth
- BI projection truth

## 1.3 42.payroll
canonical_role:
- payroll calculation / payslip / wage payment basis truth

owns_truth:
- payroll cycle
- payroll calculation run
- earning / deduction calculation
- taxable / non-taxable wage basis
- payroll adjustment
- payslip
- payroll approval package
- payroll closing package
- payroll-to-accounting posting basis
- payroll-to-cash payment basis

does_not_own:
- HR master truth
- employment assignment truth
- attendance actual truth
- shift actual truth
- bank transfer execution truth
- GL journal truth
- BI projection truth

# ============================================================
# 2. CANONICAL HRM FLOW
# ============================================================

canonical_flow:
- 40.human-resources
- -> 41.labor-management
- -> 42.payroll
- -> 30.accounting
- -> 34.cash-management
- -> 60.business-intelligence

flow_meaning:
- 40 defines who works, under what employment and assignment basis.
- 41 records when and how work was scheduled and actually performed.
- 42 calculates payroll from HR and approved labor basis.
- 30 records accounting posting.
- 34 executes / tracks cash payment.
- 60 visualizes only.

approval_and_audit:
- 50.approval may approve HR / labor / payroll workflows.
- 51.audit may audit HR / labor / payroll controls.
- 50 and 51 do not own HR, labor, or payroll source truth.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| employee master | 40.human-resources | HR master truth |
| employment contract basis | 40.human-resources | employment truth |
| department / position assignment | 40.human-resources | organization placement truth |
| work eligibility | 40.human-resources | HR-side eligibility |
| shift plan / shift assignment | 41.labor-management | shift truth |
| attendance / clock record | 41.labor-management | work result truth |
| leave usage | 41.labor-management | labor result truth |
| overtime result | 41.labor-management | labor result truth |
| approved work result | 41.labor-management | payroll time basis |
| payroll calculation run | 42.payroll | payroll calculation truth |
| earning / deduction line | 42.payroll | payroll detail truth |
| payslip | 42.payroll | payroll employee statement truth |
| payroll payment basis | 42.payroll | handoff to cash management |
| payroll accounting posting basis | 42.payroll | handoff to accounting |
| GL journal | 30.accounting | accounting truth |
| salary bank transfer execution | 34.cash-management | cash/payment execution truth |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. HANDOFF CHAIN
# ============================================================

handoff_chain:
- hr_to_labor_worker_profile_snapshot
- hr_to_payroll_employee_payroll_profile_snapshot
- labor_to_payroll_time_pay_basis
- payroll_to_accounting_posting_basis
- payroll_to_cash_payment_basis
- source_modules_to_bi_snapshot

rules:
- 40 to 41 transfers worker / assignment basis, not attendance ownership.
- 40 to 42 transfers employee payroll profile basis, not payroll calculation ownership.
- 41 to 42 transfers approved labor/time basis, not payroll calculation ownership.
- 42 to 30 transfers posting basis, not GL journal ownership.
- 42 to 34 transfers payment basis, not cash execution ownership.
- 60 consumes snapshots only.

# ============================================================
# 5. SHIFT AXIS RULE
# ============================================================

shift_axis_rule:
- Shift linkage is centered on 41.labor-management.
- Shift plan, shift assignment, shift change, shift execution result,
  and shift-to-attendance reconciliation belong to 41.
- HR provides worker eligibility and assignment basis.
- Payroll consumes approved shift / attendance / overtime basis.
- BI visualizes shift KPIs but does not own shift truth.

# ============================================================
# 6. CORRECTION / REOPEN RULE
# ============================================================

correction_rules:
- HR master correction must occur in 40.
- Attendance / shift / leave / overtime correction must occur in 41.
- Payroll calculation correction must occur in 42.
- Accounting correction must occur in 30.
- Cash payment correction must occur in 34.
- BI refresh never equals source correction.

reopen_rules:
- HR correction may trigger labor/payroll review.
- Labor correction may trigger payroll recalculation.
- Payroll correction may trigger accounting/cash review.
- Accounting or cash correction may notify payroll but must not rewrite payroll run silently.

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- HR directly editing attendance actuals
- labor directly changing employment contract
- payroll directly changing shift actuals
- payroll directly changing employee department assignment
- attendance correction directly editing payslip without payroll recalculation workflow
- payroll run directly posting GL journal without 30 workflow
- payroll run directly executing bank transfer without 34 workflow
- BI dashboard used as payroll calculation truth
- audit finding directly changing employee master / attendance / payslip
- approval record treated as source business record without source module update

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "who is this worker and where are they assigned?" -> 40.human-resources
- If the object answers "when were they scheduled or did they work?" -> 41.labor-management
- If the object answers "how much should be paid or deducted?" -> 42.payroll
- If the object answers "what was posted to ledger?" -> 30.accounting
- If the object answers "what cash payment was executed?" -> 34.cash-management
- If the object answers "how should HRM data be visualized?" -> 60.business-intelligence

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- HRM boundary fixed
- 40 / 41 / 42 responsibilities separated
- shift axis fixed to 41.labor-management
- payroll handoff to accounting and cash clarified
- BI / approval / audit boundaries clarified

# ============================================================
