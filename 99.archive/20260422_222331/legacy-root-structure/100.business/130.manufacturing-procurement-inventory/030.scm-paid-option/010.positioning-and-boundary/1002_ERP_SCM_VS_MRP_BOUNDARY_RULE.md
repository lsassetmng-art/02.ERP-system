# ============================================================
# ERP SCM VS MRP BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1002
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_vs_mrp.boundary_rule
component: scm-vs-mrp-boundary-rule


# SCM SIDE

SCM owns:
- broader supply network structure
- supplier and lane coordination
- replenishment coordination across sources and sites
- disruption and resilience interpretation
- network-wide supply continuity views


# MRP SIDE

MRP owns:
- demand interpretation
- BOM-driven material requirement planning
- requirement runs
- planned orders
- purchase recommendations
- planning exceptions


# RULE

SCM may consume MRP outputs and contextualize them
across the broader network.

SCM does not replace MRP as the BOM-driven planning owner.

