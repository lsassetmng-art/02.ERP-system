# ============================================================
# ERP DUMP REVIEW ENTRYPOINT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the uploaded ERP dump and schema artifacts
should be reviewed from this point onward.

# ============================================================
# 1. REVIEW INPUTS
# ============================================================

review_inputs:
- erp_schema_table_column_summary.txt
- erp_schema_table_column_full.txt
- ERP_FOUNDATION_DUMP.txt
- ERP_GOVERNANCE_DUMP.txt
- ERP_AUDIT_DUMP.txt
- ERP_SYSTEM_FULL_DUMP.txt

# ============================================================
# 2. SOURCE OF TRUTH PRIORITY
# ============================================================

source_of_truth_priority:
1. erp_schema_table_column_full.txt
2. erp_schema_table_column_summary.txt
3. DB-meaningful excerpts from dump files
4. repository/file-layout-only dump content as contextual evidence only

meaning:
Schema inventory is more trustworthy for DB structure than mixed repo dumps.

# ============================================================
# 3. REVIEW ORDER
# ============================================================

recommended_review_order:
- schema list and schema counts
- table inventory by schema
- canonical layer-to-schema mapping
- table-level ownership classification
- contract-to-table reconciliation
- mixed-responsibility schema review
- dump artifact contextual review last

# ============================================================
# 4. IMPORTANT RULE
# ============================================================

important_rule:
Do not treat repository paths, git internals, shell histories,
or config files from mixed dumps as equivalent to database structure truth.

They may still help identify:
- implementation history
- repo ownership
- naming lineage
but not authoritative DB ownership.

# ============================================================
# 5. NEXT FORMAL OUTPUTS
# ============================================================

next_formal_outputs:
- ERP_REAL_SCHEMA_INVENTORY_BY_SCHEMA.md
- ERP_REAL_TABLE_TO_CANONICAL_MODULE_MAPPING.md
- ERP_REAL_TABLE_DUPLICATE_AND_MIXED_REVIEW.md
- ERP_EXACT_CONTRACT_TO_REAL_TABLE_ALIGNMENT.md

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
This entrypoint fixes the review posture:
schema inventory first,
mixed dump context second,
canonical reconciliation after that.
