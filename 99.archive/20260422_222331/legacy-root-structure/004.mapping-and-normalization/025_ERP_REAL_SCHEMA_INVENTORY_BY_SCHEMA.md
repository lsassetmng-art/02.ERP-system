# ============================================================
# ERP REAL SCHEMA INVENTORY BY SCHEMA
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the formal inventory frame for reviewing the real ERP database
schema-by-schema.

# ============================================================
# 1. REVIEW BASIS
# ============================================================

primary_inputs:
- erp_schema_table_column_summary.txt
- erp_schema_table_column_full.txt

secondary_context_inputs:
- ERP_FOUNDATION_DUMP.txt
- ERP_GOVERNANCE_DUMP.txt
- ERP_AUDIT_DUMP.txt
- ERP_SYSTEM_FULL_DUMP.txt

rule:
Schema inventory must be derived primarily from schema table/column sources,
not from mixed repository dump artifacts.

# ============================================================
# 2. INVENTORY FORMAT
# ============================================================

required_fields_per_schema:
- schema_name
- likely_canonical_layer
- likely_canonical_modules
- table_count_estimate
- ownership_confidence
- notes

ownership_confidence_values:
- high
- medium
- low
- mixed
- unknown

# ============================================================
# 3. INITIAL SCHEMA CANDIDATES
# ============================================================

initial_schema_candidates:
- accounting
- approval
- audit
- auth
- core
- finance
- govern
- governance
- hr
- integration
- inventory
- ops
- purchase
- sales
- system
- analytics
- ai
- billing
- shipping
- manufacturing
- master
- notify
- cron
- storage
- media
- realtime
- net

note:
This list should be reconciled against the actual uploaded schema summary/full files.

# ============================================================
# 4. EXPECTED OUTPUT STYLE
# ============================================================

expected_output_style:
Each schema should later have:
- one inventory row
- one ownership hypothesis
- one mixedness note if applicable
- one follow-up requirement if uncertain

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
This document is the formal inventory entrypoint
for schema-by-schema review of the real ERP database.
