# ============================================================
# ERP AR AP EVIDENCE ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first actual evidence-based AR/AP family results.

review_basis:
- AR/AP deep review documents
- evidence capture rule documents
- current known concrete candidates from schema and dump review

# ============================================================
# 1. MAIN FINDING
# ============================================================

main_finding:
The strongest current visible AR/AP anchors remain:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

# ============================================================
# 2. FIRST-PASS ROLE JUDGMENT
# ============================================================

public.v_ar_accrual_preview:
  working_role:
  - receivable-side projection/read surface
  evidence_strength:
  - medium_to-high
  reasons:
  - explicit v_ prefix
  - preview naming
  - accrual/read exposure semantics

public.v_ap_accrual_preview:
  working_role:
  - payable-side projection/read surface
  evidence_strength:
  - medium_to-high
  reasons:
  - explicit v_ prefix
  - preview naming
  - accrual/read exposure semantics

# ============================================================
# 3. WHAT IS NOT YET PROVEN
# ============================================================

what_is_not_yet_proven:
- explicit base receivable ledger truth
- explicit base payable ledger truth
- exact feeder tables behind the preview views
- whether balance truth is ledger-native or journal-derived
- exact linkage to payment_allocation and billing truth

# ============================================================
# 4. BILLING BOUNDARY RESULT
# ============================================================

billing_boundary_result:
Billing remains related but distinct.

Current first-pass evidence does not justify collapsing:
- billing header truth
into
- AR/AP base ledger truth

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
AR/AP family is now moderately anchored on the projection side,
but base-ledger/source-of-truth placement remains unresolved.
