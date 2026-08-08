# ============================================================
# ERP APPROVAL REQUEST SUBFAMILY SPLIT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the current working split for approval_request-like tables
after actual column-based review.

# ============================================================
# 1. SPLIT RULE
# ============================================================

split_rule:
Do not treat all approval_request-like tables as one structural family.

Instead, split them into subfamilies by actual semantics.

# ============================================================
# 2. CURRENT SUBFAMILY HYPOTHESIS
# ============================================================

current_subfamily_hypothesis:

  true_approval_truth_subfamily:
    likely_meaning:
    - approval decision/control truth
    likely_canonical_owner:
    - 200.management / 270.approval

  governance_control_request_subfamily:
    likely_meaning:
    - governance-related approval/control request
    likely_canonical_owner:
    - 200.management / governance-related module

  notify_support_subfamily:
    likely_meaning:
    - notification-driven approval handling/support
    likely_canonical_owner:
    - platform support or notify-adjacent support

  ai_support_subfamily:
    likely_meaning:
    - AI-mediated approval support or recommendation handling
    likely_canonical_owner:
    - analytics/support or management-support depending deeper evidence

  workflow_or_system_support_subfamily:
    likely_meaning:
    - workflow/system orchestration-side approval support
    likely_canonical_owner:
    - platform/workflow support

# ============================================================
# 3. REVIEW CONSEQUENCE
# ============================================================

review_consequence:
Future mapping should classify each approval_request-like table into:
- true approval truth
- governance control request
- notify support
- ai support
- workflow/system support

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
approval_request-like tables now require subfamily split review,
not simple duplicate-family treatment.
