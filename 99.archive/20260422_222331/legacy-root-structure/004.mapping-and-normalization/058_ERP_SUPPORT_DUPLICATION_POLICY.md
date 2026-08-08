# ============================================================
# ERP SUPPORT DUPLICATION POLICY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the current policy for reviewing duplicated support/config families
such as system_control.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Duplicated support tables are not automatically invalid,
but they must be explicitly classified and governed.

# ============================================================
# 2. WHEN DUPLICATED SUPPORT IS ACCEPTABLE
# ============================================================

duplicated_support_may_be_acceptable_when:
- each copy is clearly schema-local
- semantics are local configuration only
- no false source_of_truth claim exists
- no hidden cross-module business truth is embedded

# ============================================================
# 3. WHEN DUPLICATED SUPPORT BECOMES A PROBLEM
# ============================================================

duplicated_support_becomes_problematic_when:
- copies drift inconsistently
- a support table starts carrying business truth
- consumers assume one copy is globally authoritative
- migration/consolidation intent is absent

# ============================================================
# 4. CURRENT APPLICATION
# ============================================================

current_application:
system_control currently appears to be:
- duplicated support/config family
- high duplicate confidence
- not business semantic source_of_truth by current evidence

# ============================================================
# 5. NEXT ACTION TYPES
# ============================================================

next_action_types:
- keep as schema-local support
- mark as duplicate_candidate support
- plan consolidation
- mark one canonical and others transitional

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Support duplication must be classified intentionally.
It is not the same as duplicated business truth,
but it still requires governance and review.
