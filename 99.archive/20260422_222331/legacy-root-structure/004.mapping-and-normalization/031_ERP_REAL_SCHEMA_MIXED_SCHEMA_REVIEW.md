# ============================================================
# ERP REAL SCHEMA MIXED SCHEMA REVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures the first review of likely mixed-responsibility schemas
in the real ERP database.

# ============================================================
# 1. CORE
# ============================================================

schema_name:
- core

mixedness:
- high

reason:
The name suggests a broad shared schema that may contain:
- shared identifiers
- shared config
- shared system state
- possible business-adjacent structures

review_need:
- table-by-table classification required

# ============================================================
# 2. SYSTEM
# ============================================================

schema_name:
- system

mixedness:
- high

reason:
The name suggests platform/system support,
but such schemas often accumulate policy, flags, control, and operational metadata.

review_need:
- table-by-table classification required

# ============================================================
# 3. OPS
# ============================================================

schema_name:
- ops

mixedness:
- high

reason:
Operational schemas may contain:
- runtime execution support
- delivery queues
- jobs
- support logs
- possibly business-facing operational tables

review_need:
- table-by-table classification required

# ============================================================
# 4. AI
# ============================================================

schema_name:
- ai

mixedness:
- high

reason:
The schema appears likely to mix:
- analytics support
- management recommendation support
- policy-related support
- approval-related support

review_need:
- table-by-table classification required
- especially around approval_request / policy / risk-like tables

# ============================================================
# 5. GOVERN / GOVERNANCE
# ============================================================

schema_names:
- govern
- governance

mixedness:
- medium_to_high

reason:
The naming suggests overlapping control concerns.
It is likely that:
- one may be a legacy/shortened namespace
- both may contain governance-related truth or support
- duplicates or transitional splits may exist

review_need:
- compare table names directly
- detect duplicate truth and transitional structures

# ============================================================
# 6. MASTER
# ============================================================

schema_name:
- master

mixedness:
- medium

reason:
Master data can belong partly to platform shared data
and partly to business-facing domain truth.

review_need:
- classify tables into platform/data vs business-support roles

# ============================================================
# 7. BILLING
# ============================================================

schema_name:
- billing

mixedness:
- medium

reason:
Billing may be business truth,
but can also connect to approval, delivery, and reporting concerns.

review_need:
- separate invoice/payment truth from surrounding support tables

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
The most important mixed-schema review targets are:
- core
- system
- ops
- ai
- govern / governance
- master
- billing

These schemas should be reviewed before claiming final table ownership alignment.
