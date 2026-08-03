# ============================================================
# 52.master-data API PAYLOAD CANDIDATES FREEZE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
phase: implementation-prep-freeze
db_apply_status: STOPPED

# ============================================================
# 1. API PRINCIPLES
# ============================================================

api_principles:
- API payloads are candidates, not final implementation.
- Exact payload freeze is a later step.
- API must not expose DB implementation details unnecessarily.
- API must preserve master version / effective-date / lineage.
- API must distinguish master identity from source module extension.
- API must support validation/rejection with explicit reason.
- API must be company-scoped.
- API must be audit-friendly.

# ============================================================
# 2. ENDPOINT CANDIDATE GROUPS
# ============================================================

endpoint_groups:
- master search/list/detail
- master create draft
- master update draft
- master activate/deactivate
- master version create
- identifier management
- role assignment
- publication package
- publication acknowledgement
- impact review
- source extension matrix read
- BI snapshot export candidate

# ============================================================
# 3. COMMON REQUEST ENVELOPE
# ============================================================

common_request_envelope_candidate:
  request_id: string
  company_id: uuid
  actor_id: string
  actor_type: user_or_system
  source_module: string
  request_reason: string
  idempotency_key: string
  payload: object

required_rules:
- company_id required
- actor_id required
- idempotency_key required for write candidates
- request_id must be traceable
- source_module must be explicit

# ============================================================
# 4. COMMON RESPONSE ENVELOPE
# ============================================================

common_response_envelope_candidate:
  request_id: string
  result_status: accepted_or_rejected_or_validation_error
  master_domain: string_or_null
  master_record_id: uuid_or_null
  master_version_id: uuid_or_null
  validation_errors: array
  warning_set: array
  lineage_reference: string_or_null

# ============================================================
# 5. CREATE DRAFT MASTER REQUEST
# ============================================================

endpoint_candidate:
- POST /erp/52-master-data/v1/masters/{master_domain}/draft

request_payload_candidate:
  master_domain: business_partner_or_customer_or_supplier_or_item_or_product_or_uom_or_address_or_location_or_company_or_legal_entity_or_organization
  company_id: uuid
  draft_data:
    code: string
    name: string
    status: draft
    effective_from: date
    effective_to: date_or_null
    attributes: object
  identifier_set: array
  lineage_reference: string

response_payload_candidate:
  master_record_id: uuid
  master_version_id: uuid
  draft_status: draft
  validation_result: object

# ============================================================
# 6. UPDATE DRAFT MASTER REQUEST
# ============================================================

endpoint_candidate:
- PATCH /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/draft

request_payload_candidate:
  master_record_id: uuid
  expected_master_version_id: uuid
  patch_data: object
  update_reason: string
  lineage_reference: string

rules:
- only draft or review_pending can be patched directly
- active records require new version candidate

# ============================================================
# 7. ACTIVATE / DEACTIVATE REQUEST
# ============================================================

endpoint_candidates:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/activate
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/deactivate

request_payload_candidate:
  master_record_id: uuid
  expected_master_version_id: uuid
  effective_from: date
  reason: string
  approval_reference_or_null: string
  lineage_reference: string

rules:
- activation requires validation pass
- deactivation must create publication impact review
- historical references are not deleted

# ============================================================
# 8. NEW VERSION REQUEST
# ============================================================

endpoint_candidate:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/versions

request_payload_candidate:
  master_record_id: uuid
  base_master_version_id: uuid
  effective_from: date
  effective_to: date_or_null
  changed_fields: object
  change_reason: string
  approval_reference_or_null: string
  lineage_reference: string

rules:
- version creation preserves prior version
- source modules receive publication package if active/public fields changed

# ============================================================
# 9. IDENTIFIER REQUEST
# ============================================================

endpoint_candidates:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/identifiers
- PATCH /erp/52-master-data/v1/identifiers/{identifier_id}

request_payload_candidate:
  master_record_id: uuid
  identifier_type: string
  identifier_value: string
  issuing_context_or_null: string
  primary_flag: boolean
  effective_from: date
  effective_to: date_or_null
  lineage_reference: string

rules:
- duplicate identifier conflict creates validation error or data quality issue
- legacy identifiers do not replace canonical ID

# ============================================================
# 10. ROLE ASSIGNMENT REQUEST
# ============================================================

endpoint_candidate:
- POST /erp/52-master-data/v1/business-partners/{business_partner_id}/roles

request_payload_candidate:
  business_partner_id: uuid
  role_type: customer_or_supplier_or_payer_or_payee_or_carrier_or_manufacturer
  role_reference_id_or_null: uuid
  effective_from: date
  effective_to: date_or_null
  lineage_reference: string

rules:
- role assignment links partner to role-specific master
- source module operational extension remains source-owned

# ============================================================
# 11. PUBLICATION PACKAGE REQUEST
# ============================================================

endpoint_candidate:
- POST /erp/52-master-data/v1/publications

request_payload_candidate:
  master_domain: string
  publication_type: full_snapshot_or_delta_create_or_delta_update_or_deactivate_notice_or_merge_notice_or_split_notice
  master_record_reference_set: array
  target_module_set: array
  publication_reason: string
  lineage_reference: string

response_payload_candidate:
  publication_package_id: uuid
  publication_status: building_or_published
  publication_line_set: array

# ============================================================
# 12. CONSUMER ACKNOWLEDGEMENT REQUEST
# ============================================================

endpoint_candidate:
- POST /erp/52-master-data/v1/publications/{publication_package_id}/acknowledgements

request_payload_candidate:
  publication_package_id: uuid
  target_module: string
  acknowledgement_status: acknowledged_or_acknowledged_with_warning_or_rejected_or_held_for_review
  rejection_reason_code_or_null: string
  rejection_detail_or_null: string
  impact_review_reference_or_null: string
  lineage_reference: string

rules:
- acknowledgement does not rewrite source extension
- rejection does not rollback master automatically

# ============================================================
# 13. IMPACT REVIEW REQUEST
# ============================================================

endpoint_candidate:
- POST /erp/52-master-data/v1/publications/{publication_package_id}/impact-reviews

request_payload_candidate:
  publication_package_id: uuid
  target_module: string
  impact_type: string
  affected_source_object_type_or_extension: string
  affected_source_object_count_or_reference: string
  recommended_action: string
  impact_status: string
  lineage_reference: string

# ============================================================
# 14. READ ENDPOINT CANDIDATES
# ============================================================

read_endpoint_candidates:
- GET /erp/52-master-data/v1/masters/{master_domain}
- GET /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}
- GET /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/versions
- GET /erp/52-master-data/v1/publications/{publication_package_id}
- GET /erp/52-master-data/v1/source-extension-matrix
- GET /erp/52-master-data/v1/bi-snapshots/{master_domain}

# ============================================================
# 15. COMPLETION STATE
# ============================================================

completion_state:
- API payload candidates frozen for implementation-prep.
- Exact API payload freeze remains future work.
- No API implementation performed.

# ============================================================
