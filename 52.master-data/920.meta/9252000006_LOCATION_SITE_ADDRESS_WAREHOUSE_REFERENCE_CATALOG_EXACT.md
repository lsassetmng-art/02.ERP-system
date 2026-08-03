# ============================================================
# LOCATION / SITE / ADDRESS / WAREHOUSE REFERENCE
# MASTER CATALOG EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
track: Track D
related_modules:
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

purpose:
Define exact shared master catalogs for location, site, address, and warehouse
reference identities without absorbing warehouse operations, inventory stock,
logistics routing, manufacturing plant execution, HR assignment, or accounting
mapping truth.

canonical_role:
- shared location / site / address / warehouse reference identity truth

# ============================================================
# 1. CORE MASTER CATALOGS
# ============================================================

core_catalogs:
- address_master
- location_core_master
- site_core_master
- plant_reference_master
- warehouse_reference_master
- location_hierarchy
- location_identifier
- geo_reference
- location_usage_assignment

# ============================================================
# 2. ADDRESS MASTER
# ============================================================

object_name:
- address_master

meaning:
- shared address reference used by customer, supplier, site, warehouse,
  billing, shipping, HR, and logistics.

required_fields:
- address_id
- company_scope_or_global_scope
- address_code_or_reference
- address_name_or_label_or_null
- country_or_region_code
- postal_code_or_null
- administrative_area_or_null
- city_or_locality_or_null
- address_line_1_or_null
- address_line_2_or_null
- address_line_3_or_null
- geo_reference_id_or_null
- address_status
- effective_from
- effective_to_or_null
- lineage_reference

allowed_address_status:
- draft
- active
- inactive
- invalid
- deprecated
- merged
- cancelled
- superseded

rules:
- common address identity belongs to 52
- delivery execution belongs to 14.logistics
- billing address usage belongs to 05.billing extension where billing-specific
- supplier/customer address usage is role reference, not address identity

# ============================================================
# 3. LOCATION CORE MASTER
# ============================================================

object_name:
- location_core_master

meaning:
- shared location identity used across inventory, warehouse, logistics,
  manufacturing, asset, HR, and accounting contexts.

required_fields:
- location_id
- company_id
- location_code
- location_name
- location_type
- address_id_or_null
- parent_location_id_or_null
- location_status
- current_master_version_id
- effective_from
- effective_to_or_null
- lineage_reference

location_type_examples:
- site
- plant
- warehouse
- store
- office
- distribution_center
- production_area
- yard
- customer_location
- supplier_location
- virtual_location
- cost_location

allowed_location_status:
- draft
- active
- inactive
- blocked
- deprecated
- merged
- split
- cancelled
- superseded

rules:
- common location identity belongs to 52
- inventory stock balance belongs to 12.inventory
- warehouse task/bin/zone belongs to 13.warehouse
- logistics route/delivery belongs to 14.logistics
- manufacturing execution belongs to 15.manufacturing
- HR work assignment belongs to 40/41 as applicable

# ============================================================
# 4. SITE CORE MASTER
# ============================================================

object_name:
- site_core_master

meaning:
- shared site identity grouping locations for business operations.

required_fields:
- site_id
- company_id
- site_code
- site_name
- site_type
- primary_location_id_or_null
- address_id_or_null
- site_status
- effective_from
- effective_to_or_null
- lineage_reference

site_type_examples:
- corporate_office
- plant
- warehouse_site
- store_site
- restaurant_site
- service_site
- data_center
- distribution_site
- project_site
- virtual_site

allowed_site_status:
- draft
- active
- inactive
- closed
- deprecated
- cancelled
- superseded

rules:
- site identity belongs to 52
- store audit findings belong to 51.audit
- site operations belong to relevant source modules
- site closure does not delete historical transactions

# ============================================================
# 5. PLANT REFERENCE MASTER
# ============================================================

object_name:
- plant_reference_master

meaning:
- shared plant reference for manufacturing/planning/inventory/costing.

required_fields:
- plant_id
- company_id
- plant_code
- plant_name
- site_id_or_location_id
- plant_status
- effective_from
- effective_to_or_null
- lineage_reference

allowed_plant_status:
- draft
- active
- inactive
- closed
- blocked
- cancelled
- superseded

rules:
- plant reference identity may be held in 52 when shared
- production execution belongs to 15.manufacturing
- production planning belongs to 16.production-planning
- plant capacity policy may be 16 extension
- plant costing area may be 18/30 extension

# ============================================================
# 6. WAREHOUSE REFERENCE MASTER
# ============================================================

object_name:
- warehouse_reference_master

meaning:
- shared warehouse identity reference; operational layout remains warehouse module.

