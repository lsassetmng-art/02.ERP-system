# ============================================================
# 52.master-data DB OBJECT CANDIDATES FREEZE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
phase: implementation-prep-freeze
db_apply_status: STOPPED
db_env_later: DATABASE_URL
review_required:
- 佐藤（DB担当）

# ============================================================
# 1. DB PRINCIPLES
# ============================================================

db_principles:
- This file lists DB candidates only.
- No DDL is applied by this freeze.
- Actual SQL must be reviewed by 佐藤（DB担当） before apply.
- Later SQL must use:
  - psql "$DATABASE_URL" <<'SQL'
- DB objects must be additive.
- No destructive migration.
- No source module transaction truth belongs in master-data.

# ============================================================
# 2. SCHEMA CANDIDATE
# ============================================================

schema_candidate:
- master_data

note:
- If existing ERP schema convention differs, align before DDL.
- Do not apply without explicit approval.

# ============================================================
# 3. CORE TABLE CANDIDATES
# ============================================================

core_table_candidates:
- master_data.master_record
- master_data.master_record_version
- master_data.master_identifier
- master_data.master_role_assignment
- master_data.master_address_reference
- master_data.master_contact_point_reference
- master_data.master_merge_split_lineage
- master_data.master_publication_package
- master_data.master_publication_line
- master_data.master_consumer_acknowledgement
- master_data.master_impact_review
- master_data.source_extension_owner_matrix

# ============================================================
# 4. DOMAIN-SPECIFIC TABLE CANDIDATES
# ============================================================

business_partner_tables:
- master_data.business_partner_core
- master_data.customer_core
- master_data.supplier_core
- master_data.contact_person_reference
- master_data.customer_supplier_cross_role_reference

item_product_tables:
- master_data.item_core
- master_data.product_core
- master_data.item_product_relationship
- master_data.item_category
- master_data.product_family
- master_data.unit_of_measure
- master_data.unit_of_measure_conversion
- master_data.item_identifier

location_tables:
- master_data.address
- master_data.location_core
- master_data.site_core
- master_data.plant_reference
- master_data.warehouse_reference
- master_data.location_hierarchy
- master_data.location_identifier
- master_data.geo_reference
- master_data.location_usage_assignment

company_org_tables:
- master_data.company_reference
- master_data.legal_entity_reference
- master_data.organization_unit_reference
- master_data.department_reference
- master_data.position_reference
- master_data.cost_center_reference
- master_data.profit_center_reference
- master_data.organization_hierarchy
- master_data.organization_identifier
- master_data.organization_usage_assignment

# ============================================================
# 5. VIEW CANDIDATES
# ============================================================

view_candidates:
- master_data.vw_active_business_partner
- master_data.vw_active_customer
- master_data.vw_active_supplier
- master_data.vw_active_item
- master_data.vw_active_product
- master_data.vw_active_location
- master_data.vw_active_company_org
- master_data.vw_master_publication_status
- master_data.vw_module_master_reference_directory
- master_data.vw_bi_master_dimension_snapshot

# ============================================================
# 6. FUNCTION CANDIDATES
# ============================================================

function_candidates:
- master_data.fn_create_master_draft
- master_data.fn_create_master_version
- master_data.fn_activate_master_record
- master_data.fn_deactivate_master_record
- master_data.fn_create_publication_package
- master_data.fn_acknowledge_publication
- master_data.fn_register_impact_review
- master_data.fn_validate_master_identifier_unique
- master_data.fn_resolve_active_master_version

rules:
- Functions must not mutate source module transactions.
- Functions must preserve lineage.
- Functions must be company-scoped.
- Functions must not bypass RLS/authorization policy.

# ============================================================
# 7. ENUM / CHECK CANDIDATES
# ============================================================

enum_or_check_candidates:
- master_domain
- master_status
- publication_type
- publication_status
- acknowledgement_status
- impact_type
- role_type
- identifier_status
- effective_date_validity
- source_module_code

# ============================================================
# 8. INDEX CANDIDATES
# ============================================================

index_candidates:
- company_id + master_domain + code unique-active index
- master_record_id + master_version_id index
- master_domain + status index
- effective_from/effective_to range index
- identifier_type + identifier_value unique-active index
- publication_package_id index
- target_module + acknowledgement_status index
- source_extension_owner_matrix module/domain index

# ============================================================
# 9. AUDIT / LINEAGE COLUMNS
# ============================================================

standard_columns:
- id
- company_id
- created_at
- created_by
- updated_at
- updated_by
- deleted_at_or_null_for_soft_archive_if_used
- lineage_reference
- source_change_request_id_or_null
- approval_reference_or_null
- row_version_or_revision

rules:
- Avoid hard delete for master records.
- Prefer status transition and supersession.
- Historical source references must remain valid.

# ============================================================
# 10. NON-V1 DB CANDIDATES
# ============================================================

non_v1_db_candidates:
- high-volume import staging
- duplicate detection engine tables
- AI master suggestion tables
- external sync connector tables
- bank account secrets
- tax calculation engine
- EDI trading partner runtime
- OCR document intake

# ============================================================
# 11. DB APPLY STOP
# ============================================================

DB_APPLY_STOP:
- Do not apply DDL from this file.
- This is a candidate freeze only.
- DB apply requires:
  - explicit user approval
  - 佐藤（DB担当） review
  - rollback plan
  - read-only precheck
  - psql "$DATABASE_URL" one-block

# ============================================================
