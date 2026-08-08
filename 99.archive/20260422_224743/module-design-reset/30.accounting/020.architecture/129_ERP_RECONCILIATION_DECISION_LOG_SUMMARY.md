# ============================================================
# ERP RECONCILIATION DECISION LOG SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the most important current reconciliation decisions and provisional decisions.

# ============================================================
# 1. STABLE DECISIONS
# ============================================================

stable_decisions:
- canonical semantic ownership remains module-based
- schema name alone is insufficient for ownership
- public schema cannot be dismissed automatically
- system_control is currently treated as duplicated support/config family
- approval_request-like family is not treated as a simple duplicate family

# ============================================================
# 2. STRONG FIRST-PASS DECISIONS
# ============================================================

strong_first_pass_decisions:
- public.accounting_period is the strongest current general period truth candidate
- public.journal_entries / public.journal_lines are the strongest current journal truth candidates
- accounting.journal_candidate / accounting.journal_draft are staging-side candidates
- finance.payment_allocation is the strongest current settlement application-side candidate

# ============================================================
# 3. PROVISIONAL DECISIONS
# ============================================================

provisional_decisions:
- sales.order_header is provisional write-authority candidate
- purchase.purchase_order_header is provisional write-authority candidate
- sales.billing_header is provisional write-authority candidate
- sales.return_header is provisional write-authority candidate
- sales.shipping_header is provisional write-authority candidate
- corresponding public header tables are provisional mirror/transitional candidates

# ============================================================
# 4. UNRESOLVED DECISIONS
# ============================================================

unresolved_decisions:
- true runtime active write-path center
- public header actual mirror/transitional/active-write behavior
- settlement header truth
- AR/AP base ledger truth
- approval_request true direct real-table target

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The reconciliation decision log already contains meaningful stable anchors,
but several important authority questions are still provisional.
