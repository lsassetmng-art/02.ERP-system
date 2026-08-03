# ============================================================
# 52.master-data DB DDL PROPOSAL DRAFT INDEX
# STOP付き・未適用
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
generated_at: 2026-04-29 07:52:25 +0900
module: 52.master-data
phase: db-ddl-proposal-draft
db_apply_status: STOPPED
db_env_later: DATABASE_URL
review_required:
- 佐藤（DB担当）

# ============================================================
# 1. PURPOSE
# ============================================================

purpose:
- Prepare DB DDL proposal draft for 52.master-data v1.
- Do not apply DB changes.
- Do not run psql.
- Keep this as design/proposal only.
- Align DB candidates with API exact payload freeze.
- Preserve master identity / version / effective-date / lineage.
- Keep source module transaction truth outside master_data.

# ============================================================
# 2. CREATED FILES
# ============================================================

created_files:
- 031_DB_DDL_PROPOSAL_DRAFT_INDEX.md
- 032_DB_DDL_PROPOSAL_DRAFT.sql
- 033_DB_OBJECT_MAPPING_TO_API_PAYLOADS.md
- 034_DB_PRECHECK_AND_APPLY_STOP_GATE.md
- 035_DB_DDL_PROPOSAL_REVIEW_CHECKLIST.md

# ============================================================
# 3. DDL PROPOSAL SCOPE
# ============================================================

schema_candidate:
- master_data

core_tables:
- master_data.master_record
- master_data.master_record_version
- master_data.master_identifier
- master_data.master_role_assignment
- master_data.master_publication_package
- master_data.master_publication_line
- master_data.master_consumer_acknowledgement
- master_data.master_impact_review
- master_data.source_extension_owner_matrix

domain_tables:
- master_data.business_partner_core
- master_data.customer_core
- master_data.supplier_core
- master_data.contact_person_reference
- master_data.item_core
- master_data.product_core
- master_data.unit_of_measure
- master_data.location_core
- master_data.company_reference
- master_data.legal_entity_reference
- master_data.organization_unit_reference

views:
- master_data.vw_active_master_record
- master_data.vw_master_publication_status
- master_data.vw_module_master_reference_directory
- master_data.vw_bi_master_dimension_snapshot

functions:
- master_data.fn_set_updated_at

# ============================================================
# 4. OUT OF SCOPE
# ============================================================

out_of_scope:
- DB apply
- RLS apply
- seed insert
- API implementation
- UI implementation
- source module transaction tables
- source module mutation functions
- hard delete workflow
- service role policy
- external sync
- high-volume import
- AI duplicate detection runtime

# ============================================================
# 5. STOP DECLARATION
# ============================================================

DB_APPLY_STOP:
- This proposal must not be executed yet.
- Any future DB apply requires explicit user approval.
- Any future DB apply requires 佐藤（DB担当） review.
- Any future SQL must use psql "$DATABASE_URL" one-block.
- This step only writes proposal files.

# ============================================================
