# ============================================================
# ERP REAL TABLE DUPLICATE AND MIXED REVIEW TEMPLATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the template for reviewing duplicate-candidate tables
and mixed-responsibility schemas/tables in the real ERP structure.

# ============================================================
# 1. DUPLICATE REVIEW FIELDS
# ============================================================

duplicate_review_fields:
- candidate_group_id
- schema_name
- table_name
- likely_duplicate_of
- canonical_owner_candidate
- duplicate_confidence
- recommended_label
- notes

duplicate_confidence_values:
- high
- medium
- low
- unclear

recommended_label_values:
- canonical_keep
- transitional_keep
- duplicate_candidate
- deprecated_candidate
- needs_more_review

# ============================================================
# 2. MIXED REVIEW FIELDS
# ============================================================

mixed_review_fields:
- schema_name
- table_name optional
- mixed_concerns
- likely_primary_canonical_owner
- likely_secondary_canonical_owner
- mixedness_confidence
- review_notes

mixedness_confidence_values:
- high
- medium
- low
- unclear

# ============================================================
# 3. WHEN TO USE
# ============================================================

use_duplicate_review_when:
- two or more tables appear to represent the same semantic truth
- one table appears to be a mirror of another
- legacy and current tables coexist

use_mixed_review_when:
- one schema contains multiple canonical concerns
- one table appears to blend multiple canonical meanings
- schema naming is too broad to infer pure ownership

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
This template is the formal base
for duplicate-candidate and mixed-responsibility review work.
