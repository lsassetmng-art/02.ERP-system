# ============================================================
# ERP CONCRETE CANDIDATE TABLES RECEIVABLE PAYABLE FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the concrete currently observed candidate table names
for receivable/payable-family review.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED CONCRETE CANDIDATES
# ============================================================

observed_concrete_candidates:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview
- analytics.v_inventory_balance_read
- analytics.v_stock_balance
- ci.v_sla_overdue_requests

# ============================================================
# 2. WORKING FILTER
# ============================================================

working_filter:
Highest relevance currently:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

Likely false positives:
- inventory balance views
- SLA overdue request views

# ============================================================
# 3. CURRENT JUDGMENT
# ============================================================

current_judgment:
The receivable/payable-family is currently under-anchored.

Important observation:
The first explicit AR/AP hits are views,
not obvious base ledger tables.

working implication:
- either base tables use unexpected names
- or the preview views sit on top of ledger tables that have not yet been isolated by naming

# ============================================================
# 4. NEXT CHECK
# ============================================================

next_check:
Inspect view definition context if available
or continue discovery using:
- ledger
- accrual
- invoice balance
- due/open/original amount semantics

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
AR/AP discovery remains unresolved.
Current concrete anchors are preview-view level, not base-truth-table level.
