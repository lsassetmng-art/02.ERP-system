# ============================================================
# ERP ASSET ACQUISITION TO CAPITALIZATION READINESS RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2302
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset.acquisition_to_capitalization_readiness.rule
component: asset-acquisition-to-capitalization-readiness-rule


# RULE

Acquisition case may progress toward capitalization readiness,
but procurement truth and accounting posting truth remain separate.

Progression should preserve:
- purchase linkage reference
- supplier invoice linkage reference
- acquisition basis
- capitalization readiness state
- ready timestamp and actor visibility

