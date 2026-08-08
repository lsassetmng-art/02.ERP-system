# ============================================================
# ERP REAL TABLE REVIEW SYSTEM CONTROL FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first focused review for real tables in the system_control family.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED SIGNALS
# ============================================================

observed_signals:
- accounting.system_control
- approval.system_control

main_observation:
system_control appears in more than one semantically different schema.

# ============================================================
# 2. FIRST CANONICAL INTERPRETATION
# ============================================================

main_interpretation:
system_control is unlikely to be a pure business/accounting truth
or a pure approval truth by semantic meaning.

More likely possibilities:
- shared platform/system support table family
- schema-local control/config table family
- duplicated legacy control structure reused in multiple schemas

# ============================================================
# 3. FIRST-PASS MAPPING OPTIONS
# ============================================================

option_a:
  meaning:
  - each schema-local system_control is only local support/config
  canonical_layer:
  - same as local schema support boundary
  canonical_table_class:
  - support
  confidence:
  - low

option_b:
  meaning:
  - system_control should really be centralized platform/system support
  canonical_layer:
  - 000.platform
  canonical_module:
  - 060.data or system-adjacent platform support
  canonical_table_class:
  - support or registry
  confidence:
  - low_to_medium

option_c:
  meaning:
  - duplicated legacy tables exist in multiple schemas
  canonical_label:
  - duplicate_candidate or transitional
  confidence:
  - medium

# ============================================================
# 4. CURRENT WORKING WARNING
# ============================================================

current_working_warning:
Do not assign system_control as authoritative business truth
inside accounting or approval merely because of schema location.

The repeated name strongly suggests:
- duplicated support logic
or
- legacy/mixed placement

# ============================================================
# 5. NEXT REQUIRED CHECK
# ============================================================

next_required_check:
Inspect actual columns for:
- config key/value structure
- scope columns
- module flags
- control toggles
- timestamps and ownership fields
- whether accounting.system_control and approval.system_control are structurally similar

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
system_control is currently a strong duplicate/mixed-support candidate.

It should be reviewed as support/config logic first,
not assumed to be module-specific semantic truth.
