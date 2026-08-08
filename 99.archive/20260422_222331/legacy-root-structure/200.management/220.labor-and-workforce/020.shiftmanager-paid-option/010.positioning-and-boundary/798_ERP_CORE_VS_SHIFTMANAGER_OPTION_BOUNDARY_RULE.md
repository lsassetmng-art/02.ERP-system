# ============================================================
# ERP CORE VS SHIFTMANAGER OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-798
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_shiftmanager_option.boundary_rule
component: core-vs-shiftmanager-option-boundary-rule


# RULE

ERP core must remain operable without ShiftManager enabled.

Core may hold minimal staff reference or operational linkage,
but must not require:
- shift plan objects
- assignment objects
- swap workflows
- publication batches
- preference submissions


# CONSEQUENCE

ShiftManager enriches front-line allocation execution,
but non-ShiftManager tenants must not be forced into
its object presence.

