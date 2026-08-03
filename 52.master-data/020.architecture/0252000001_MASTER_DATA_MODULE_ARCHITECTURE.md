# ============================================================
# MASTER DATA MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 52.master-data

## 1. Logical components
1. Party Reference Service
2. Item / Catalog Reference Service
3. Org / Workforce Reference Service
4. Warehouse / Location Reference Service
5. Finance / Tax / Payment Reference Service
6. Search / Lookup Projection Service

## 2. Main aggregates
- md_customer
- md_supplier
- md_item
- md_org_unit
- md_location
- md_finance_reference
- md_reference_change_log

## 3. Inbound dependencies
None for canon ownership beyond approved maintenance actions.

## 4. Outbound surfaces
To all ERP modules:
- shared lookup/reference payloads
- identity/reference validation surfaces

## 5. Rule
Master Data owns shared reference truth only.
It does not own module-specific transaction status or operational result truth.
