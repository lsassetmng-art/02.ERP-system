# ============================================================
# ITEM / PRODUCT / UOM MASTER CATALOG EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
track: Track D
related_modules:
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

purpose:
Define exact shared master catalogs for item, product, item category,
product family, unit of measure, and conversion references without absorbing
inventory, warehouse, manufacturing, quality, costing, sales, or purchase
domain extensions.

canonical_role:
- shared item / product / UOM identity and reference truth

# ============================================================
# 1. CORE MASTER CATALOGS
# ============================================================

core_catalogs:
- item_core_master
- product_core_master
- item_product_relationship
- item_category_master
- product_family_master
- unit_of_measure_master
- unit_of_measure_conversion
- item_identifier
- item_status_lineage
- item_master_publication_package

# ============================================================
# 2. ITEM CORE MASTER
# ============================================================

object_name:
- item_core_master

meaning:
- shared ERP item identity used across sales, purchase, inventory,
  warehouse, manufacturing, quality, costing, and accounting.

required_fields:
- item_id
- company_scope_or_global_scope
- item_code
- item_name
- item_type
- item_category_id_or_null
- base_uom_id
- item_status
- current_master_version_id
- effective_from
- effective_to_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

item_type_examples:
- raw_material
- component
- semi_finished_good
- finished_good
- service_item
- non_stock_item
- packaging_material
- spare_part
- consumable
- asset_item
- phantom_item
- planning_item

allowed_item_status:
- draft
- active
- inactive
- blocked
- pending_review
- obsolete
- superseded
- merged
- split
- cancelled

rules:
- item core identity belongs to 52
- inventory stocking policy belongs to 12.inventory
- warehouse handling policy belongs to 13.warehouse
- manufacturing BOM/routing usage belongs to 15/16 as designated
- quality inspection specification belongs to 17.quality
- standard cost belongs to 18.costing
- sales price belongs to 01.sales
- purchase terms belong to 10.purchase / 11.procurement

# ============================================================
# 3. PRODUCT CORE MASTER
# ============================================================

object_name:
- product_core_master

meaning:
- shared sellable/product-facing identity where product differs from internal item.

required_fields:
- product_id
- company_scope_or_global_scope
- product_code
- product_name
- product_type
- product_family_id_or_null
- default_item_id_or_null
- product_status
- current_master_version_id
- effective_from
- effective_to_or_null
- lineage_reference

product_type_examples:
- sellable_product
- product_bundle
- service_product
- subscription_product
- configurable_product
- kit
- digital_product
- internal_product

allowed_product_status:
- draft
- active
- inactive
- discontinued
- blocked
- superseded
- cancelled

rules:
- product identity belongs to 52
- sales promotion and price conditions belong to 01.sales
- demand forecast category usage belongs to 06.demand-forecasting
- inventory stock identity may remain item_id
- product-to-item relationship must be explicit

# ============================================================
# 4. ITEM / PRODUCT RELATIONSHIP
# ============================================================

object_name:
- item_product_relationship

required_fields:
- item_product_relationship_id
- product_id
- item_id
- relationship_type
- quantity_per_product_or_null
- uom_id_or_null
- effective_from
- effective_to_or_null
- relationship_status
- lineage_reference

relationship_type_examples:
- default_item
- sellable_as
- bundle_component
- kit_component
- service_component
- substitute
- replacement
- equivalent
- predecessor_successor

allowed_relationship_status:
- draft
- active
- inactive
- superseded
- cancelled

rules:
- relationship belongs to 52 when shared reference
- BOM/component production structure may belong to manufacturing/planning if production-specific
- sales bundle commercial condition belongs to 01.sales
- inventory substitution execution belongs to relevant source module policy

# ============================================================
# 5. ITEM CATEGORY / PRODUCT FAMILY
# ============================================================

object_name:
- item_category_master

required_fields:
- item_category_id
- company_scope_or_global_scope
- category_code
- category_name
- parent_category_id_or_null
- category_type
- category_status
- effective_from
- effective_to_or_null
- lineage_reference

category_type_examples:
- material_category
- product_category
- service_category
- inventory_category
- purchase_category
- sales_category
- quality_category
- costing_category

object_name:
- product_family_master

required_fields:
- product_family_id
- company_scope_or_global_scope
- family_code
- family_name
- parent_family_id_or_null
- family_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- shared category/family identity belongs to 52
- module-specific category usage/config belongs to source modules
- BI may consume category hierarchy but not alter it

