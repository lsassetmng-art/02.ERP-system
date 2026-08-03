# ============================================================
# MASTER CATALOG PUBLICATION AND SOURCE EXTENSION MATRIX EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
track: Track D
scope:
- customer/supplier/item/location/company catalogs
- all ERP source modules

purpose:
Define how concrete master catalogs are published to source modules and how
source module extensions bind to master domains.

# ============================================================
# 1. PUBLICATION OBJECTS
# ============================================================

publication_objects:
- master_catalog_publication_package
- master_catalog_publication_line
- master_catalog_consumer_acknowledgement
- master_catalog_consumer_rejection
- master_catalog_impact_review

# ============================================================
# 2. MASTER CATALOG PUBLICATION PACKAGE
# ============================================================

object_name:
- master_catalog_publication_package

required_fields:
- publication_package_id
- company_scope_or_global_scope
- master_domain
- publication_type
- publication_reason
- master_record_reference_set
- master_version_reference_set
- target_module_set
- source_change_request_id_or_null
- publication_status
- created_at
- published_at_or_null
- lineage_reference

master_domain_examples:
- business_partner
- customer
- supplier
- contact_person
- item
- product
- unit_of_measure
- address
- location
- site
- warehouse_reference
- company
- legal_entity
- organization_unit
- department
- cost_center
- profit_center

publication_type_examples:
- full_snapshot
- delta_create
- delta_update
- deactivate_notice
- reactivate_notice
- merge_notice
- split_notice
- identifier_change
- hierarchy_change
- correction_notice

allowed_publication_status:
- building
- validation_pending
- published
- partially_acknowledged
- fully_acknowledged
- failed
- cancelled
- superseded

rules:
- publication package belongs to 52
- source modules acknowledge or reject by module validation
- publication does not rewrite source transactions
- publication lineage must be preserved

# ============================================================
# 3. PUBLICATION LINE
# ============================================================

object_name:
- master_catalog_publication_line

required_fields:
- publication_line_id
- publication_package_id
- master_domain
- master_record_id
- master_version_id
- change_type
- effective_from
- effective_to_or_null
- payload_reference
- lineage_reference

change_type_examples:
- create
- update
- deactivate
- reactivate
- merge
- split
- correction
- identifier_update
- hierarchy_update

rules:
- line identifies exact master/version/effective change
- source modules must not infer unlisted changes
- BI snapshots derive from publication/read model, not manual edits

# ============================================================
# 4. CONSUMER ACKNOWLEDGEMENT
# ============================================================

object_name:
- master_catalog_consumer_acknowledgement

required_fields:
- consumer_acknowledgement_id
- publication_package_id
- company_id
- target_module
- acknowledgement_status
- acknowledged_at_or_null
- rejection_reason_code_or_null
- rejection_detail_or_null
- impact_review_reference_or_null
- lineage_reference

allowed_acknowledgement_status:
- pending
- acknowledged
- acknowledged_with_warning
- rejected
- held_for_review
- failed
- superseded

rejection_reason_examples:
- MODULE_EXTENSION_CONFLICT
- OPEN_TRANSACTION_BLOCK
- EFFECTIVE_DATE_CONFLICT
- REQUIRED_MAPPING_MISSING
- DUPLICATE_CONFLICT
- POLICY_BLOCKED
- SOURCE_MODULE_VALIDATION_FAILED
- UNKNOWN_ERROR

rules:
- acknowledgement records source module response
- rejection does not automatically revert 52 master
- rejection may create data quality issue or impact review
- source module remains owner of extension conflict correction

# ============================================================
# 5. IMPACT REVIEW
# ============================================================

object_name:
- master_catalog_impact_review

required_fields:
- impact_review_id
- publication_package_id
- target_module
- impact_type
- affected_source_object_type_or_extension
- affected_source_object_count_or_reference
- recommended_action
- impact_status
- reviewed_at_or_null
- lineage_reference

impact_type_examples:
- open_transaction_impact
- extension_conflict
- deactivation_impact
- merge_split_impact
- hierarchy_change_impact
- reporting_dimension_impact
- policy_mapping_impact

recommended_action_examples:
- accept_publication
- hold_for_review
- request_master_correction
- correct_source_extension
- block_new_transaction
- allow_historical_only
- require_reapproval
- refresh_BI_dimension

rules:
- impact review does not change source truth by itself
- source module applies source correction if needed
- 52 applies master correction if master error exists

