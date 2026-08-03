-- ============================================================
-- 52.master-data RLS POLICY PROPOSAL DRAFT
-- STOP付き・未適用
-- ============================================================
--
-- status: DRAFT_ONLY
-- module: 52.master-data
-- db_apply_status: STOPPED
-- psql_executed: NO
--
-- IMPORTANT:
-- - DO NOT RUN THIS FILE YET.
-- - This file is a RLS proposal draft only.
-- - Future apply requires explicit user approval.
-- - Future apply requires 佐藤（DB担当） review.
-- - Future apply must use:
--     psql "$DATABASE_URL" <<'SQL'
--
-- Context assumptions for future runtime:
-- - app.company_id is set per request.
-- - app.actor_id is set per request.
-- - app.source_module is set per request.
-- - app.permissions is set as comma-separated permission codes.
-- - service role bypass is not exposed to UI.
--
-- ============================================================

-- ============================================================
-- 0. CONTEXT HELPER FUNCTIONS
-- ============================================================

create or replace function master_data.fn_rls_company_id()
returns uuid
language sql
stable
as $$
  select nullif(current_setting('app.company_id', true), '')::uuid
$$;

create or replace function master_data.fn_rls_actor_id()
returns text
language sql
stable
as $$
  select nullif(current_setting('app.actor_id', true), '')
$$;

create or replace function master_data.fn_rls_source_module()
returns text
language sql
stable
as $$
  select nullif(current_setting('app.source_module', true), '')
$$;

create or replace function master_data.fn_rls_has_permission(permission_code text)
returns boolean
language sql
stable
as $$
  select position(',' || permission_code || ',' in ',' || coalesce(current_setting('app.permissions', true), '') || ',') > 0
$$;

-- ============================================================
-- 1. RLS ENABLEMENT CANDIDATES
-- ============================================================

alter table master_data.master_record enable row level security;
alter table master_data.master_record_version enable row level security;
alter table master_data.master_identifier enable row level security;
alter table master_data.master_role_assignment enable row level security;
alter table master_data.master_publication_package enable row level security;
alter table master_data.master_publication_line enable row level security;
alter table master_data.master_consumer_acknowledgement enable row level security;
alter table master_data.master_impact_review enable row level security;
alter table master_data.source_extension_owner_matrix enable row level security;

alter table master_data.business_partner_core enable row level security;
alter table master_data.customer_core enable row level security;
alter table master_data.supplier_core enable row level security;
alter table master_data.contact_person_reference enable row level security;
alter table master_data.item_core enable row level security;
alter table master_data.product_core enable row level security;
alter table master_data.unit_of_measure enable row level security;
alter table master_data.location_core enable row level security;
alter table master_data.company_reference enable row level security;
alter table master_data.legal_entity_reference enable row level security;
alter table master_data.organization_unit_reference enable row level security;

-- ============================================================
-- 2. MASTER RECORD POLICIES
-- ============================================================

drop policy if exists p_master_record_select_company on master_data.master_record;
create policy p_master_record_select_company
on master_data.master_record
for select
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.read')
    or master_data.fn_rls_has_permission('master.search')
    or master_data.fn_rls_has_permission('master.BI_snapshot.read')
    or master_data.fn_rls_has_permission('master.audit.read')
  )
);

drop policy if exists p_master_record_insert_editor on master_data.master_record;
create policy p_master_record_insert_editor
on master_data.master_record
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.draft.create')
);

drop policy if exists p_master_record_update_editor on master_data.master_record;
create policy p_master_record_update_editor
on master_data.master_record
for update
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.update')
    or master_data.fn_rls_has_permission('master.version.create')
    or master_data.fn_rls_has_permission('master.activate')
    or master_data.fn_rls_has_permission('master.deactivate')
  )
)
with check (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.update')
    or master_data.fn_rls_has_permission('master.version.create')
    or master_data.fn_rls_has_permission('master.activate')
    or master_data.fn_rls_has_permission('master.deactivate')
  )
);

-- No delete policy by design.
-- Master records must not be hard deleted.

