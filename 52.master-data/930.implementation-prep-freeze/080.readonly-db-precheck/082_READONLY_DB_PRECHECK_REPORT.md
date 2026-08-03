# ============================================================
# 52.master-data READONLY DB PRECHECK REPORT
# ============================================================
generated_at: 2026-05-15 06:03:39 +0900
module: 52.master-data
db_apply_status: STOPPED
psql_execution: READ_ONLY_SELECT_ONLY
sql_file: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/080.readonly-db-precheck/080_READONLY_DB_PRECHECK.sql
psql_log: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/080.readonly-db-precheck/081_READONLY_DB_PRECHECK_PSQL.log
psql_exit_code: 0

PASS: psql read-only precheck executed
PASS: DATABASE_URL connection confirmed
PASS: readonly final marker found
PASS: schema existence check executed
WARN: missing master_data objects detected; this is expected before DDL apply
PASS: SQL file contains no write/DDL-like statement

## PSQL LOG HEAD
    Pager usage is off.
    Output format is aligned.
                   check_title               
    -----------------------------------------
     ERP 52.master-data READONLY DB PRECHECK
    (1 row)
    
     current_database 
    ------------------
     postgres
    (1 row)
    
     current_user 
    --------------
     postgres
    (1 row)
    
              checked_at           
    -------------------------------
     2026-05-14 21:03:42.649824+00
    (1 row)
    
           check_name        |     result     
    -------------------------+----------------
     DATABASE_URL connection | PASS_CONNECTED
    (1 row)
    
            check_name         | result  
    ---------------------------+---------
     schema_master_data_exists | MISSING
    (1 row)
    
            check_name         | result 
    ---------------------------+--------
     pgcrypto_extension_exists | EXISTS
    (1 row)
    
       check_type   |           table_name            | result  
    ----------------+---------------------------------+---------
     expected_table | business_partner_core           | MISSING
     expected_table | company_reference               | MISSING
     expected_table | contact_person_reference        | MISSING
     expected_table | customer_core                   | MISSING
     expected_table | item_core                       | MISSING
     expected_table | legal_entity_reference          | MISSING
     expected_table | location_core                   | MISSING
     expected_table | master_consumer_acknowledgement | MISSING
     expected_table | master_identifier               | MISSING
     expected_table | master_impact_review            | MISSING
     expected_table | master_publication_line         | MISSING
     expected_table | master_publication_package      | MISSING
     expected_table | master_record                   | MISSING
     expected_table | master_record_version           | MISSING
     expected_table | master_role_assignment          | MISSING
     expected_table | organization_unit_reference     | MISSING
     expected_table | product_core                    | MISSING
     expected_table | source_extension_owner_matrix   | MISSING
     expected_table | supplier_core                   | MISSING
     expected_table | unit_of_measure                 | MISSING
    (20 rows)
    
      check_type   |              view_name               | result  
    ---------------+--------------------------------------+---------
     expected_view | vw_active_master_record              | MISSING
     expected_view | vw_bi_master_dimension_snapshot      | MISSING
     expected_view | vw_master_publication_status         | MISSING
     expected_view | vw_module_master_reference_directory | MISSING
    (4 rows)
    
        check_type     |     function_name     | result  
    -------------------+-----------------------+---------
     expected_function | fn_rls_actor_id       | MISSING
     expected_function | fn_rls_company_id     | MISSING
     expected_function | fn_rls_has_permission | MISSING
     expected_function | fn_rls_source_module  | MISSING
     expected_function | fn_set_updated_at     | MISSING
    (5 rows)
    
           check_name        | result 
    -------------------------+--------
     master_data_table_count | 0
    (1 row)
    
           check_name       | result 
    ------------------------+--------
     master_data_view_count | 0
    (1 row)
    
             check_name         | result 
    ----------------------------+--------
     master_data_function_count | 0
    (1 row)
    
           check_name        | result 
    -------------------------+--------
     rls_enabled_table_count | 0
    (1 row)
    
      check_name  | result 
    --------------+--------
     policy_count | 0
    (1 row)
    
            final_marker         
    -----------------------------
     READONLY_PRECHECK_COMPLETED
    (1 row)
    

## SUMMARY
PASS_COUNT=5
WARN_COUNT=1
FAIL_COUNT=0
FINAL_RESULT=PASS_READONLY_DB_PRECHECK
DB_APPLY_STATUS=STOPPED
DDL_APPLY=NO
RLS_APPLY=NO
WRITE_EXECUTED=NO
