# ============================================================
# ERP ASSET TRANSFER AND CUSTODY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2304
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset.transfer_and_custody.rule
component: asset-transfer-and-custody-rule


# RULE

Transfer may progress under approval control,
but transfer truth must preserve:
- linked asset reference
- from and to custodian
- from and to location
- effective timestamp
- approval state
- completion visibility