-- ============================================================
-- 3. MASTER VERSION POLICIES
-- ============================================================

drop policy if exists p_master_version_select_company on master_data.master_record_version;
create policy p_master_version_select_company
on master_data.master_record_version
for select
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.read')
);

drop policy if exists p_master_version_insert_editor on master_data.master_record_version;
create policy p_master_version_insert_editor
on master_data.master_record_version
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.create')
    or master_data.fn_rls_has_permission('master.version.create')
  )
);

drop policy if exists p_master_version_update_editor on master_data.master_record_version;
create policy p_master_version_update_editor
on master_data.master_record_version
for update
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.update')
    or master_data.fn_rls_has_permission('master.activate')
    or master_data.fn_rls_has_permission('master.deactivate')
  )
)
with check (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.update')
    or master_data.fn_rls_has_permission('master.activate')
    or master_data.fn_rls_has_permission('master.deactivate')
  )
);

-- ============================================================
-- 4. IDENTIFIER POLICIES
-- ============================================================

drop policy if exists p_master_identifier_select_company on master_data.master_identifier;
create policy p_master_identifier_select_company
on master_data.master_identifier
for select
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.read')
);

drop policy if exists p_master_identifier_insert_manage on master_data.master_identifier;
create policy p_master_identifier_insert_manage
on master_data.master_identifier
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.identifier.manage')
);

drop policy if exists p_master_identifier_update_manage on master_data.master_identifier;
create policy p_master_identifier_update_manage
on master_data.master_identifier
for update
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.identifier.manage')
)
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.identifier.manage')
);

-- ============================================================
-- 5. ROLE ASSIGNMENT POLICIES
-- ============================================================

drop policy if exists p_master_role_select_company on master_data.master_role_assignment;
create policy p_master_role_select_company
on master_data.master_role_assignment
for select
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.read')
);

drop policy if exists p_master_role_insert_manage on master_data.master_role_assignment;
create policy p_master_role_insert_manage
on master_data.master_role_assignment
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.role.manage')
);

drop policy if exists p_master_role_update_manage on master_data.master_role_assignment;
create policy p_master_role_update_manage
on master_data.master_role_assignment
for update
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.role.manage')
)
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.role.manage')
);

-- ============================================================
-- 6. PUBLICATION PACKAGE / LINE POLICIES
-- ============================================================

drop policy if exists p_publication_package_select_company on master_data.master_publication_package;
create policy p_publication_package_select_company
on master_data.master_publication_package
for select
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.publication.create')
    or master_data.fn_rls_has_permission('master.publication.publish')
    or master_data.fn_rls_has_permission('master.publication.acknowledge')
    or master_data.fn_rls_has_permission('master.read')
  )
);

drop policy if exists p_publication_package_insert_publisher on master_data.master_publication_package;
create policy p_publication_package_insert_publisher
on master_data.master_publication_package
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.create')
);

drop policy if exists p_publication_package_update_publisher on master_data.master_publication_package;
create policy p_publication_package_update_publisher
on master_data.master_publication_package
for update
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.publish')
)
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.publish')
);

drop policy if exists p_publication_line_select_company on master_data.master_publication_line;
create policy p_publication_line_select_company
on master_data.master_publication_line
for select
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.publication.create')
    or master_data.fn_rls_has_permission('master.publication.publish')
    or master_data.fn_rls_has_permission('master.publication.acknowledge')
    or master_data.fn_rls_has_permission('master.read')
  )
);

drop policy if exists p_publication_line_insert_publisher on master_data.master_publication_line;
create policy p_publication_line_insert_publisher
on master_data.master_publication_line
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.create')
);

-- ============================================================
-- 7. CONSUMER ACKNOWLEDGEMENT POLICIES
-- ============================================================

drop policy if exists p_ack_select_company on master_data.master_consumer_acknowledgement;
create policy p_ack_select_company
on master_data.master_consumer_acknowledgement
for select
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.publication.acknowledge')
    or master_data.fn_rls_has_permission('master.read')
  )
);

