# ============================================================
# ERP ASSET MANAGEMENT EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2283
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management_exact_payload.canonical_scope
component: asset-management-exact-payload-canonical-scope


# IN SCOPE

- asset_master
- asset_acquisition_case
- asset_depreciation_cycle
- asset_transfer_case
- asset_disposal_case
- purchase linkage visibility
- accounting linkage visibility
- management approval visibility

# OUT OF SCOPE FOR THIS PASS

- depreciation journal internals
- tax engine redesign
- maintenance management deep redesign
- UI implementation source code

