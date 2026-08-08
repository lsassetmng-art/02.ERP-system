# ============================================================
# ERP CONTRACT ALIGNMENT REVISED SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current revised contract-to-real-table alignment posture.

# ============================================================
# 1. STRENGTHENED ALIGNMENTS
# ============================================================

strengthened_alignments:
- periods -> public.accounting_period
- journal detail/list -> public.journal_entries + public.journal_lines
- runtime current process -> system.exec_run_request / integration.integration_job
- document header writes -> domain-side header tables provisionally preferred

# ============================================================
# 2. PROVISIONAL MIRROR / TRANSITIONAL INTERPRETATIONS
# ============================================================

provisional_mirror_or_transitional_interpretations:
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header

# ============================================================
# 3. STILL UNRESOLVED
# ============================================================

still_unresolved:
- settlement family final header/line truth
- AR/AP base ledger truth
- approval_request true subfamily direct table target
- exact public-vs-domain runtime write-path confirmation

# ============================================================
# 4. CURRENT BEST NEXT STEP
# ============================================================

current_best_next_step:
- deepen settlement-family review around finance.payment_allocation
- deepen AR/AP review beyond preview views
- confirm runtime write-path behavior
- confirm whether public header tables are mirrors, transitions, or writable active tables

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The revised alignment is now strong enough
to support the next phase of deeper unresolved-family review
without losing the canonical-real bridge already established.
