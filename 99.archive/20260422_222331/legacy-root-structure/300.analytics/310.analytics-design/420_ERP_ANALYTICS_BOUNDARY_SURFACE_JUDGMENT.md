# ============================================================
# ERP ANALYTICS BOUNDARY SURFACE JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for analytics-boundary read surfaces.

current_reading:
- public.v_finance_payment_allocation is partly analytical but also writable/read-surface oriented
- public.accounting_period, public.journal_entries, and public.journal_lines are exposed read surfaces with analytical usability
- system.v_operation_log_audit is an operational analytical view near the management/audit boundary
- manufacturing.yield_metric and public.v_manufacturing_yield_metric are metric-adjacent domain analytics near the business boundary

interpretation:
These objects should not be collapsed into analytics native core.
They are analytics-boundary surfaces.

conclusion:
Analytics architecture needs an explicit boundary-surface layer
between native analytics core and source domains.
