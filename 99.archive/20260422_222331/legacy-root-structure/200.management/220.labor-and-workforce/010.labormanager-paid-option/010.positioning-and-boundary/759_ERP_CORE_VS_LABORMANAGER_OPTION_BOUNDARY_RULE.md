# ============================================================
# ERP CORE VS LABORMANAGER OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-759
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_labormanager_option.boundary_rule
component: core-vs-labormanager-option-boundary-rule


# RULE

ERP core must remain operable without LaborManager enabled.

Core may hold minimal worker or staff references needed
for cross-document linkage, but must not require:
- attendance objects
- leave workflows
- onboarding/offboarding cases
- training completion records
- compliance status objects


# CONSEQUENCE

LaborManager may enrich ERP-side labor governance,
but non-LaborManager tenants must not be forced into
its object presence.

