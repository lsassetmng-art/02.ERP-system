# ============================================================
# ERP COLUMN COMPARISON ACCOUNTING PERIOD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the formal comparison target and review questions
for core.accounting_period vs accounting.invoice_period.

comparison_targets:
- core.accounting_period
- accounting.invoice_period

primary_questions:
- does core.accounting_period contain general accounting close/open truth
- does accounting.invoice_period contain invoice-cycle support only
- are these parallel truths or general-plus-specialized split

required_column_review_points:
- period start/end fields
- fiscal year / fiscal month fields
- open/closed/locked status columns
- close/reopen timestamps
- invoice-specific discriminator fields
- posting/settlement window fields
- general ledger applicability fields
- company/tenant scope
- uniqueness rules

comparison_judgment_rules:
- general open/closed/locked semantics -> canonical period source_of_truth candidate
- invoice-specific cycle semantics -> support/specialized structure candidate
- identical structure with minor naming changes -> duplicate/transitional candidate
- subset structure referring to general period -> support candidate

working_expected_outcome:
- core.accounting_period likely general source_of_truth
- accounting.invoice_period likely invoice-facing support/specialized structure

conclusion:
Accounting period review depends on whether invoice_period is general-period truth
or merely invoice-scope operational support.
