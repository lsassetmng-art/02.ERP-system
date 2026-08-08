# ============================================================
# ERP SCM NETWORK SUPPLIER LANE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1018
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.network_supplier_lane_contracts
component: scm-network-supplier-lane-contracts


# NETWORK NODE LIST REQUEST BODY

- node_type_code_set
- node_status_code_set
- country_code_set
- risk_tier_code_set
- page
- page_size


# SUPPLY LANE WRITE REQUEST BODY

- origin_node_id
- destination_node_id
- supplier_profile_id
- lane_status_code
- transit_lead_days
- lane_capacity_unit_code
- lane_capacity_value
- continuity_priority_code


# RULE

Network node maintenance and supply lane definition
must remain separate controlled actions.

