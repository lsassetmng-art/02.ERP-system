# ============================================================
# COMMON ENVELOPE / ERROR / STATUS EXACT PAYLOAD
# 52.master-data API v1
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

# ============================================================
# 1. COMMON REQUEST ENVELOPE
# ============================================================

common_request_envelope_exact:

{
  "request_id": "req_20260429_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_or_system_actor_id",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "mdm-idem-000001",
  "request_reason": "create initial customer master draft",
  "requested_at": "2026-04-29T00:00:00+09:00",
  "payload": {}
}

required_fields:
- request_id
- company_id
- actor.actor_id
- actor.actor_type
- actor.source_module
- idempotency_key for write endpoints
- request_reason for write endpoints
- payload

actor_type_allowed:
- user
- system
- module
- batch
- service

# ============================================================
# 2. COMMON RESPONSE ENVELOPE
# ============================================================

common_response_envelope_exact:

{
  "request_id": "req_20260429_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "result_status": "accepted",
  "result_code": "MASTER_DRAFT_CREATED",
  "master_domain": "customer",
  "master_record_id": "00000000-0000-4000-8000-100000000001",
  "master_version_id": "00000000-0000-4000-8000-200000000001",
  "publication_package_id": null,
  "validation_errors": [],
  "warnings": [],
  "lineage": {
    "lineage_reference": "lin_52md_000001",
    "source_change_request_id": null,
    "approval_reference": null
  },
  "responded_at": "2026-04-29T00:00:01+09:00"
}

result_status_allowed:
- accepted
- rejected
- validation_error
- conflict
- not_found
- unauthorized
- forbidden
- idempotent_replay
- system_error

# ============================================================
# 3. COMMON ERROR OBJECT
# ============================================================

error_object_exact:

{
  "error_code": "DUPLICATE_IDENTIFIER",
  "error_level": "error",
  "field_path": "payload.identifier_set[0].identifier_value",
  "message": "identifier already exists for active master record",
  "details": {
    "conflicting_master_record_id": "00000000-0000-4000-8000-100000000099"
  }
}

standard_error_codes:
- INVALID_SCHEMA
- COMPANY_SCOPE_INVALID
- ACTOR_UNAUTHORIZED
- IDEMPOTENCY_KEY_REQUIRED
- IDEMPOTENCY_CONFLICT
- MASTER_DOMAIN_UNSUPPORTED
- MASTER_RECORD_NOT_FOUND
- MASTER_VERSION_NOT_FOUND
- MASTER_STATUS_INVALID
- MASTER_VERSION_CONFLICT
- EFFECTIVE_DATE_INVALID
- DUPLICATE_IDENTIFIER
- IDENTIFIER_FORMAT_INVALID
- ROLE_TYPE_UNSUPPORTED
- PUBLICATION_TARGET_INVALID
- ACKNOWLEDGEMENT_TARGET_INVALID
- IMPACT_REVIEW_REQUIRED
- SOURCE_EXTENSION_CONFLICT
- HISTORICAL_REFERENCE_BLOCKED
- VALIDATION_FAILED
- POLICY_BLOCKED

# ============================================================
# 4. COMMON WARNING OBJECT
# ============================================================

warning_object_exact:

{
  "warning_code": "IMPACT_REVIEW_RECOMMENDED",
  "warning_level": "warning",
  "field_path": "payload.effective_from",
  "message": "active consumers may require impact review",
  "details": {
    "consumer_count": 4
  }
}

standard_warning_codes:
- IMPACT_REVIEW_RECOMMENDED
- CONSUMER_ACKNOWLEDGEMENT_PENDING
- DUPLICATE_CANDIDATE_FOUND
- HISTORICAL_VERSION_EXISTS
- EFFECTIVE_DATE_OVERLAP_WARNING
- SOURCE_MODULE_EXTENSION_EXISTS
- BI_SNAPSHOT_REFRESH_RECOMMENDED

# ============================================================
# 5. ENUMS
# ============================================================

master_domain_allowed:
- business_partner
- customer
- supplier
- contact_person
- item
- product
- item_category
- product_family
- unit_of_measure
- unit_of_measure_conversion
- address
- location
- site
- plant_reference
- warehouse_reference
- company
- legal_entity
- organization_unit
- department
- position
- cost_center
- profit_center

master_status_allowed:
- draft
- review_pending
- active
- inactive
- blocked
- pending_review
- duplicate_candidate
- merged
- split
- deprecated
- cancelled
- superseded

completion_state:
- common envelope frozen
- common errors/warnings frozen
- master domain/status enum frozen
# ============================================================
