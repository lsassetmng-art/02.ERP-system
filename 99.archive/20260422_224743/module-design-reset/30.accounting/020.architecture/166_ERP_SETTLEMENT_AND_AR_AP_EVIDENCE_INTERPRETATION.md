# ============================================================
# ERP SETTLEMENT AND AR AP EVIDENCE INTERPRETATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Interprets the first evidence-based findings
for settlement and AR/AP families.

# ============================================================
# 1. SETTLEMENT INTERPRETATION
# ============================================================

settlement_interpretation:
The settlement family is no longer unanchored.

Current strongest direction:
- finance.payment_allocation as application-side truth candidate
- public.v_finance_payment_allocation as projection/read exposure

Meaning:
Settlement now has a workable operational hypothesis,
but not yet a fully hardened source-of-truth map.

# ============================================================
# 2. AR/AP INTERPRETATION
# ============================================================

ar_ap_interpretation:
The AR/AP family is no longer fully opaque.

Current strongest direction:
- public.v_ar_accrual_preview as receivable-side projection anchor
- public.v_ap_accrual_preview as payable-side projection anchor

Meaning:
AR/AP has a visible read layer,
but still lacks a firmly identified base ledger layer.

# ============================================================
# 3. WHAT IS NOW HARDER TO CLAIM
# ============================================================

what_is_now_harder_to_claim:
- that settlement is completely unanchored
- that AR/AP has no usable anchors at all
- that billing can simply stand in for AR/AP truth

# ============================================================
# 4. WHAT IS STILL OPEN
# ============================================================

what_is_still_open:
- settlement header truth
- AR/AP base ledger truth
- exact feeder and derivation paths
- contract alignment hardening for settlement and AR/AP actions/queries

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The first pass has strengthened settlement and AR/AP review,
but both families still need one deeper round of base-truth discovery.
