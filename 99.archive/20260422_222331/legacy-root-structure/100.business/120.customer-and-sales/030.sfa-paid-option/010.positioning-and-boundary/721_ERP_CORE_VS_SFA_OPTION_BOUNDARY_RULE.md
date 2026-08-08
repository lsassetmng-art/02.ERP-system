# ============================================================
# ERP CORE VS SFA OPTION BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-721
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.core_vs_sfa_option.boundary_rule
component: core-vs-sfa-option-boundary-rule


# RULE

ERP core must remain operable without SFA enabled.

Core may hold lightweight references needed for
commercial document linkage, but must not require:
- opportunity objects
- forecast objects
- action queues
- stage progression logic


# CONSEQUENCE

SFA may enrich ERP-side commercial interpretation,
but non-SFA tenants must not be forced into SFA
object presence.

