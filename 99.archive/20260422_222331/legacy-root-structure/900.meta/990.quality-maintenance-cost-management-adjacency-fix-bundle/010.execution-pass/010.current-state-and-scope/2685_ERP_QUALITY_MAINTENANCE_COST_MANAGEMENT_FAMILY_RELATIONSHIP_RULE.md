# ============================================================
# ERP QUALITY MAINTENANCE COST MANAGEMENT FAMILY RELATIONSHIP RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2685
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_maintenance_cost_management.family_relationship_rule
component: quality-maintenance-cost-management-family-relationship-rule


# RULE

Quality management owns:
- inspection and nonconformance truth

Maintenance management owns:
- maintenance plan and equipment-service truth

Manufacturing cost management owns:
- production cost collection and variance truth

Manufacturing management owns:
- production execution truth

Inventory owns:
- stock truth

Accounting owns:
- posting truth

Asset management owns:
- asset registry truth

# CONSEQUENCE

Quality is not maintenance.
Maintenance is not cost management.
These modules may exchange references,
but they do not replace manufacturing / accounting / asset owned truths.

