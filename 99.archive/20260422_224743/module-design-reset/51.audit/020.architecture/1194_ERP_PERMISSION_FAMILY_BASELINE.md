# ============================================================
# ERP PERMISSION FAMILY BASELINE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1194
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.permission_family.baseline
component: permission-family-baseline


# BASELINE

Representative permission family distinctions:
- read
- write
- review
- approve
- export
- audit_read
- override

# RULE

Read should not imply write.
Review should not imply approve.
Approve should not imply override.
Read should not imply export.

