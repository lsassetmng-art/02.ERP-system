-- ============================================================
-- 52.master-data DB DDL PROPOSAL DRAFT
-- STOP付き・未適用
-- ============================================================
--
-- status: DRAFT_ONLY
-- module: 52.master-data
-- db_apply_status: STOPPED
--
-- IMPORTANT:
-- - DO NOT RUN THIS FILE YET.
-- - This file is a DDL proposal draft only.
-- - Future apply requires explicit user approval.
-- - Future apply requires 佐藤（DB担当） review.
-- - Future apply must use:
--     psql "$DATABASE_URL" <<'SQL'
-- - No DB changes are performed by generating this file.
--
-- ============================================================

-- ============================================================
-- 0. EXTENSION / SCHEMA CANDIDATES
-- ============================================================

create schema if not exists master_data;

create extension if not exists pgcrypto;

-- ============================================================
-- 1. COMMON UPDATED_AT FUNCTION CANDIDATE
-- ============================================================

create or replace function master_data.fn_set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- ============================================================
-- 2. CORE MASTER RECORD
-- ============================================================

create table if not exists master_data.master_record (
  master_record_id uuid primary key default gen_random_uuid(),
  company_id uuid not null,
  master_domain text not null,
  master_code text not null,
  master_name text not null,
  display_name text,
  master_status text not null default 'draft',
  current_master_version_id uuid,
  effective_from date not null,
  effective_to date,
  lineage_reference text not null,
  source_change_request_id text,
  approval_reference text,
  created_at timestamptz not null default now(),
  created_by text not null default 'system',
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint master_record_effective_date_ck
    check (effective_to is null or effective_to >= effective_from),
  constraint master_record_status_ck
    check (master_status in (
      'draft',
      'review_pending',
      'active',
      'inactive',
      'blocked',
      'pending_review',
      'duplicate_candidate',
      'merged',
      'split',
      'deprecated',
      'cancelled',
      'superseded'
    )),
  constraint master_record_domain_ck
    check (master_domain in (
      'business_partner',
      'customer',
      'supplier',
      'contact_person',
      'item',
      'product',
      'item_category',
      'product_family',
      'unit_of_measure',
      'unit_of_measure_conversion',
      'address',
      'location',
      'site',
      'plant_reference',
      'warehouse_reference',
      'company',
      'legal_entity',
      'organization_unit',
      'department',
      'position',
      'cost_center',
      'profit_center'
    ))
);

create unique index if not exists uq_master_record_company_domain_code_active
on master_data.master_record(company_id, master_domain, master_code)
where master_status in ('draft', 'review_pending', 'active', 'blocked', 'pending_review', 'duplicate_candidate');

create index if not exists ix_master_record_company_domain_status
on master_data.master_record(company_id, master_domain, master_status);

create index if not exists ix_master_record_effective_range
on master_data.master_record(company_id, master_domain, effective_from, effective_to);

drop trigger if exists trg_master_record_updated_at on master_data.master_record;
create trigger trg_master_record_updated_at
before update on master_data.master_record
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 3. MASTER RECORD VERSION
-- ============================================================

create table if not exists master_data.master_record_version (
  master_version_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  master_domain text not null,
  version_number integer not null,
  version_status text not null default 'draft',
  effective_from date not null,
  effective_to date,
  version_payload jsonb not null default '{}'::jsonb,
  change_reason text,
  lineage_reference text not null,
  source_change_request_id text,
  approval_reference text,
  created_at timestamptz not null default now(),
  created_by text not null default 'system',
  constraint master_record_version_effective_date_ck
    check (effective_to is null or effective_to >= effective_from),
  constraint master_record_version_status_ck
    check (version_status in (
      'draft',
      'review_pending',
      'active',
      'inactive',
      'cancelled',
      'superseded'
    ))
);

create unique index if not exists uq_master_record_version_number
on master_data.master_record_version(master_record_id, version_number);

create index if not exists ix_master_record_version_record
on master_data.master_record_version(master_record_id, version_status);

create index if not exists ix_master_record_version_company_domain
on master_data.master_record_version(company_id, master_domain, effective_from, effective_to);

-- ============================================================
-- 4. MASTER IDENTIFIER
-- ============================================================

create table if not exists master_data.master_identifier (
  master_identifier_id uuid primary key default gen_random_uuid(),
  company_id uuid not null,
  master_record_id uuid not null references master_data.master_record(master_record_id),
  master_domain text not null,
  identifier_type text not null,
  identifier_value text not null,
  issuing_context text,
  primary_flag boolean not null default false,
  identifier_status text not null default 'active',
  effective_from date not null,
  effective_to date,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  created_by text not null default 'system',
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint master_identifier_effective_date_ck
    check (effective_to is null or effective_to >= effective_from),
  constraint master_identifier_status_ck
    check (identifier_status in (
      'active',
      'inactive',
      'expired',
      'replaced',
      'invalid',
      'cancelled',
      'superseded'
    ))
);