drop policy if exists p_ack_insert_consumer on master_data.master_consumer_acknowledgement;
create policy p_ack_insert_consumer
on master_data.master_consumer_acknowledgement
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.acknowledge')
  and target_module = master_data.fn_rls_source_module()
);

drop policy if exists p_ack_update_consumer on master_data.master_consumer_acknowledgement;
create policy p_ack_update_consumer
on master_data.master_consumer_acknowledgement
for update
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.acknowledge')
  and target_module = master_data.fn_rls_source_module()
)
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.publication.acknowledge')
  and target_module = master_data.fn_rls_source_module()
);

-- ============================================================
-- 8. IMPACT REVIEW POLICIES
-- ============================================================

drop policy if exists p_impact_select_company on master_data.master_impact_review;
create policy p_impact_select_company
on master_data.master_impact_review
for select
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.impact_review.create')
    or master_data.fn_rls_has_permission('master.read')
  )
);

drop policy if exists p_impact_insert_consumer on master_data.master_impact_review;
create policy p_impact_insert_consumer
on master_data.master_impact_review
for insert
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.impact_review.create')
  and target_module = master_data.fn_rls_source_module()
);

drop policy if exists p_impact_update_consumer on master_data.master_impact_review;
create policy p_impact_update_consumer
on master_data.master_impact_review
for update
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.impact_review.create')
  and target_module = master_data.fn_rls_source_module()
)
with check (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.impact_review.create')
  and target_module = master_data.fn_rls_source_module()
);

-- ============================================================
-- 9. SOURCE EXTENSION MATRIX POLICIES
-- ============================================================

drop policy if exists p_source_extension_matrix_select on master_data.source_extension_owner_matrix;
create policy p_source_extension_matrix_select
on master_data.source_extension_owner_matrix
for select
using (
  (company_id is null or company_id = master_data.fn_rls_company_id())
  and (
    master_data.fn_rls_has_permission('master.read')
    or master_data.fn_rls_has_permission('master.search')
    or master_data.fn_rls_has_permission('master.BI_snapshot.read')
    or master_data.fn_rls_has_permission('master.audit.read')
  )
);

drop policy if exists p_source_extension_matrix_write_admin on master_data.source_extension_owner_matrix;
create policy p_source_extension_matrix_write_admin
on master_data.source_extension_owner_matrix
for all
using (
  (company_id is null or company_id = master_data.fn_rls_company_id())
  and master_data.fn_rls_has_permission('master.admin')
)
with check (
  (company_id is null or company_id = master_data.fn_rls_company_id())
  and master_data.fn_rls_has_permission('master.admin')
);

-- ============================================================
-- 10. DOMAIN TABLE GENERIC POLICIES
-- ============================================================

drop policy if exists p_business_partner_core_select_company on master_data.business_partner_core;
create policy p_business_partner_core_select_company
on master_data.business_partner_core
for select
using (
  company_id = master_data.fn_rls_company_id()
  and master_data.fn_rls_has_permission('master.read')
);

drop policy if exists p_business_partner_core_write_editor on master_data.business_partner_core;
create policy p_business_partner_core_write_editor
on master_data.business_partner_core
for all
using (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.create')
    or master_data.fn_rls_has_permission('master.draft.update')
    or master_data.fn_rls_has_permission('master.version.create')
  )
)
with check (
  company_id = master_data.fn_rls_company_id()
  and (
    master_data.fn_rls_has_permission('master.draft.create')
    or master_data.fn_rls_has_permission('master.draft.update')
    or master_data.fn_rls_has_permission('master.version.create')
  )
);

-- NOTE:
-- Repeat equivalent domain table policies for:
-- - customer_core
-- - supplier_core
-- - contact_person_reference
-- - item_core
-- - product_core
-- - unit_of_measure
-- - location_core
-- - company_reference
-- - legal_entity_reference
-- - organization_unit_reference
--
-- In final apply, avoid overbroad FOR ALL if stricter insert/update split is required.

-- ============================================================
-- END OF RLS DRAFT
-- ============================================================
