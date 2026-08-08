# ============================================================
# ERP CROSS FAMILY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2822
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family.boundary_rule
component: cross-family-boundary-rule


# RULE

Linkage surfaces are official contracts,
but they do not transfer canonical truth ownership.

# CONSEQUENCE

- a handoff row is not the source-family canonical object
- a handoff row is not the target-family canonical object
- acknowledgement does not imply ownership transfer of all semantics
- target-side completion must still occur in target-family owned truth

