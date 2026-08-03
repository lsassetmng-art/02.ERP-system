# ============================================================
# MASTER DATA MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 52.master-data

Entities:
- md_customer
- md_supplier
- md_item
- md_org_unit
- md_location
- md_finance_reference
- md_reference_change_log

Status canon:
- draft
- active
- deprecated
- archived

Invariant:
- shared references must remain uniquely identifiable
- deprecated references remain historically referencable
