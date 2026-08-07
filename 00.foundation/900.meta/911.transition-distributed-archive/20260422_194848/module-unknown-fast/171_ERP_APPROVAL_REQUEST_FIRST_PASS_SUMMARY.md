# ============================================================
# ERP APPROVAL REQUEST FIRST PASS SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the first-pass evidence posture
for approval_request-like families.

# ============================================================
# 1. SUMMARY RESULT
# ============================================================

summary_result:
approval_request-like family is now better understood as
multiple related subfamilies rather than one duplicate table family.

# ============================================================
# 2. CURRENT SUBFAMILY MAP
# ============================================================

current_subfamily_map:
- true approval truth candidate:
  - workflow.approval_request
  - system.approval_request
- governance control request:
  - govern.approval_request
  - governance.approval_request
- notify/projection support:
  - notify.approval_request
  - public.approval_request_with_url
- AI support:
  - ai.approval_request
- audit/mixed placement:
  - audit.approval_request

# ============================================================
# 3. CURRENT HARDENING LEVEL
# ============================================================

current_hardening_level:
- subfamily split -> medium_to_high hardened
- true authority narrowing -> medium hardened
- final true authority confirmation -> still open

# ============================================================
# 4. NEXT BEST FOLLOW-UP
# ============================================================

next_best_follow_up:
- collect stronger workflow/system write-path evidence
- inspect decision/status mutation paths
- revise approval contract alignment after stronger authority evidence
- draft approval authority registry after one more evidence pass

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
approval_request-like review is no longer structurally ambiguous,
but final true-approval authority is not fully closed yet.
