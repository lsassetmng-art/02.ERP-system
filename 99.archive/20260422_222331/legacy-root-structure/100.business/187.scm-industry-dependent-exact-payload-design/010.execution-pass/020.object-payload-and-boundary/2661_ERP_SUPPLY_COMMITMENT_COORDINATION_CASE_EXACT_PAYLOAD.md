# ============================================================
# ERP SUPPLY COMMITMENT COORDINATION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2661
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.supply_commitment_coordination_case.exact_payload
component: supply-commitment-coordination-case-exact-payload


# OBJECT

supply_commitment_coordination_case

Canonical payload:
- object_id
- company_id
- object_type = supply_commitment_coordination_case
- status
- supply_commitment_coordination_case_code
- coordination_status_code
- coordination_scope_code
- linked_purchase_reference_code
- linked_sales_demand_reference_code
- linked_transfer_plan_case_id
- committed_supply_quantity
- committed_due_date
- coordination_summary_text
- created_at
- created_by
- updated_at
- updated_by

