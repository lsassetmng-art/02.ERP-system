# ============================================================
# ERP COLUMN COMPARISON ACTUAL RESULTS SYSTEM CONTROL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures the actual current findings for system_control-family tables
based on uploaded schema column data.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED SCHEMAS
# ============================================================

observed_schemas_with_system_control:
- accounting
- approval
- finance
- hr
- inventory
- purchase
- sales
- workflow

# ============================================================
# 2. OBSERVED COLUMN SHAPE
# ============================================================

observed_column_shape_pattern:
- control_key
- control_value
- updated_at

observed_similarity:
The repeated structure strongly suggests
a duplicated support/config table family.

# ============================================================
# 3. ACTUAL JUDGMENT
# ============================================================

actual_judgment:
This is no longer just a suspicion.
Current evidence supports:

- family classification:
  duplicated support/config family

- likely canonical class:
  support

- likely semantic position:
  schema-local support duplicated across multiple modules
  or legacy copied support pattern

- duplicate confidence:
  high

# ============================================================
# 4. CANONICAL CONSEQUENCE
# ============================================================

canonical_consequence:
system_control should not be treated as:
- accounting semantic source_of_truth
- approval semantic source_of_truth
- finance semantic source_of_truth
- sales semantic source_of_truth

It should be treated as:
- support family
- duplicate_candidate family
- possible future consolidation target

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The actual column data strongly supports
classifying system_control as a duplicated support/config family.
