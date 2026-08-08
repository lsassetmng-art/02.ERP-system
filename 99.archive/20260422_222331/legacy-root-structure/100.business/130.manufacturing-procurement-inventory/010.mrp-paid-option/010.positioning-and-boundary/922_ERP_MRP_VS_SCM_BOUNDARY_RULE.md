# ============================================================
# ERP MRP VS SCM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-922
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_vs_scm.boundary_rule
component: mrp-vs-scm-boundary-rule


# MRP SIDE

MRP owns:
- BOM-driven requirement planning
- material requirement runs
- planned order generation
- purchase recommendation generation
- lead-time-aware requirement timing
- exception visibility for supply shortage


# SCM SIDE

SCM should own:
- broader supply network planning
- supplier and lane orchestration
- multi-echelon supply interpretation
- external supply-chain coordination
- broader network risk and resilience handling


# RULE

MRP may feed SCM, but MRP does not replace SCM as
the broader network planning layer.

