# ============================================================
# MASTER DATA INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 52.master-data

Customer lookup response example:
{
  "md_customer_id": "uuid",
  "customer_code": "CUST-0001",
  "customer_name": "Sample Trading",
  "status": "active"
}

Item lookup response example:
{
  "md_item_id": "uuid",
  "item_code": "ITEM-0001",
  "item_name": "Sample Item",
  "status": "active"
}

# P0 BUSINESS AIWORKER INTERFACE EXACT REFERENCE

p0_exact_reference:
- ../920.meta/9252000009_P0_MASTER_DATA_PHYSICAL_AUTHORITY_UI_OFFLINE_AIWORKER_EXACT.md

binding_rule:
- Business schema / Business AIWorker may consume published master references.
- AIWorker may propose authorized master changes but must not directly mutate
  canonical master_data truth.
