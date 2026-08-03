\pset pager off
\pset tuples_only off
\pset format aligned

select 'ERP 52.master-data READONLY DB PRECHECK' as check_title;
select current_database() as current_database;
select current_user as current_user;
select now() as checked_at;

select
  'DATABASE_URL connection' as check_name,
  'PASS_CONNECTED' as result;

select
  'schema_master_data_exists' as check_name,
  case when exists (
    select 1
    from information_schema.schemata
    where schema_name = 'master_data'
  ) then 'EXISTS'
  else 'MISSING'
  end as result;

select
  'pgcrypto_extension_exists' as check_name,
  case when exists (
    select 1
    from pg_extension
    where extname = 'pgcrypto'
  ) then 'EXISTS'
  else 'MISSING'
  end as result;

with expected_tables(table_name) as (
  values
    ('master_record'),
    ('master_record_version'),
    ('master_identifier'),
    ('master_role_assignment'),
    ('master_publication_package'),
    ('master_publication_line'),
    ('master_consumer_acknowledgement'),
    ('master_impact_review'),
    ('source_extension_owner_matrix'),
    ('business_partner_core'),
    ('customer_core'),
    ('supplier_core'),
    ('contact_person_reference'),
    ('item_core'),
    ('product_core'),
    ('unit_of_measure'),
    ('location_core'),
    ('company_reference'),
    ('legal_entity_reference'),
    ('organization_unit_reference')
)
select
  'expected_table' as check_type,
  e.table_name,
  case when t.table_name is not null then 'EXISTS' else 'MISSING' end as result
from expected_tables e
left join information_schema.tables t
  on t.table_schema = 'master_data'
 and t.table_name = e.table_name
order by e.table_name;

with expected_views(view_name) as (
  values
    ('vw_active_master_record'),
    ('vw_master_publication_status'),
    ('vw_module_master_reference_directory'),
    ('vw_bi_master_dimension_snapshot')
)
select
  'expected_view' as check_type,
  e.view_name,
  case when v.table_name is not null then 'EXISTS' else 'MISSING' end as result
from expected_views e
left join information_schema.views v
  on v.table_schema = 'master_data'
 and v.table_name = e.view_name
order by e.view_name;

with expected_functions(function_name) as (
  values
    ('fn_set_updated_at'),
    ('fn_rls_company_id'),
    ('fn_rls_actor_id'),
    ('fn_rls_source_module'),
    ('fn_rls_has_permission')
)
select
  'expected_function' as check_type,
  e.function_name,
  case when r.routine_name is not null then 'EXISTS' else 'MISSING' end as result
from expected_functions e
left join information_schema.routines r
  on r.routine_schema = 'master_data'
 and r.routine_name = e.function_name
order by e.function_name;

select
  'master_data_table_count' as check_name,
  count(*)::text as result
from information_schema.tables
where table_schema = 'master_data'
  and table_type = 'BASE TABLE';

select
  'master_data_view_count' as check_name,
  count(*)::text as result
from information_schema.views
where table_schema = 'master_data';

select
  'master_data_function_count' as check_name,
  count(*)::text as result
from information_schema.routines
where routine_schema = 'master_data';

select
  'rls_enabled_table_count' as check_name,
  count(*)::text as result
from pg_class c
join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'master_data'
  and c.relkind = 'r'
  and c.relrowsecurity = true;

select
  'policy_count' as check_name,
  count(*)::text as result
from pg_policies
where schemaname = 'master_data';

select
  'READONLY_PRECHECK_COMPLETED' as final_marker;
