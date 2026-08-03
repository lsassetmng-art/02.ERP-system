# ============================================================
# 52.master-data 佐藤（DB担当）レビュー用 READ-ONLY CHECKLIST
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
generated_at: 2026-04-29 11:42:45 +0900
module: 52.master-data
phase: sato-db-review-readonly-checklist
db_apply_status: STOPPED
psql_executed: NO
reviewer:
- 佐藤（DB担当）

# ============================================================
# 1. PURPOSE
# ============================================================

purpose:
- Prepare a DB review checklist for 032_DB_DDL_PROPOSAL_DRAFT.sql.
- Confirm this is still proposal-only.
- Confirm no DB apply happens in this step.
- Confirm design/API/DDL consistency before any future DDL apply.
- Confirm source transaction truth is not moved into master_data.

# ============================================================
# 2. REVIEW TARGETS
# ============================================================

review_targets:
- 031_DB_DDL_PROPOSAL_DRAFT_INDEX.md
- 032_DB_DDL_PROPOSAL_DRAFT.sql
- 033_DB_OBJECT_MAPPING_TO_API_PAYLOADS.md
- 034_DB_PRECHECK_AND_APPLY_STOP_GATE.md
- 035_DB_DDL_PROPOSAL_REVIEW_CHECKLIST.md
- 036_DB_DDL_PROPOSAL_DRAFT_VERIFY_REPORT.md

# ============================================================
# 3. HIGH PRIORITY REVIEW POINTS
# ============================================================

high_priority_review_points:
- schema name master_data is acceptable.
- pgcrypto dependency is acceptable.
- master_record and master_record_version structure is acceptable.
- current_master_version_id handling is acceptable.
- master_domain text check constraint is acceptable or should become catalog table.
- master_status text check constraint is acceptable or should become catalog table.
- JSONB attributes strategy is acceptable for v1.
- domain-specific tables are enough for v1.
- source module transaction truth is not stored in master_data.
- publication/acknowledgement/impact-review tables match API payloads.
- BI snapshot view is read-only projection.
- indexes are sufficient for v1.
- updated_at trigger function is acceptable.
- no hard delete workflow exists.
- no secrets are stored.
- future RLS can be layered safely.

# ============================================================
# 4. API CONSISTENCY REVIEW
# ============================================================

api_consistency_review:
- create draft API maps to master_record / master_record_version / domain table.
- update draft API can be supported.
- create version API can be supported.
- activate/deactivate API can be supported.
- identifier API maps to master_identifier.
- role assignment API maps to master_role_assignment.
- publication API maps to master_publication_package / master_publication_line.
- acknowledgement API maps to master_consumer_acknowledgement.
- impact review API maps to master_impact_review.
- BI snapshot API maps to vw_bi_master_dimension_snapshot.

# ============================================================
# 5. STOP CONDITIONS
# ============================================================

stop_conditions_for_review:
- If DDL contains source module transaction tables, STOP.
- If DDL stores credential/secret values, STOP.
- If DDL contains destructive drop table/drop schema, STOP.
- If DDL bypasses company scope, STOP.
- If DDL cannot support lineage, STOP.
- If DDL conflicts with existing ERP schema convention, STOP and revise.
- If RLS requirements must be designed before DDL, STOP and create RLS DDL draft first.

# ============================================================
# 6. REVIEW RESULT FIELD
# ============================================================

review_result:
- status: pending
- reviewer: 佐藤（DB担当）
- decision: not_reviewed
- reviewed_at: null
- required_changes: []
- approval_to_prepare_apply_block: false
- approval_to_apply_db: false

# ============================================================
