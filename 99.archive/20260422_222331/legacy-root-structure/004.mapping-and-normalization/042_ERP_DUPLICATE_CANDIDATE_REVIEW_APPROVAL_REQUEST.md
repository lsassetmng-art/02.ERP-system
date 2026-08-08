# ============================================================
# ERP DUPLICATE CANDIDATE REVIEW APPROVAL REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Reviews approval_request-family structures from the perspective of
duplicate, transitional, and canonical ownership classification.

# ============================================================
# 1. REVIEW TARGET
# ============================================================

review_target:
- audit.approval_request
- approval schema approval-related structures
- approval_log / approval_notify_queue / approval_reason_template adjacency

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

current_interpretation:
approval_request is semantically owned by:
- 200.management / 270.approval

but physically observed in:
- audit schema

meaning:
Physical placement and semantic ownership are separated.

# ============================================================
# 3. CLASSIFICATION HYPOTHESIS
# ============================================================

classification_hypothesis:

  audit.approval_request:
    likely_semantic_owner:
    - 200.management / 270.approval
    likely_class:
    - source_of_truth or transitional
    duplicate_risk:
    - high
    rationale:
    - approval semantic meaning is clear, but physical audit placement is suspicious

  audit.approval_log:
    likely_semantic_owner:
    - 270.approval or 090.audit depending columns
    likely_class:
    - history or audit
    duplicate_risk:
    - medium
    rationale:
    - may duplicate approval-native action history

  audit.approval_notify_queue:
    likely_semantic_owner:
    - platform support
    likely_class:
    - support
    duplicate_risk:
    - low
    rationale:
    - queue semantics suggest delivery support, not approval truth

  audit.approval_reason_template:
    likely_semantic_owner:
    - 270.approval
    likely_class:
    - support or registry
    duplicate_risk:
    - low_to_medium
    rationale:
    - template semantics are approval-facing, but not request truth itself

# ============================================================
# 4. PRIMARY JUDGMENT
# ============================================================

primary_judgment:
approval_request itself should not be treated as audit-owned semantic truth.

working_classification:
- semantic owner: 200.management / 270.approval
- physical placement: suspicious / likely transitional or mixed-placement
- review label: duplicate_candidate_or_transitional_pending_column_review

# ============================================================
# 5. NEXT CHECK
# ============================================================

next_check:
Determine whether:
- a second approval_request-like table exists elsewhere
- audit.approval_request contains current approval truth columns
- audit.approval_request is actually a replicated/mirrored control table

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
approval_request is currently the strongest candidate for
semantic-owner vs physical-location mismatch
and likely belongs in duplicate/transitional review.
