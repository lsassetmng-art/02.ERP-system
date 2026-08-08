# ============================================================
# ERP PUBLIC SCHEMA REVIEW NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains how public schema should be treated in canonical ERP review.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
public schema must not be dismissed as generic or non-authoritative
without table-level evidence.

# ============================================================
# 2. ACTUAL FINDING
# ============================================================

actual_finding:
The uploaded column inventory shows that public currently contains
tables that strongly resemble authoritative accounting truth, including:
- accounting_period
- journal_entries
- journal_lines

# ============================================================
# 3. REVIEW CONSEQUENCE
# ============================================================

review_consequence:
public schema review must distinguish between:
- true authoritative application tables
- generic support tables
- legacy/shared tables
- cross-domain tables

# ============================================================
# 4. WARNING
# ============================================================

warning:
A naive rule such as
"public is not canonical business truth"
is invalid in the current ERP structure.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
public schema must be reviewed table-by-table.
Some of its tables are now first-pass candidates
for canonical source_of_truth ownership.