required_fields:
- warehouse_id
- company_id
- warehouse_code
- warehouse_name
- site_id_or_location_id
- warehouse_type
- warehouse_status
- effective_from
- effective_to_or_null
- lineage_reference

warehouse_type_examples:
- raw_material
- finished_goods
- distribution
- cold_storage
- quarantine
- return_center
- store_backroom
- spare_parts
- virtual

allowed_warehouse_status:
- draft
- active
- inactive
- closed
- blocked
- cancelled
- superseded

rules:
- warehouse reference identity belongs to 52 if shared
- bin/zone/task/receiving/picking belongs to 13.warehouse
- stock ledger/balance belongs to 12.inventory
- logistics shipment belongs to 14.logistics

# ============================================================
# 7. LOCATION HIERARCHY
# ============================================================

object_name:
- location_hierarchy

required_fields:
- location_hierarchy_id
- company_id
- parent_location_id
- child_location_id
- hierarchy_type
- effective_from
- effective_to_or_null
- hierarchy_status
- lineage_reference

hierarchy_type_examples:
- geographical
- operational
- accounting
- logistics
- warehouse_grouping
- manufacturing_grouping
- HR_work_location_grouping

rules:
- shared hierarchy belongs to 52 when cross-module
- module-specific hierarchy may be source extension
- accounting hierarchy belongs to 30/31 where accounting-specific
- warehouse internal hierarchy belongs to 13 if bin/zone operational

# ============================================================
# 8. LOCATION IDENTIFIER / GEO REFERENCE
# ============================================================

object_name:
- location_identifier

required_fields:
- location_identifier_id
- location_id
- identifier_type
- identifier_value
- issuing_context_or_null
- primary_flag
- effective_from
- effective_to_or_null
- identifier_status
- lineage_reference

identifier_type_examples:
- internal_location_code
- store_code
- plant_code
- warehouse_code
- external_site_code
- legacy_location_code
- GPS_reference
- EDI_location_code

object_name:
- geo_reference

required_fields:
- geo_reference_id
- latitude_or_null
- longitude_or_null
- geo_precision_or_null
- timezone_reference_or_null
- country_or_region_code
- geo_status
- lineage_reference

rules:
- geo reference is shared reference only
- route optimization/execution belongs to logistics
- weather/delivery impact analysis belongs to relevant source/BI modules if added

# ============================================================
# 9. LOCATION USAGE ASSIGNMENT
# ============================================================

object_name:
- location_usage_assignment

meaning:
- assigns shared location/site/address reference to module usage without
  transferring module operation ownership to 52.

required_fields:
- location_usage_assignment_id
- company_id
- location_id_or_site_id_or_address_id
- usage_module
- usage_type
- usage_status
- effective_from
- effective_to_or_null
- lineage_reference

usage_module_examples:
- 12.inventory
- 13.warehouse
- 14.logistics
- 15.manufacturing
- 16.production-planning
- 19.asset-management
- 30.accounting
- 40.human-resources
- 41.labor-management

usage_type_examples:
- stock_location
- warehouse_operation_location
- delivery_origin
- delivery_destination
- production_plant
- planning_area
- asset_location
- cost_center_location
- employee_work_location
- store_operation_location

rules:
- usage assignment is reference mapping
- usage policy/operation belongs to source module
- deactivation requires downstream impact publication

# ============================================================
# 10. SOURCE MODULE EXTENSION MAP
# ============================================================

source_extension_map:
- 12.inventory:
  - inventory_location_policy
  - stock_status_by_location
  - location_balance
- 13.warehouse:
  - warehouse_zone
  - warehouse_bin
  - receiving_area
  - staging_area
  - pick_path
- 14.logistics:
  - route_plan
  - delivery_stop
  - carrier_service_area
- 15.manufacturing:
  - production_line_location
  - work_center_location
- 16.production-planning:
  - planning_area
  - capacity_area
- 19.asset-management:
  - operational_asset_location_custody
- 30.accounting:
  - accounting_location_mapping
- 40.human-resources:
  - work_location_assignment
- 41.labor-management:
  - shift_work_location

rules:
- source extensions reference location_id/site_id/address_id/warehouse_id
- source extensions do not redefine shared location identity

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- warehouse bin treated as shared warehouse identity
- logistics delivery address correction silently changing address master
- inventory stock location creating common site identity without 52 workflow
- manufacturing work center redefining plant master
- HR work location correction changing warehouse operation location directly
- site closure deleting historical stock/order/invoice/journal records
- BI location dimension merge replacing 52 merge workflow

# ============================================================
# 12. COMPLETION STATE
# ============================================================

completion_state:
- location/site/address/warehouse reference catalog fixed
- plant and warehouse reference rules fixed
- location usage assignment fixed
- source extension map fixed

# ============================================================
