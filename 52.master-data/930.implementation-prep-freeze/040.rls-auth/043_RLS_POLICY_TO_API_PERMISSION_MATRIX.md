# ============================================================
# RLS POLICY TO API PERMISSION MATRIX
# 52.master-data
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
module: 52.master-data
db_apply_status: STOPPED

# ============================================================
# 1. API ACTION TO PERMISSION
# ============================================================

api_permission_matrix:
- create draft master:
  - endpoint: POST /erp/52-master-data/v1/masters/{master_domain}/draft
  - permission: master.draft.create
  - DB objects: master_record, master_record_version, domain table, master_identifier optional
- update draft master:
  - endpoint: PATCH /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/draft
  - permission: master.draft.update
  - DB objects: master_record, master_record_version, domain table
- create master version:
  - endpoint: POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/versions
  - permission: master.version.create
  - DB objects: master_record_version, master_record
- activate master:
  - endpoint: POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/activate
  - permission: master.activate
  - DB objects: master_record, master_record_version, publication package optional
- deactivate master:
  - endpoint: POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/deactivate
  - permission: master.deactivate
  - DB objects: master_record, publication package, impact review optional
- add/update identifier:
  - endpoint: identifier endpoints
  - permission: master.identifier.manage
  - DB objects: master_identifier
- add/end role:
  - endpoint: business partner role endpoints
  - permission: master.role.manage
  - DB objects: master_role_assignment
- create publication:
  - endpoint: POST /publications
  - permission: master.publication.create
  - DB objects: master_publication_package, master_publication_line
- publish publication:
  - endpoint: POST /publications/{id}/publish
  - permission: master.publication.publish
  - DB objects: master_publication_package
- acknowledge publication:
  - endpoint: POST /publications/{id}/acknowledgements
  - permission: master.publication.acknowledge
  - DB objects: master_consumer_acknowledgement
- register impact review:
  - endpoint: POST /publications/{id}/impact-reviews
  - permission: master.impact_review.create
  - DB objects: master_impact_review
- read/search/detail:
  - endpoint: GET master endpoints
  - permission: master.read or master.search
  - DB objects: views and master tables
- BI snapshot:
  - endpoint: GET /bi-snapshots/{master_domain}
  - permission: master.BI_snapshot.read
  - DB objects: vw_bi_master_dimension_snapshot
- audit read:
  - permission: master.audit.read
  - DB objects: read-only views/tables

# ============================================================
# 2. ROLE TO PERMISSION CANDIDATES
# ============================================================

role_permission_candidates:
- master_data_reader:
  - master.read
  - master.search
- master_data_editor:
  - master.read
  - master.search
  - master.draft.create
  - master.draft.update
  - master.version.create
  - master.identifier.manage
  - master.role.manage
- master_data_approver:
  - master.read
  - master.activate
  - master.deactivate
- master_data_publisher:
  - master.read
  - master.publication.create
  - master.publication.publish
- source_module_consumer:
  - master.read
  - master.publication.acknowledge
  - master.impact_review.create
- BI_readonly_consumer:
  - master.BI_snapshot.read
- audit_readonly_consumer:
  - master.audit.read
- master_data_admin:
  - master.admin
  - all explicit master permissions by policy

# ============================================================
# 3. BOUNDARY RULES
# ============================================================

boundary_rules:
- source module consumer can acknowledge publication for its own target_module only.
- source module consumer can register impact review for its own target_module only.
- BI consumer is read-only.
- audit consumer is read-only.
- approval reference does not mutate master data by itself.
- service role must not be exposed to UI.
- no delete policy exists for master records.

# ============================================================
