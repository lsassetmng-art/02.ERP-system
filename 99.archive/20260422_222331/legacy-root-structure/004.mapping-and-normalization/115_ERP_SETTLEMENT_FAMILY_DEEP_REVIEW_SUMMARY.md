# ============================================================
# ERP SETTLEMENT FAMILY DEEP REVIEW SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current deep-review outcome for settlement-family discovery.

# ============================================================
# 1. MAIN RESULT
# ============================================================

main_result:
finance.payment_allocation is now the strongest current settlement-family anchor candidate.

# ============================================================
# 2. WHAT IS NOW STRONGER
# ============================================================

what_is_now_stronger:
- settlement/application-side candidate exists
- public read/projection side also exists
- nearby non-settlement allocation families have been separated out

# ============================================================
# 3. WHAT REMAINS UNRESOLVED
# ============================================================

what_remains_unresolved:
- explicit settlement header truth
- exact AR/AP linkage tables behind allocation
- final contract-to-real-table hardening for settlement actions and queries

# ============================================================
# 4. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
- AR/AP family deep review
- inspect whether payment_allocation links directly to receivable/payable truth
- revisit settlement contracts after AR/AP anchor is stronger

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Settlement-family is no longer unanchored.
It now has a provisional application-side truth candidate,
with header-side discovery still pending.
