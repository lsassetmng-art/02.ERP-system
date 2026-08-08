# ============================================================
# ERP COST COLLECTION TO ACCUMULATION PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2795
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cost_collection_to_accumulation_progression.rule
component: cost-collection-to-accumulation-progression-rule


# RULE

Collected cost visibility may justify actual-cost accumulation,
but cost-collection truth does not disappear.

Progression should preserve:
- linked production references
- material, labor, and overhead visibility
- collection basis visibility
- accumulation-period visibility
- adjustment trace when applicable

