# ============================================================
# ERP CORE VS WMS OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-965
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_wms_option.boundary_rule
component: core-vs-wms-option-boundary-rule


# RULE

ERP core must remain operable without WMS enabled.

Core may hold minimal item and document linkage,
but must not require:
- warehouse location objects
- receipt execution objects
- pick execution objects
- count session objects
- discrepancy records


# CONSEQUENCE

WMS enriches physical stock execution capability,
but non-WMS tenants must not be forced into its object presence.

