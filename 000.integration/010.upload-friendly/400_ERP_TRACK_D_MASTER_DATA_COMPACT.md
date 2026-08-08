# ============================================================
# ERP TRACK D MASTER DATA COMPACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track D
scope:
- 52.master-data
- all ERP source modules
- 60.business-intelligence

# 1. Ownership

ownership:
- 52.master-data owns shared identity/reference catalogs.
- 52.master-data owns master version/effective-date/lineage.
- 52.master-data owns duplicate/merge/split/deactivation/publication governance.
- Source modules own module-specific extensions and business transactions.
- BI owns analytical projection only.
- Approval may approve master changes, but does not apply master changes by itself.
- Audit may find master data issues, but does not correct master data by itself.

# 2. Master domains fixed

master_domains:
- business_partner
- customer
- supplier
- contact_person
- item
- product
- product_family
- item_category
- unit_of_measure
- UOM_conversion
- address
- location
- site
- plant_reference
- warehouse_reference
- company
- legal_entity
- organization_unit
- department
- position
- cost_center
- profit_center

# 3. Catalogs fixed

business_partner_catalog:
- business_partner_core_master
- customer_core_master
- supplier_core_master
- contact_person_reference_master
- business_partner_identifier
- business_partner_role_assignment
- business_partner_address_reference
- business_partner_contact_point_reference
- customer_supplier_cross_role_reference
- partner_merge_split_lineage

item_product_catalog:
- item_core_master
- product_core_master
- item_product_relationship
- item_category_master
- product_family_master
- unit_of_measure_master
- unit_of_measure_conversion
- item_identifier

location_catalog:
- address_master
- location_core_master
- site_core_master
- plant_reference_master
- warehouse_reference_master
- location_hierarchy
- location_identifier
- geo_reference
- location_usage_assignment

company_org_catalog:
- company_reference_master
- legal_entity_reference_master
- organization_unit_reference_master
- department_reference_master
- position_reference_catalog
- cost_center_reference_master
- profit_center_reference_master
- organization_hierarchy
- organization_identifier
- organization_usage_assignment

publication:
- master_catalog_publication_package
- master_catalog_publication_line
- master_catalog_consumer_acknowledgement
- master_catalog_impact_review

# 4. Source extension rule

source_extension_rule:
- Source extensions reference 52 master IDs.
- Source extensions store module-specific attributes.
- Source extensions do not redefine shared identity.
- If common identity is wrong, route correction to 52.
- If module-specific policy/state is wrong, correct in source module.

# 5. Forbidden shortcuts

forbidden:
- source modules creating shared master identities outside 52 workflow
- 52 editing source transactions directly
- master merge silently rewriting historical transactions
- master deactivation deleting historical source records
- source extension redefining shared master identity
- publication package silently rewriting source extensions
- source module rejection treated as master rollback
- BI dimension merge treated as master merge
- approval decision treated as master update without 52 apply step
- audit finding treated as master correction without 52/source workflow

# 6. Remaining gaps

remaining_gaps:
- bank account / payment route reference catalog
- tax registration / tax code / tax jurisdiction catalog
- chart of accounts and ledger setup catalog
- engineering change / item lifecycle catalog
- BOM / routing master catalog
- consent / privacy preference catalog
- master publication API exact payload
- master-data authorization / approval policy map
- master data quality rule catalog

# 7. Key source docs

source_docs:
- 9200000332_MASTER_DATA_CATALOG_BOUNDARY_MEMO.md
- 9252000004_BUSINESS_PARTNER_CUSTOMER_SUPPLIER_CONTACT_MASTER_CATALOG_EXACT.md
- 9252000005_ITEM_PRODUCT_UOM_MASTER_CATALOG_EXACT.md
- 9252000006_LOCATION_SITE_ADDRESS_WAREHOUSE_REFERENCE_CATALOG_EXACT.md
- 9252000007_COMPANY_LEGAL_ENTITY_ORGANIZATION_REFERENCE_CATALOG_EXACT.md
- 9252000008_MASTER_CATALOG_PUBLICATION_AND_SOURCE_EXTENSION_MATRIX_EXACT.md
- 9200000333_TRACK_D_MASTER_DATA_CATALOG_DEEPENING_INDEX.md
- 9200000334_TRACK_D_MASTER_DATA_CATALOG_COVERAGE_LEDGER.md

# ============================================================