create unique index if not exists uq_master_identifier_active
on master_data.master_identifier(company_id, identifier_type, identifier_value)
where identifier_status = 'active';

create index if not exists ix_master_identifier_record
on master_data.master_identifier(master_record_id, identifier_status);

drop trigger if exists trg_master_identifier_updated_at on master_data.master_identifier;
create trigger trg_master_identifier_updated_at
before update on master_data.master_identifier
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 5. MASTER ROLE ASSIGNMENT
-- ============================================================

create table if not exists master_data.master_role_assignment (
  master_role_assignment_id uuid primary key default gen_random_uuid(),
  company_id uuid not null,
  business_partner_record_id uuid not null references master_data.master_record(master_record_id),
  role_type text not null,
  role_master_record_id uuid references master_data.master_record(master_record_id),
  role_status text not null default 'active',
  effective_from date not null,
  effective_to date,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  created_by text not null default 'system',
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint master_role_effective_date_ck
    check (effective_to is null or effective_to >= effective_from),
  constraint master_role_type_ck
    check (role_type in (
      'customer',
      'supplier',
      'payer',
      'payee',
      'carrier',
      'manufacturer',
      'subcontractor',
      'internal_company',
      'contact_organization'
    )),
  constraint master_role_status_ck
    check (role_status in (
      'active',
      'inactive',
      'ended',
      'cancelled',
      'superseded'
    ))
);

create index if not exists ix_master_role_business_partner
on master_data.master_role_assignment(company_id, business_partner_record_id, role_type, role_status);

create index if not exists ix_master_role_role_record
on master_data.master_role_assignment(company_id, role_master_record_id, role_status);

drop trigger if exists trg_master_role_assignment_updated_at on master_data.master_role_assignment;
create trigger trg_master_role_assignment_updated_at
before update on master_data.master_role_assignment
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 6. PUBLICATION PACKAGE
-- ============================================================

create table if not exists master_data.master_publication_package (
  publication_package_id uuid primary key default gen_random_uuid(),
  company_id uuid not null,
  master_domain text not null,
  publication_type text not null,
  publication_reason text not null,
  publication_status text not null default 'building',
  target_module_set text[] not null default '{}',
  source_change_request_id text,
  approval_reference text,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  created_by text not null default 'system',
  published_at timestamptz,
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint master_publication_type_ck
    check (publication_type in (
      'full_snapshot',
      'delta_create',
      'delta_update',
      'deactivate_notice',
      'reactivate_notice',
      'merge_notice',
      'split_notice',
      'identifier_change',
      'hierarchy_change',
      'correction_notice'
    )),
  constraint master_publication_status_ck
    check (publication_status in (
      'building',
      'validation_pending',
      'published',
      'partially_acknowledged',
      'fully_acknowledged',
      'failed',
      'cancelled',
      'superseded'
    ))
);

create index if not exists ix_master_publication_company_domain_status
on master_data.master_publication_package(company_id, master_domain, publication_status);

drop trigger if exists trg_master_publication_package_updated_at on master_data.master_publication_package;
create trigger trg_master_publication_package_updated_at
before update on master_data.master_publication_package
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 7. PUBLICATION LINE
-- ============================================================

create table if not exists master_data.master_publication_line (
  publication_line_id uuid primary key default gen_random_uuid(),
  publication_package_id uuid not null references master_data.master_publication_package(publication_package_id),
  company_id uuid not null,
  master_domain text not null,
  master_record_id uuid not null references master_data.master_record(master_record_id),
  master_version_id uuid references master_data.master_record_version(master_version_id),
  change_type text not null,
  effective_from date not null,
  effective_to date,
  payload_reference text,
  payload_snapshot jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  constraint master_publication_line_effective_date_ck
    check (effective_to is null or effective_to >= effective_from),
  constraint master_publication_line_change_type_ck
    check (change_type in (
      'create',
      'update',
      'deactivate',
      'reactivate',
      'merge',
      'split',
      'correction',
      'identifier_update',
      'hierarchy_update'
    ))
);

create index if not exists ix_master_publication_line_package
on master_data.master_publication_line(publication_package_id);

create index if not exists ix_master_publication_line_record
on master_data.master_publication_line(master_record_id, master_version_id);

-- ============================================================
-- 8. CONSUMER ACKNOWLEDGEMENT
-- ============================================================

