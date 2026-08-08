# ============================================================
# ERP HEADER PAIR POLICY SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current policy direction
for duplicated public-vs-domain header pairs.

# ============================================================
# 1. STABLE POLICY POINTS
# ============================================================

stable_policy_points:
- semantic ownership stays canonical at module level
- physical write authority should be singular where possible
- structurally overlapping pairs must not remain unlabeled
- mirror/read-model and transitional are both valid classifications
- public schema cannot be dismissed automatically

# ============================================================
# 2. CURRENT WORKING SIGNALS
# ============================================================

current_working_signals:
- order_header pair -> strong overlap
- purchase_order_header pair -> strong overlap
- billing_header pair -> strong overlap plus domain-side extension
- return_header pair -> strong overlap plus domain-side extension
- shipping_header pair -> strong overlap

# ============================================================
# 3. CURRENT REVIEW BIAS
# ============================================================

current_review_bias:
When domain-side tables contain meaningful operational extension,
they are stronger candidates for write authority.
Public-side counterparts become stronger mirror/read-model candidates.

When both sides are identical,
a single authority decision is still required.

# ============================================================
# 4. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
Apply this policy pair-by-pair
and produce explicit provisional decisions for:
- order
- purchase_order
- billing
- return
- shipping

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Header-family review is now ready to move
from structural comparison into provisional authority decisions.