# ============================================================
# 6. MASTER DOMAIN TO CONSUMER MATRIX
# ============================================================

consumer_matrix:
- customer:
  - 03.crm
  - 02.sfa
  - 01.sales
  - 04.order-management
  - 05.billing
  - 30.accounting
  - 34.cash-management
  - 60.business-intelligence
- supplier:
  - 10.purchase
  - 11.procurement
  - 12.inventory
  - 13.warehouse
  - 17.quality
  - 30.accounting
  - 34.cash-management
  - 60.business-intelligence
- item_product_uom:
  - 01.sales
  - 06.demand-forecasting
  - 10.purchase
  - 11.procurement
  - 12.inventory
  - 13.warehouse
  - 14.logistics
  - 15.manufacturing
  - 16.production-planning
  - 17.quality
  - 18.costing
  - 30.accounting
  - 60.business-intelligence
- location_site_warehouse:
  - 12.inventory
  - 13.warehouse
  - 14.logistics
  - 15.manufacturing
  - 16.production-planning
  - 19.asset-management
  - 30.accounting
  - 40.human-resources
  - 41.labor-management
  - 60.business-intelligence
- company_legal_entity_organization:
  - 30.accounting
  - 31.management-accounting
  - 33.fixed-assets
  - 34.cash-management
  - 40.human-resources
  - 41.labor-management
  - 42.payroll
  - 50.approval
  - 51.audit
  - 60.business-intelligence

# ============================================================
# 7. SOURCE EXTENSION OWNER MATRIX
# ============================================================

extension_owner_matrix:
- CRM relationship/customer profile:
  - owner: 03.crm
  - master_reference: customer/business_partner/contact
- SFA pipeline/opportunity:
  - owner: 02.sfa
  - master_reference: customer/product/category
- Sales quote/price/promotion:
  - owner: 01.sales
  - master_reference: customer/product/item/channel/region
- Procurement supplier qualification:
  - owner: 11.procurement
  - master_reference: supplier/item/category
- Purchase supplier commercial terms:
  - owner: 10.purchase
  - master_reference: supplier/item/UOM/currency
- Inventory stocking/lot/serial policy:
  - owner: 12.inventory
  - master_reference: item/location/warehouse/UOM
- Warehouse bin/zone/task policy:
  - owner: 13.warehouse
  - master_reference: warehouse/location/item
- Logistics route/carrier handling:
  - owner: 14.logistics
  - master_reference: location/address/customer/supplier/item
- Manufacturing execution:
  - owner: 15.manufacturing
  - master_reference: item/plant/location/UOM
- Production planning:
  - owner: 16.production-planning
  - master_reference: item/product/plant/UOM/calendar
- Quality inspection:
  - owner: 17.quality
  - master_reference: item/supplier/plant/UOM
- Costing:
  - owner: 18.costing
  - master_reference: item/plant/UOM/currency/cost center
- Asset management:
  - owner: 19.asset-management
  - master_reference: asset_item/location/organization
- Accounting:
  - owner: 30.accounting
  - master_reference: legal_entity/company/currency/customer/supplier/cost center
- Fixed assets:
  - owner: 33.fixed-assets
  - master_reference: legal_entity/location/organization/asset_item
- Cash management:
  - owner: 34.cash-management
  - master_reference: company/legal_entity/customer/supplier/currency/bank reference
- HR:
  - owner: 40.human-resources
  - master_reference: organization/department/position/location
- Labor:
  - owner: 41.labor-management
  - master_reference: worker_reference_from_HR/organization/location
- Payroll:
  - owner: 42.payroll
  - master_reference: worker_reference_from_HR/legal_entity/organization/currency
- Approval:
  - owner: 50.approval
  - master_reference: organization/position/role references
- Audit:
  - owner: 51.audit
  - master_reference: organization/location/source module references

# ============================================================
# 8. FORBIDDEN PUBLICATION SHORTCUTS
# ============================================================

forbidden_shortcuts:
- publication package silently rewriting source transactions
- consumer acknowledgement treated as source correction
- source module rejection treated as master rollback
- BI dimension refresh treated as consumer acknowledgement
- source extension conflict ignored after publication
- master deactivation applied to open transaction without module impact review
- merge/split applied without source publication lineage

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- master catalog publication exact design fixed
- consumer acknowledgement and impact review fixed
- master-domain-to-consumer matrix fixed
- source extension owner matrix fixed

# ============================================================
