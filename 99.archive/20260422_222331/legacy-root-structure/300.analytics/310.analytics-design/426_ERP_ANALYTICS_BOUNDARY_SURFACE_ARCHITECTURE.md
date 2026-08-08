# ============================================================
# ERP ANALYTICS BOUNDARY SURFACE ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for analytics-boundary surfaces.

main_objects:
- public.v_finance_payment_allocation
- public.accounting_period
- public.journal_entries
- public.journal_lines
- system.v_operation_log_audit
- manufacturing.yield_metric
- public.v_manufacturing_yield_metric

role_split:
- finance/accounting read-surface layer
- operational analytical view layer
- metric-adjacent domain analytics layer

main_rule:
These objects are analytics-relevant,
but should not be collapsed into analytics native core.

design implication:
Analytics architecture needs an explicit boundary-surface layer
between analytics-owned core and source-domain-facing analytical surfaces.

conclusion:
Boundary surfaces are a first-class analytics architecture concern,
especially where finance, management, audit, and manufacturing meet analytics.
