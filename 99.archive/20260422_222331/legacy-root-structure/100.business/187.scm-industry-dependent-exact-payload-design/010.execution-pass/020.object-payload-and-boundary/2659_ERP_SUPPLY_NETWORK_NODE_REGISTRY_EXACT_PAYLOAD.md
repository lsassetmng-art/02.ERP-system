# ============================================================
# ERP SUPPLY NETWORK NODE REGISTRY EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2659
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.supply_network_node_registry.exact_payload
component: supply-network-node-registry-exact-payload


# OBJECT

supply_network_node_registry

Canonical payload:
- object_id
- company_id
- object_type = supply_network_node_registry
- status
- supply_network_node_registry_code
- node_status_code
- node_type_code
- node_reference_code
- node_region_code
- node_capacity_summary_text
- node_service_level_code
- upstream_node_reference_code
- downstream_node_reference_code
- created_at
- created_by
- updated_at
- updated_by

