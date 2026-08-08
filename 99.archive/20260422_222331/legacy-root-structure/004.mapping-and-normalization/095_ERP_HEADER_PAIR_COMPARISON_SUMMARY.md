# ============================================================
# ERP HEADER PAIR COMPARISON SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current first-pass pair comparison posture
for public-vs-domain header families.

# ============================================================
# 1. PAIRS UNDER REVIEW
# ============================================================

pairs_under_review:
- public.order_header vs sales.order_header
- public.purchase_order_header vs purchase.purchase_order_header
- public.billing_header vs sales.billing_header
- public.return_header vs sales.return_header
- public.shipping_header vs sales.shipping_header

# ============================================================
# 2. MAIN FINDING
# ============================================================

main_finding:
The ERP document header layer appears to contain
public-vs-domain duplicated or transitional pairs.

# ============================================================
# 3. STABLE PART
# ============================================================

stable_part:
Canonical semantic ownership is still stable:
- order -> 110.sales
- purchase_order -> 120.purchase
- billing -> business billing/accounting-adjacent truth
- return -> sales/fulfillment-side truth
- shipping -> shipping/fulfillment-side truth

# ============================================================
# 4. UNRESOLVED PART
# ============================================================

unresolved_part:
The unresolved question is physical authoritative placement:
- public authoritative?
- domain authoritative?
- read-model mirror?
- transition split?

# ============================================================
# 5. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
Perform direct column-structure comparison for each pair
and decide:
- source_of_truth
- duplicate_candidate
- transitional
- mirror/read-model
- support-only

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Header-family review is now ready
to move from pair suspicion to column-structure decision.
