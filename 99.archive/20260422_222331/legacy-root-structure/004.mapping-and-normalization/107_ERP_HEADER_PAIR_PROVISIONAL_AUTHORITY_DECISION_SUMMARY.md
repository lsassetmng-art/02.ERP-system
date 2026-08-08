# ============================================================
# ERP HEADER PAIR PROVISIONAL AUTHORITY DECISION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the provisional authority decisions
for duplicated public-vs-domain header pairs.

# ============================================================
# 1. PROVISIONAL WRITE-AUTHORITY CANDIDATES
# ============================================================

provisional_write_authority_candidates:
- sales.order_header
- purchase.purchase_order_header
- sales.billing_header
- sales.return_header
- sales.shipping_header

# ============================================================
# 2. PROVISIONAL MIRROR / TRANSITIONAL CANDIDATES
# ============================================================

provisional_mirror_or_transitional_candidates:
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header

# ============================================================
# 3. MAIN RATIONALE
# ============================================================

main_rationale:
- where structures are identical, avoid dual-authority ambiguity by preferring domain-side operational ownership
- where domain-side tables contain extra operational columns, prefer domain-side write authority more strongly
- public-side tables are provisionally better explained as mirror/read-model or transitional duplicates

# ============================================================
# 4. IMPORTANT WARNING
# ============================================================

important_warning:
This is a provisional authority decision set only.

It does not yet prove:
- the actual runtime write path
- the actual sync topology
- whether public-side tables are still actively written in production

# ============================================================
# 5. NEXT REQUIRED CHECK
# ============================================================

next_required_check:
To harden these provisional decisions, confirm:
- actual write-path SQL or repository usage
- triggers/sync jobs/materialization paths if any
- whether public-side tables are views or writable base tables in practice

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Current best provisional decision:
- domain-side headers are write-authority candidates
- public-side headers are mirror/transitional candidates
until stronger runtime evidence says otherwise.
