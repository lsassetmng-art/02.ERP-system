# ============================================================
# 52.master-data DDL LINT READONLY PRECHECK REPORT
# ============================================================
generated_at: 2026-04-29 11:42:45 +0900
ddl: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/032_DB_DDL_PROPOSAL_DRAFT.sql
db_apply_status: STOPPED
psql_executed: NO

## 1. File existence
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/032_DB_DDL_PROPOSAL_DRAFT.sql
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/031_DB_DDL_PROPOSAL_DRAFT_INDEX.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/033_DB_OBJECT_MAPPING_TO_API_PAYLOADS.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/034_DB_PRECHECK_AND_APPLY_STOP_GATE.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/035_DB_DDL_PROPOSAL_REVIEW_CHECKLIST.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/037_SATO_DB_REVIEW_READONLY_CHECKLIST.md

## 2. Required STOP / review terms
PASS: DDL contains DO NOT RUN warning
PASS: DDL contains STOPPED status
PASS: DDL contains Sato review requirement
PASS: DDL contains future DATABASE_URL psql format
PASS: DDL contains master_data schema proposal
PASS: DDL contains pgcrypto proposal

## 3. Required core objects
PASS: required object exists in DDL: master_data.master_record
PASS: required object exists in DDL: master_data.master_record_version
PASS: required object exists in DDL: master_data.master_identifier
PASS: required object exists in DDL: master_data.master_role_assignment
PASS: required object exists in DDL: master_data.master_publication_package
PASS: required object exists in DDL: master_data.master_publication_line
PASS: required object exists in DDL: master_data.master_consumer_acknowledgement
PASS: required object exists in DDL: master_data.master_impact_review
PASS: required object exists in DDL: master_data.source_extension_owner_matrix
PASS: required object exists in DDL: master_data.business_partner_core
PASS: required object exists in DDL: master_data.customer_core
PASS: required object exists in DDL: master_data.supplier_core
PASS: required object exists in DDL: master_data.item_core
PASS: required object exists in DDL: master_data.product_core
PASS: required object exists in DDL: master_data.unit_of_measure
PASS: required object exists in DDL: master_data.location_core
PASS: required object exists in DDL: master_data.company_reference
PASS: required object exists in DDL: master_data.legal_entity_reference
PASS: required object exists in DDL: master_data.organization_unit_reference
PASS: required object exists in DDL: master_data.vw_active_master_record
PASS: required object exists in DDL: master_data.vw_master_publication_status
PASS: required object exists in DDL: master_data.vw_module_master_reference_directory
PASS: required object exists in DDL: master_data.vw_bi_master_dimension_snapshot

## 4. Destructive / unsafe SQL absence check
PASS: no DROP SCHEMA
PASS: no DROP TABLE
PASS: no TRUNCATE TABLE
PASS: no DELETE FROM
PASS: no ALTER TABLE DROP COLUMN
PASS: no DROP DATABASE
PASS: no CREATE DATABASE
PASS: no service_role grant
PASS: no secret-like value terms

## 5. Object count summary
TABLE_COUNT=20
INDEX_COUNT=29
VIEW_COUNT=4
FUNCTION_COUNT=1
TRIGGER_COUNT=7
PASS: table count is plausible
PASS: view count is plausible
PASS: function count is plausible

## 6. Boundary checks
PASS: no obvious transaction table names in master_data DDL
PASS: lineage_reference appears
PASS: company_id appears
PASS: effective_from appears
PASS: effective_to appears

## 7. Summary
PASS_COUNT=52
WARN_COUNT=0
FAIL_COUNT=0
FINAL_RESULT=PASS_READONLY_LINT
