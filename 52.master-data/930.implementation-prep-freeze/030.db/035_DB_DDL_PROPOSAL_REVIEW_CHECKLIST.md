# ============================================================
# DB DDL PROPOSAL REVIEW CHECKLIST
# 52.master-data
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
module: 52.master-data
review_required:
- 佐藤（DB担当）
db_apply_status: STOPPED

# ============================================================
# 1. REVIEW CHECKLIST
# ============================================================

checklist:
- schema name is acceptable
- table names are acceptable
- no source module transaction truth is stored in master_data
- master_record / master_record_version relationship is acceptable
- current_master_version_id update policy is acceptable
- identifier uniqueness rule is acceptable
- role assignment model is acceptable
- publication/acknowledgement model is acceptable
- impact review model is acceptable
- domain-specific tables are sufficient for v1
- JSONB usage is acceptable for v1 attributes
- indexes are acceptable
- updated_at trigger is acceptable
- views are acceptable
- no secrets are stored
- no destructive migration exists
- no RLS assumptions are hidden
- future RLS can be layered safely
- future API payloads can map to DDL
- future BI snapshot can be read-only
- future source module extension references are preserved

# ============================================================
# 2. KNOWN REVIEW POINTS
# ============================================================

known_review_points:
- Whether master_data schema name should be singular or follow another ERP convention.
- Whether domain-specific tables should be generic JSONB-heavy or fully normalized.
- Whether master_domain should be text check constraint or enum table.
- Whether current_master_version_id should have deferred FK after version table creation.
- Whether company_id should reference an existing company table later.
- Whether created_by/updated_by should be text or UUID.
- Whether publication target_module_set as text[] is acceptable.
- Whether JSONB payload_snapshot should be kept in publication_line.
- Whether RLS should be designed before or after DDL apply.

# ============================================================
# 3. REVIEW RESULT FIELD
# ============================================================

review_result:
- status: pending
- reviewer: 佐藤（DB担当）
- decision: not_reviewed
- reviewed_at: null
- notes: null

# ============================================================
