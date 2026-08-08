# ============================================================
# ERP FINANCE DETAILED HANDOFF REINFORCEMENT MEMO
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track B
scope:
- 05.billing
- 10.purchase
- 42.payroll
- 18.costing
- 33.fixed-assets
- 30.accounting
- 34.cash-management
- 60.business-intelligence

purpose:
Reinforce detailed finance handoff boundaries from business source modules
to statutory accounting and cash management.

# ============================================================
# 1. CORE PRINCIPLE
# ============================================================

core_principle:
- Source modules own source business truth.
- 30.accounting owns GL / subledger / statutory posting truth.
- 34.cash-management owns payment / receipt / bank execution / reconciliation truth.
- Posting basis is not GL journal.
- Payment basis is not bank execution.
- Receipt evidence is not accounting clearing by itself.
- BI owns analytical projection only.

# ============================================================
# 2. DETAILED HANDOFFS COVERED
# ============================================================

handoffs:
- billing_to_accounting_invoice_posting_basis
- billing_to_cash_receipt_expectation_basis
- purchase_to_accounting_supplier_obligation_basis
- purchase_to_cash_supplier_payment_basis
- payroll_to_accounting_payroll_posting_basis
- payroll_to_cash_salary_payment_basis
- costing_to_accounting_cost_posting_basis
- fixed_assets_to_accounting_asset_posting_basis
- fixed_assets_to_cash_asset_sale_or_acquisition_cash_basis

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| meaning | owner_module | note |
|---|---|---|
| customer invoice | 05.billing | billing truth |
| billing adjustment / credit memo | 05.billing | billing truth |
| supplier claim / supplier return | 10.purchase | supplier commercial truth |
| supplier payment request basis | 10.purchase | payment basis only |
| payroll calculation / payslip | 42.payroll | payroll truth |
| payroll close package | 42.payroll | payroll truth |
| cost rollup / variance | 18.costing | cost truth |
| fixed asset capitalization/depreciation/disposal | 33.fixed-assets | fixed asset accounting-side source truth |
| GL journal / AP / AR | 30.accounting | statutory accounting truth |
| payment execution / receipt / bank reconciliation | 34.cash-management | cash truth |
| dashboard | 60.business-intelligence | projection only |

# ============================================================
# 4. GLOBAL RULES
# ============================================================

posting_basis_rule:
- Business modules emit posting basis.
- 30.accounting validates, accepts, rejects, posts, reverses, or adjusts.
- Source modules do not post journals directly.

payment_basis_rule:
- Business modules emit payment or receipt expectation basis.
- 34.cash-management validates, schedules, executes, rejects, reconciles, or reverses.
- Source modules do not mark bank execution complete by themselves.

feedback_rule:
- 30 and 34 send feedback to source modules.
- Source modules update posting/payment status through their own workflow.
- Feedback does not rewrite source amount/quantity/decision unless source module performs correction.

BI_rule:
- BI can snapshot posting status, payment status, open AP/AR, reconciliation state.
- BI cannot post, pay, clear, reverse, reconcile, or correct source truth.

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- invoice directly becoming GL journal
- invoice directly becoming cash receipt
- supplier claim directly becoming AP journal
- purchase return directly becoming supplier refund cash receipt
- payroll close directly becoming GL journal
- payslip issue directly becoming salary payment execution
- cost variance directly becoming GL journal
- fixed asset capitalization directly becoming GL journal
- fixed asset disposal directly becoming cash receipt
- bank statement line directly changing invoice / payroll / purchase / asset source truth
- accounting posting feedback changing source amount without source workflow
- cash execution feedback changing GL journal without accounting workflow
- BI dashboard correcting invoice, AP, AR, payroll, payment, journal, or fixed asset status

# ============================================================
# 6. DECISION TEST
# ============================================================

decision_tests:
- If it is business source document or calculation, source module owns it.
- If it is statutory posting / subledger / GL, 30.accounting owns it.
- If it is actual cash/bank movement or reconciliation, 34.cash-management owns it.
- If it is fixed asset accounting lifecycle, 33.fixed-assets owns it.
- If it is analytical display, 60.business-intelligence owns projection only.

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- finance detailed handoff reinforcement fixed
- posting basis vs journal boundary strengthened
- payment basis vs cash execution boundary strengthened
- source feedback boundaries clarified

# ============================================================