create table if not exists master_data.master_consumer_acknowledgement (
  consumer_acknowledgement_id uuid primary key default gen_random_uuid(),
  publication_package_id uuid not null references master_data.master_publication_package(publication_package_id),
  company_id uuid not null,
  target_module text not null,
  acknowledgement_status text not null default 'pending',
  rejection_reason_code text,
  rejection_detail text,
  impact_review_reference text,
  consumer_reference jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  acknowledged_at timestamptz,
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint master_ack_status_ck
    check (acknowledgement_status in (
      'pending',
      'acknowledged',
      'acknowledged_with_warning',
      'rejected',
      'held_for_review',
      'failed',
      'superseded'
    ))
);

create unique index if not exists uq_master_ack_package_module
on master_data.master_consumer_acknowledgement(publication_package_id, target_module);

create index if not exists ix_master_ack_target_status
on master_data.master_consumer_acknowledgement(company_id, target_module, acknowledgement_status);

drop trigger if exists trg_master_consumer_acknowledgement_updated_at on master_data.master_consumer_acknowledgement;
create trigger trg_master_consumer_acknowledgement_updated_at
before update on master_data.master_consumer_acknowledgement
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 9. IMPACT REVIEW
-- ============================================================

create table if not exists master_data.master_impact_review (
  impact_review_id uuid primary key default gen_random_uuid(),
  publication_package_id uuid not null references master_data.master_publication_package(publication_package_id),
  company_id uuid not null,
  target_module text not null,
  impact_type text not null,
  affected_source_object_type_or_extension text not null,
  affected_source_object_count_or_reference text,
  recommended_action text not null,
  impact_status text not null default 'open',
  impact_detail jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  reviewed_at timestamptz,
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint master_impact_type_ck
    check (impact_type in (
      'open_transaction_impact',
      'extension_conflict',
      'deactivation_impact',
      'merge_split_impact',
      'hierarchy_change_impact',
      'reporting_dimension_impact',
      'policy_mapping_impact'
    )),
  constraint master_impact_recommended_action_ck
    check (recommended_action in (
      'accept_publication',
      'hold_for_review',
      'request_master_correction',
      'correct_source_extension',
      'block_new_transaction',
      'allow_historical_only',
      'require_reapproval',
      'refresh_BI_dimension'
    )),
  constraint master_impact_status_ck
    check (impact_status in (
      'open',
      'under_review',
      'accepted',
      'rejected',
      'resolved',
      'cancelled',
      'superseded'
    ))
);

create index if not exists ix_master_impact_package
on master_data.master_impact_review(publication_package_id);

create index if not exists ix_master_impact_target_status
on master_data.master_impact_review(company_id, target_module, impact_status);

drop trigger if exists trg_master_impact_review_updated_at on master_data.master_impact_review;
create trigger trg_master_impact_review_updated_at
before update on master_data.master_impact_review
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 10. SOURCE EXTENSION OWNER MATRIX
-- ============================================================

create table if not exists master_data.source_extension_owner_matrix (
  source_extension_owner_matrix_id uuid primary key default gen_random_uuid(),
  company_id uuid,
  source_module text not null,
  extension_owner text not null,
  master_domain_set text[] not null default '{}',
  extension_object_set text[] not null default '{}',
  ownership_rule text not null,
  matrix_status text not null default 'active',
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  updated_by text,
  constraint source_extension_matrix_status_ck
    check (matrix_status in ('active', 'inactive', 'superseded', 'cancelled'))
);

create index if not exists ix_source_extension_matrix_module
on master_data.source_extension_owner_matrix(source_module, matrix_status);

drop trigger if exists trg_source_extension_owner_matrix_updated_at on master_data.source_extension_owner_matrix;
create trigger trg_source_extension_owner_matrix_updated_at
before update on master_data.source_extension_owner_matrix
for each row execute function master_data.fn_set_updated_at();

-- ============================================================
-- 11. DOMAIN TABLES - BUSINESS PARTNER / CUSTOMER / SUPPLIER
-- ============================================================

