# ============================================================
# ERP REAL TABLE MIXED OWNERSHIP WARNING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the warning posture that must be used
when reviewing the real ERP tables.

# ============================================================
# 1. WARNING RULE
# ============================================================

warning_rule:
Do not assume that a table belongs to a canonical module
just because its schema name suggests it.

examples_of_actual_risk:
- approval_request appearing in audit schema
- accounting_period appearing in core schema
- journal_entries appearing in core schema
- system_control appearing in accounting and approval contexts
- SaaS/payment support tables appearing inside approval schema

# ============================================================
# 2. REVIEW CONSEQUENCE
# ============================================================

review_consequence:
Every table review must ask:
- what is the semantic truth here?
- is this authoritative, support, bridge, staging, or audit?
- is this duplicated elsewhere?
- is this a transitional/legacy placement?

# ============================================================
# 3. DUPLICATE WARNING
# ============================================================

duplicate_warning:
Particular caution is required for:
- approval_request
- accounting_period
- journal*
- audit_trail*
- system_control
- notification-related tables

These names suggest possible duplication or cross-schema overlap.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The real ERP table review must be table-first and semantic-first.
Schema-first review is no longer sufficient after the actual findings.
