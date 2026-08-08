# ============================================================
# ERP BUSINESS CORE PERMISSION FAMILY ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1550
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.business_core.permission_family_alignment_rule
component: business-core-permission-family-alignment-rule


# RULE

Cross-module business-core permission interpretation should preserve:

- read
- write
- review
- approve
- export
- audit_read
- override

# CONSEQUENCE

No business-core chain should quietly collapse:
- read into write
- review into approve
- approve into override
- read into export

