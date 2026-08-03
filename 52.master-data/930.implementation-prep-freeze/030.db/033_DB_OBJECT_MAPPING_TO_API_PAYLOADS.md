# ============================================================
# DB OBJECT MAPPING TO API PAYLOADS
# 52.master-data
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
module: 52.master-data
db_apply_status: STOPPED

# ============================================================
# 1. API TO DB OBJECT MAP
# ============================================================

create_draft_master:
- API:
  - POST /erp/52-master-data/v1/masters/{master_domain}/draft
- DB candidates:
  - master_data.master_record
  - master_data.master_record_version
  - master_data.master_identifier
  - domain table depending master_domain

update_draft_master:
- API:
  - PATCH /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/draft
- DB candidates:
  - master_data.master_record
  - master_data.master_record_version
  - domain table depending master_domain

create_master_version:
- API:
  - POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/versions
- DB candidates:
  - master_data.master_record_version
  - master_data.master_publication_package if publication is requested later

activate_master_record:
- API:
  - POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/activate
- DB candidates:
  - master_data.master_record
  - master_data.master_record_version
  - master_data.master_publication_package
  - master_data.master_publication_line

deactivate_master_record:
- API:
  - POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/deactivate
- DB candidates:
  - master_data.master_record
  - master_data.master_publication_package
  - master_data.master_publication_line
  - master_data.master_impact_review if needed

identifier_management:
- API:
  - POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/identifiers
  - PATCH /erp/52-master-data/v1/identifiers/{identifier_id}
- DB candidates:
  - master_data.master_identifier

role_assignment:
- API:
  - POST /erp/52-master-data/v1/business-partners/{business_partner_id}/roles
  - POST /erp/52-master-data/v1/business-partners/{business_partner_id}/roles/{partner_role_assignment_id}/end
- DB candidates:
  - master_data.master_role_assignment

publication:
- API:
  - POST /erp/52-master-data/v1/publications
  - POST /erp/52-master-data/v1/publications/{publication_package_id}/publish
- DB candidates:
  - master_data.master_publication_package
  - master_data.master_publication_line
  - master_data.master_consumer_acknowledgement

acknowledgement:
- API:
  - POST /erp/52-master-data/v1/publications/{publication_package_id}/acknowledgements
- DB candidates:
  - master_data.master_consumer_acknowledgement

impact_review:
- API:
  - POST /erp/52-master-data/v1/publications/{publication_package_id}/impact-reviews
- DB candidates:
  - master_data.master_impact_review

read_endpoints:
- API:
  - GET /erp/52-master-data/v1/masters/{master_domain}
  - GET /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}
  - GET /erp/52-master-data/v1/source-extension-matrix
  - GET /erp/52-master-data/v1/bi-snapshots/{master_domain}
- DB candidates:
  - master_data.vw_active_master_record
  - master_data.vw_module_master_reference_directory
  - master_data.vw_bi_master_dimension_snapshot

# ============================================================
# 2. BOUNDARY RULES
# ============================================================

boundary_rules:
- master_data tables do not store source module transaction truth.
- source extension records remain in source modules.
- publication does not mutate source modules.
- acknowledgement does not mutate master records.
- impact review does not mutate source transactions.
- BI snapshot view is read-only projection.
- source modules must not bypass 52 workflow for shared master identity.

# ============================================================
