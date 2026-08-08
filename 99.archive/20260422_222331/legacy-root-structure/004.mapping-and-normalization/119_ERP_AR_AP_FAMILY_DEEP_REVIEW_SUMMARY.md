# ============================================================
# ERP AR AP FAMILY DEEP REVIEW SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current deep-review outcome for AR/AP family discovery.

# ============================================================
# 1. MAIN RESULT
# ============================================================

main_result:
public.v_ar_accrual_preview and public.v_ap_accrual_preview
are now the strongest visible AR/AP anchors,
but only on the preview/projection side.

# ============================================================
# 2. WHAT IS NOW STRONGER
# ============================================================

what_is_now_stronger:
- AR/AP family is no longer completely unanchored
- projection/read-side anchor exists
- billing boundary has been clarified
- settlement/payment allocation relation can now be reviewed more safely

# ============================================================
# 3. WHAT REMAINS UNRESOLVED
# ============================================================

what_remains_unresolved:
- explicit base receivable ledger truth
- explicit base payable ledger truth
- exact relation between preview views and underlying ledger tables
- exact join path to payment allocation and billing truth

# ============================================================
# 4. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
- inspect broader ledger/accrual/balance-style names
- compare AR/AP preview semantics with journal and payment allocation anchors
- revisit AR/AP contract alignment after stronger ledger discovery

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
AR/AP family is now weakly anchored on the projection side,
but still needs deeper base-ledger discovery.