# ============================================================
# 6. UNIT OF MEASURE MASTER
# ============================================================

object_name:
- unit_of_measure_master

meaning:
- shared UOM identity.

required_fields:
- uom_id
- company_scope_or_global_scope
- uom_code
- uom_name
- uom_category
- decimal_precision
- active_flag
- effective_from
- effective_to_or_null
- lineage_reference

uom_category_examples:
- quantity
- weight
- volume
- length
- area
- time
- service_unit
- package
- currency_reference_only

rules:
- UOM identity belongs to 52
- module-specific rounding and tolerance may belong to source modules
- inventory ledger must preserve UOM lineage
- costing conversion must be traceable

# ============================================================
# 7. UNIT OF MEASURE CONVERSION
# ============================================================

object_name:
- unit_of_measure_conversion

required_fields:
- uom_conversion_id
- company_scope_or_global_scope
- from_uom_id
- to_uom_id
- conversion_factor
- item_id_or_category_id_or_null
- conversion_type
- effective_from
- effective_to_or_null
- conversion_status
- lineage_reference

conversion_type_examples:
- global
- item_specific
- category_specific
- packaging_specific
- planning_specific_reference
- costing_specific_reference

allowed_conversion_status:
- draft
- active
- inactive
- superseded
- cancelled

rules:
- common conversion belongs to 52
- planning/costing/inventory-specific conversion policy may be source extension
- conversion change must not silently rewrite historical quantities
- source transactions preserve original UOM and converted basis where required

# ============================================================
# 8. ITEM IDENTIFIER
# ============================================================

object_name:
- item_identifier

required_fields:
- item_identifier_id
- item_id
- identifier_type
- identifier_value
- issuing_context_or_null
- primary_flag
- effective_from
- effective_to_or_null
- identifier_status
- lineage_reference

identifier_type_examples:
- internal_item_code
- SKU
- barcode
- GTIN
- manufacturer_part_number
- supplier_part_number_reference
- legacy_item_code
- external_system_id

rules:
- item identifiers preserve mapping lineage
- supplier part usage may be purchase/procurement extension
- manufacturer part reference may be source extension if supplier/manufacturer-specific

# ============================================================
# 9. SOURCE MODULE EXTENSION MAP
# ============================================================

source_extension_map:
- 01.sales:
  - sales_price_condition
  - sales_discount_condition
  - sales_promotion_condition
  - product_bundle_commercial_rule
- 06.demand-forecasting:
  - forecast_category_mapping
  - product_family_forecast_policy
- 10.purchase:
  - supplier_item_terms
  - purchase_uom_preference
  - supplier_part_mapping
- 11.procurement:
  - supplier_item_qualification
  - sourcing_category_policy
- 12.inventory:
  - item_stocking_policy
  - reorder_policy
  - lot_serial_control_policy
  - inventory_valuation_reference_usage
- 13.warehouse:
  - item_handling_policy
  - storage_condition_policy
  - pick_pack_policy
- 14.logistics:
  - shipping_requirement_policy
  - hazardous_or_special_handling_reference
- 15.manufacturing:
  - BOM_usage
  - production_item_execution_policy
- 16.production-planning:
  - planning_policy
  - MRP_policy
  - CRP_policy
- 17.quality:
  - inspection_plan
  - quality_specification
  - sampling_rule
- 18.costing:
  - standard_cost
  - cost_component_structure
  - costing_UOM_policy
- 30.accounting:
  - accounting_item_posting_mapping

rules:
- extensions reference item_id/product_id/uom_id
- extensions do not redefine item identity

# ============================================================
# 10. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- inventory creating item master from stock transaction without 52 workflow
- warehouse creating item identity from scanned barcode without 52 workflow
- purchase supplier part number replacing item_id
- quality inspection spec redefining item master
- costing standard cost redefining item identity
- product bundle commercial rule silently changing product/item relationship
- UOM conversion change rewriting historical stock ledger
- BI product dimension edit treated as item master correction

# ============================================================
# 11. COMPLETION STATE
# ============================================================

completion_state:
- item/product/UOM master catalog fixed
- category/family hierarchy fixed
- item-product relationship fixed
- UOM conversion lineage fixed
- source extension map fixed

# ============================================================
