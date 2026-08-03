# ============================================================
# API VALIDATION RULES / STATUS TRANSITIONS EXACT
# 52.master-data API v1
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

# ============================================================
# 1. VALIDATION RULES
# ============================================================

validation_rules:
- company_id must be present and actor must have company scope.
- actor must be present.
- write endpoint must include idempotency_key.
- master_domain must be in allowed enum.
- master_record_id must exist for update/version/activate/deactivate.
- expected_master_version_id must match current target version where required.
- effective_from must be present for create/activate/version/deactivate.
- effective_to must be null or after effective_from.
- identifier_type + identifier_value must be unique for active scope unless explicitly allowed.
- role assignment must reference valid business_partner_id.
- publication target modules must be valid ERP module codes.
- acknowledgement target_module must be included in publication package.
- impact review must reference a publication package.
- source extension fields must not be stored as shared master identity fields.
- BI snapshot requests must be read-only.

# ============================================================
# 2. MASTER STATUS TRANSITIONS
# ============================================================

allowed_master_status_transitions:
- draft -> review_pending
- draft -> active
- draft -> cancelled
- review_pending -> active
- review_pending -> draft
- review_pending -> cancelled
- active -> inactive
- active -> blocked
- active -> deprecated
- active -> superseded
- active -> duplicate_candidate
- inactive -> active
- inactive -> deprecated
- blocked -> active
- blocked -> inactive
- duplicate_candidate -> merged
- duplicate_candidate -> split
- merged -> superseded
- split -> superseded
- deprecated -> superseded

forbidden_master_status_transitions:
- active -> draft
- cancelled -> active
- superseded -> active
- merged -> active
- split -> active

# ============================================================
# 3. PUBLICATION / ACKNOWLEDGEMENT STATUS TRANSITIONS
# ============================================================

allowed_publication_status_transitions:
- building -> validation_pending
- building -> published
- validation_pending -> published
- validation_pending -> failed
- published -> partially_acknowledged
- published -> fully_acknowledged
- partially_acknowledged -> fully_acknowledged
- published -> failed
- building -> cancelled
- validation_pending -> cancelled
- published -> superseded

allowed_acknowledgement_status_transitions:
- pending -> acknowledged
- pending -> acknowledged_with_warning
- pending -> rejected
- pending -> held_for_review
- held_for_review -> acknowledged
- held_for_review -> acknowledged_with_warning
- held_for_review -> rejected
- acknowledged_with_warning -> acknowledged
- rejected -> held_for_review
- rejected -> superseded

# ============================================================
# 4. IDEMPOTENCY / CONFLICT
# ============================================================

idempotency_rules:
- Same idempotency_key with same payload returns idempotent_replay.
- Same idempotency_key with different payload returns IDEMPOTENCY_CONFLICT.
- Write endpoints require idempotency_key.
- Read endpoints may omit idempotency_key.
- Idempotency is company-scoped.

conflict_handling:
- version conflict returns MASTER_VERSION_CONFLICT.
- duplicate identifier returns DUPLICATE_IDENTIFIER.
- effective-date overlap returns EFFECTIVE_DATE_INVALID or warning based on policy.
- source extension conflict returns SOURCE_EXTENSION_CONFLICT.
- open transaction impact returns IMPACT_REVIEW_REQUIRED.
- unsupported module acknowledgement returns ACKNOWLEDGEMENT_TARGET_INVALID.

# ============================================================
# 5. STOP CONDITIONS
# ============================================================

stop_conditions:
- request attempts to mutate source transaction from 52.master-data
- request attempts to store source module extension as shared identity
- request attempts hard delete of historical master reference
- request attempts BI mutation
- request attempts approval decision direct mutation without 52 apply workflow
- request attempts audit finding direct mutation without 52/source workflow
- request attempts secret value storage
- request bypasses company scope

# ============================================================
# 6. RESULT CODE CATALOG
# ============================================================

success_result_codes:
- MASTER_DRAFT_CREATED
- MASTER_DRAFT_UPDATED
- MASTER_VERSION_CREATED
- MASTER_RECORD_ACTIVATED
- MASTER_RECORD_DEACTIVATION_SCHEDULED
- MASTER_IDENTIFIER_ADDED
- MASTER_IDENTIFIER_UPDATED
- BUSINESS_PARTNER_ROLE_ASSIGNED
- BUSINESS_PARTNER_ROLE_ENDED
- PUBLICATION_PACKAGE_CREATED
- PUBLICATION_PACKAGE_PUBLISHED
- PUBLICATION_ACKNOWLEDGED
- IMPACT_REVIEW_REGISTERED
- MASTER_RECORD_READ
- MASTER_RECORD_LISTED
- BI_SNAPSHOT_READ

failure_result_codes:
- VALIDATION_FAILED
- POLICY_BLOCKED
- ACTOR_UNAUTHORIZED
- MASTER_RECORD_NOT_FOUND
- MASTER_VERSION_CONFLICT
- DUPLICATE_IDENTIFIER
- PUBLICATION_TARGET_INVALID
- ACKNOWLEDGEMENT_TARGET_INVALID
- IMPACT_REVIEW_REQUIRED
- IDEMPOTENCY_CONFLICT

completion_state:
- validation rules frozen
- status transitions frozen
- idempotency/conflict rules frozen
- stop conditions frozen
# ============================================================
