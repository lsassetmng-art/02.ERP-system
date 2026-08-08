# ============================================================
# ERP MANAGEMENT LAYER PERMISSION FAMILY ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1768
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_layer.permission_family_alignment_rule
component: management-layer-permission-family-alignment-rule


# RULE

Cross-module management-layer permission interpretation should preserve:

- read
- write
- review
- approve
- export
- audit_read
- override

# CONSEQUENCE

No management-layer chain should quietly collapse:
- read into write
- review into approve
- approve into override
- read into export

