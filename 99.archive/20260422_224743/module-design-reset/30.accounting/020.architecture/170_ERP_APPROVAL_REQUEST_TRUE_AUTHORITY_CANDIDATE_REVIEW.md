# ============================================================
# ERP APPROVAL REQUEST TRUE AUTHORITY CANDIDATE REVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Reviews the strongest current candidates
for true approval-request authority.

# ============================================================
# 1. PRIMARY CANDIDATES
# ============================================================

primary_candidates:
- workflow.approval_request
- system.approval_request

# ============================================================
# 2. WHY THESE ARE PRIMARY
# ============================================================

why_these_are_primary:
- both live closer to operational approval flow than governance-only or notify-only placements
- both are stronger candidates for active state transitions
- both are semantically closer to request/decision lifecycle truth

# ============================================================
# 3. SECONDARY OR NON-PRIMARY CANDIDATES
# ============================================================

secondary_or_non_primary_candidates:
- audit.approval_request -> more likely audit/history or mixed placement
- govern.approval_request -> governance control request side
- governance.approval_request -> governance control request side
- notify.approval_request -> notify support side
- public.approval_request_with_url -> projection/read surface
- ai.approval_request -> AI support side

# ============================================================
# 4. CURRENT FIRST-PASS BIAS
# ============================================================

current_first_pass_bias:
If forced to choose a stronger current truth candidate,
workflow.approval_request currently has the better semantic fit
for true approval lifecycle authority,
with system.approval_request as the nearest competing candidate.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The first-pass authority review narrows the true approval-request question
primarily to workflow.approval_request vs system.approval_request.
