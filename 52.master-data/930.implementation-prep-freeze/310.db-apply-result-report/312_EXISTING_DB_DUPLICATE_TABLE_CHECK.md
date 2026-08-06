# 52.master-data Existing DB Duplicate Table Check

Generated: 2026-08-06 15:56:09 +0900

## Purpose

Confirm that DB apply did not create duplicate target tables, including same-name table collisions in other non-system schemas.

## Result

- READ_ONLY: on
- CANDIDATE_TABLE_COUNT: 20
- DISTINCT_CANDIDATE_TABLE_COUNT: 20
- EXISTING_CANDIDATE_TABLE_COUNT: 20
- CROSS_SCHEMA_DUPLICATE_TABLE_NAME_COUNT: 0
- UNEXPECTED_SCHEMA_TABLE_MATCH_COUNT: 0
- CROSS_SCHEMA_DUPLICATE_RELATION_NAME_COUNT: 0

## Interpretation

- Candidate list duplicate: none
- Exact reviewed table existence: 20/20
- Same-name candidate tables in unexpected schemas: none
- Cross-schema duplicate target table names: none

PostgreSQL does not have persistent table aliases equivalent to duplicate physical tables. Query aliases are temporary SQL expressions and are not DB objects.

## Detail Output

- DUP_CHECK_OUT: /data/data/com.termux/files/usr/tmp/20260806_155609_erp_52_master_data_db_apply_result_report_docs_commit_push_with_duplicate_table_check/031_DUPLICATE_TABLE_CHECK_READ_ONLY.out
- DUP_DETAIL_OUT: /data/data/com.termux/files/usr/tmp/20260806_155609_erp_52_master_data_db_apply_result_report_docs_commit_push_with_duplicate_table_check/033_DUPLICATE_TABLE_DETAIL_READ_ONLY.out
