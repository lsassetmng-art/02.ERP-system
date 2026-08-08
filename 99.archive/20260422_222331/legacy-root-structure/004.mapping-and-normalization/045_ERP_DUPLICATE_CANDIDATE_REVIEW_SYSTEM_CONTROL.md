# ============================================================
# ERP DUPLICATE CANDIDATE REVIEW SYSTEM CONTROL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Reviews system_control-family structures from the perspective of
duplicate, support, and transitional classification.

# ============================================================
# 1. REVIEW TARGET
# ============================================================

review_target:
- accounting.system_control
- approval.system_control

# ============================================================
# 2. CURRENT INTERPRETATION
# ============================================================

current_interpretation:
system_control appears in multiple semantically different schemas,
which strongly suggests duplicated support/config logic
or legacy copied placement.

# ============================================================
# 3. CLASSIFICATION HYPOTHESIS
# ============================================================

classification_hypothesis:

  accounting.system_control:
    likely_semantic_owner:
    - 000.platform support or accounting-local support
    likely_class:
    - support
    duplicate_risk:
    - high
    rationale:
    - repeated name across schemas suggests duplicated support/config family

  approval.system_control:
    likely_semantic_owner:
    - 000.platform support or approval-local support
    likely_class:
    - support
    duplicate_risk:
    - high
    rationale:
    - repeated name across schemas suggests duplicated support/config family

# ============================================================
# 4. PRIMARY JUDGMENT
# ============================================================

primary_judgment:
system_control is currently the strongest duplicate/support candidate
among the reviewed families.

Working judgment:
- do not treat either copy as module-semantic source_of_truth
- treat both as support candidates pending structural comparison
- likely final outcome is duplicate_candidate_or_transitional_support

# ============================================================
# 5. NEXT CHECK
# ============================================================

next_check:
Compare columns for:
- same key/value structure
- same control-flag structure
- same module scoping pattern
- same timestamps and update semantics

If highly similar:
- classify as duplicate support family

If clearly different:
- classify as separate schema-local support tables

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
system_control is the clearest current duplicate/support review target
and should be examined by structural column comparison next.
