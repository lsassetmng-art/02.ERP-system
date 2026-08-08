# ============================================================
# ERP SALES LEAD EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2374
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_lead.exact_payload
component: sales-lead-exact-payload


# OBJECT

sales_lead

Canonical payload:
- object_id
- company_id
- object_type = sales_lead
- status
- sales_lead_code
- lead_status_code
- linked_customer_account_id
- linked_customer_contact_id
- lead_source_code
- lead_owner_reference_code
- lead_priority_code
- qualification_state_code
- expected_value_amount
- created_at
- created_by
- updated_at
- updated_by

