# ============================================================
# ERP MANAGEMENT LAYER CHAIN MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1747
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_layer.chain_map
component: management-layer-chain-map


# MANAGEMENT LAYER CHAIN MAP

Primary chain A:
- management core
- governance and control

Primary chain B:
- management core
- EPM
- company_wide_mbo subsystem

Primary chain C:
- LaborManager
- management core

Primary chain D:
- LaborManager
- governance and control

Primary visibility chain:
- governance and control
- audit visibility

# RULE

Management core is the review and decision hub.
Governance and control is the policy and control hub.
EPM is the target and scorecard hub.
company_wide_mbo is an inherited-operation subsystem under EPM.
LaborManager remains the labor operation truth line.