create table if not exists master_data.business_partner_core (
  business_partner_core_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  partner_type text not null,
  legal_name text,
  country_or_region_reference text,
  tax_identifier_reference text,
  registration_identifier_reference text,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_business_partner_core_record
on master_data.business_partner_core(master_record_id);

create table if not exists master_data.customer_core (
  customer_core_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  business_partner_record_id uuid references master_data.master_record(master_record_id),
  company_id uuid not null,
  customer_role_type text not null,
  default_currency_code text,
  default_tax_reference text,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_customer_core_record
on master_data.customer_core(master_record_id);

create table if not exists master_data.supplier_core (
  supplier_core_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  business_partner_record_id uuid references master_data.master_record(master_record_id),
  company_id uuid not null,
  supplier_role_type text not null,
  default_currency_code text,
  default_tax_reference text,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_supplier_core_record
on master_data.supplier_core(master_record_id);

create table if not exists master_data.contact_person_reference (
  contact_person_reference_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  related_business_partner_record_id uuid references master_data.master_record(master_record_id),
  company_id uuid not null,
  display_name text not null,
  preferred_language text,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_contact_person_reference_record
on master_data.contact_person_reference(master_record_id);

-- ============================================================
-- 12. DOMAIN TABLES - ITEM / PRODUCT / UOM
-- ============================================================

create table if not exists master_data.item_core (
  item_core_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  item_type text not null,
  base_uom_record_id uuid references master_data.master_record(master_record_id),
  item_category_record_id uuid references master_data.master_record(master_record_id),
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_item_core_record
on master_data.item_core(master_record_id);

create table if not exists master_data.product_core (
  product_core_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  product_type text not null,
  default_item_record_id uuid references master_data.master_record(master_record_id),
  product_family_record_id uuid references master_data.master_record(master_record_id),
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_product_core_record
on master_data.product_core(master_record_id);

create table if not exists master_data.unit_of_measure (
  unit_of_measure_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid,
  uom_category text not null,
  decimal_precision integer not null default 0,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_unit_of_measure_record
on master_data.unit_of_measure(master_record_id);

-- ============================================================
-- 13. DOMAIN TABLES - LOCATION / COMPANY / ORGANIZATION
-- ============================================================

create table if not exists master_data.location_core (
  location_core_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  location_type text not null,
  parent_location_record_id uuid references master_data.master_record(master_record_id),
  address_reference text,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_location_core_record
on master_data.location_core(master_record_id);

create table if not exists master_data.company_reference (
  company_reference_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  company_type text not null,
  primary_legal_entity_record_id uuid references master_data.master_record(master_record_id),
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_company_reference_record
on master_data.company_reference(master_record_id);

create table if not exists master_data.legal_entity_reference (
  legal_entity_reference_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  legal_entity_type text not null,
  country_or_region_code text,
  tax_identifier_reference text,
  registration_identifier_reference text,
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_legal_entity_reference_record
on master_data.legal_entity_reference(master_record_id);

create table if not exists master_data.organization_unit_reference (
  organization_unit_reference_id uuid primary key default gen_random_uuid(),
  master_record_id uuid not null references master_data.master_record(master_record_id),
  company_id uuid not null,
  organization_unit_type text not null,
  parent_organization_record_id uuid references master_data.master_record(master_record_id),
  legal_entity_record_id uuid references master_data.master_record(master_record_id),
  attributes jsonb not null default '{}'::jsonb,
  lineage_reference text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create unique index if not exists uq_organization_unit_reference_record
on master_data.organization_unit_reference(master_record_id);

-- ============================================================
-- 14. VIEWS
-- ============================================================

create or replace view master_data.vw_active_master_record as
select
  r.company_id,
  r.master_domain,
  r.master_record_id,
  r.current_master_version_id,
  r.master_code,
  r.master_name,
  r.display_name,
  r.master_status,
  r.effective_from,
  r.effective_to,
  r.lineage_reference
from master_data.master_record r
where r.master_status = 'active';

create or replace view master_data.vw_master_publication_status as
select
  p.company_id,
  p.publication_package_id,
  p.master_domain,
  p.publication_type,
  p.publication_status,
  p.target_module_set,
  count(a.consumer_acknowledgement_id) as acknowledgement_count,
  count(a.consumer_acknowledgement_id) filter (where a.acknowledgement_status = 'acknowledged') as acknowledged_count,
  count(a.consumer_acknowledgement_id) filter (where a.acknowledgement_status = 'rejected') as rejected_count,
  p.created_at,
  p.published_at
from master_data.master_publication_package p
left join master_data.master_consumer_acknowledgement a
  on a.publication_package_id = p.publication_package_id
group by
  p.company_id,
  p.publication_package_id,
  p.master_domain,
  p.publication_type,
  p.publication_status,
  p.target_module_set,
  p.created_at,
  p.published_at;

create or replace view master_data.vw_module_master_reference_directory as
select
  source_module,
  extension_owner,
  master_domain_set,
  extension_object_set,
  ownership_rule,
  matrix_status
from master_data.source_extension_owner_matrix
where matrix_status = 'active';

create or replace view master_data.vw_bi_master_dimension_snapshot as
select
  r.company_id,
  r.master_domain,
  r.master_record_id,
  r.current_master_version_id as master_version_id,
  r.master_code as code,
  r.master_name as name,
  r.display_name,
  r.master_status as status,
  r.effective_from,
  r.effective_to
from master_data.master_record r
where r.master_status in ('active', 'inactive', 'deprecated');

-- ============================================================
-- END OF DRAFT
-- ============================================================
