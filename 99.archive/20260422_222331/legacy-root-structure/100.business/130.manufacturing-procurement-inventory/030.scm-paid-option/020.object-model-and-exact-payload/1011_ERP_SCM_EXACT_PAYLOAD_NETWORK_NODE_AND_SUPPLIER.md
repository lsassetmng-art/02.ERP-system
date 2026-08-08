# ============================================================
# ERP SCM EXACT PAYLOAD NETWORK NODE AND SUPPLIER
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1011
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.exact_payload.network_node_and_supplier
component: scm-exact-payload-network-node-and-supplier


# OBJECT 1

scm_supply_network_node

Canonical payload:
- object_id
- company_id
- object_type = scm_supply_network_node
- status
- node_code
- node_name
- node_type_code
- node_status_code
- site_reference_code
- country_code
- risk_tier_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

scm_supplier_profile

Canonical payload:
- object_id
- company_id
- object_type = scm_supplier_profile
- status
- supplier_code
- supplier_name
- supplier_status_code
- primary_country_code
- supplier_tier_code
- lead_risk_code
- continuity_risk_code
- preferred_supplier_flag
- created_at
- created_by
- updated_at
- updated_by


# RULE

Network node is structural network truth.
Supplier profile is partner-side continuity and sourcing truth.

