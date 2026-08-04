# 52.master-data Read-only DB Precheck Execution Summary

Generated: 2026-08-04 22:44:12 +0900

## Result

- PRECHECK_DECISION: PASS_READ_ONLY_DB_PRECHECK_COMPLETED
- PSQL_STATUS: 0
- READ_ONLY_TRANSACTION_CONFIRMED: YES
- SCHEMA_CANDIDATE_COUNT: 1
- TABLE_CANDIDATE_COUNT: 20
- OBJECT_RESULT_COUNT: 20
- RLS_RESULT_COUNT: 20

## psql

Executed with:

```bash
psql "$DATABASE_URL" -X -v ON_ERROR_STOP=1 -A -F $'\t' -f "/data/data/com.termux/files/usr/tmp/20260804_224412_erp_52_master_data_read_only_db_precheck/040_READ_ONLY_DB_PRECHECK.sql"
```

## SQL Safety

The generated SQL was scanned before execution.

Forbidden command families checked:

- INSERT
- UPDATE
- DELETE
- TRUNCATE
- CREATE
- ALTER
- DROP
- GRANT
- REVOKE
- COPY
- CALL
- DO
- MERGE
- VACUUM
- ANALYZE
- REINDEX
- REFRESH

## Error Log

- /data/data/com.termux/files/usr/tmp/20260804_224412_erp_52_master_data_read_only_db_precheck/061_PSQL_ERROR.log
