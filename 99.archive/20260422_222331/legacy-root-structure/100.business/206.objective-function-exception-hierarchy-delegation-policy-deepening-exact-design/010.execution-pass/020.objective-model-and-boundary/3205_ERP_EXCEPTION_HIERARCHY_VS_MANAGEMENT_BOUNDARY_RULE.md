# ============================================================
# ERP EXCEPTION HIERARCHY VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3205
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.exception_hierarchy_vs_management.boundary_rule
component: exception-hierarchy-vs-management-boundary-rule


# RULE

Exception hierarchy owns:
- exception routing interpretation
- critical-route interpretation
- review-path interpretation

Management owns:
- higher-order approval and policy truth

# CONSEQUENCE

An exception-routing profile is not management policy truth.
A resolution case may require management visibility,
but it does not replace management-owned truth.

