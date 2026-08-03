# ============================================================
# MASTER DATA OWNERSHIP / REFERENCE / CORRECTION EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
related_modules:
- all ERP source modules
- 50.approval
- 51.audit
- 60.business-intelligence
- 12.common-os

purpose:
Define 52.master-data as shared master identity, reference, golden record,
publication, correction, merge, split, and lifecycle governance owner without
absorbing business transaction truth.

canonical_role:
- shared master data / reference data / golden record governance truth

# ============================================================
# 1. CORE MASTER DATA OBJECTS
# ============================================================

core_objects:
- mdm_master_record
- mdm_master_identifier
- mdm_master_version
- mdm_master_attribute_set
- mdm_master_effective_period
- mdm_master_alias
- mdm_master_cross_reference
- mdm_master_domain_extension_reference
- mdm_master_change_request
- mdm_master_change_approval_reference
- mdm_master_publication_package
- mdm_master_publication_event
- mdm_master_consumer_acknowledgement
- mdm_duplicate_candidate
- mdm_merge_request
- mdm_split_request
- mdm_data_quality_issue
- mdm_reference_code_set
- mdm_reference_code_value

# ============================================================
# 2. MASTER RECORD
# ============================================================

object_name:
- mdm_master_record

meaning:
- canonical shared master identity record

required_fields:
- master_record_id
- company_id_or_global_scope
- master_domain
- master_code
- master_name
- master_status
- golden_record_flag
- current_version_id
- effective_from
- effective_to_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

master_domain_examples:
- company
- legal_entity
- business_partner
- customer_core
- supplier_core
- item_core
- product_core
- location_core
- site_core
- address
- currency
- unit_of_measure
- tax_reference
- calendar_reference
- common_code

allowed_master_status:
- draft
- active
- inactive
- pending_approval
- pending_publication
- deprecated
- merged
- split
- blocked
- cancelled
- superseded

rules:
- master record is shared identity truth
- master record is not transaction truth
- status change must be versioned or evented
- inactive / deprecated does not delete historical references

# ============================================================
# 3. MASTER VERSION
# ============================================================

object_name:
- mdm_master_version

meaning:
- immutable/effective version of master data attributes

required_fields:
- master_version_id
- master_record_id
- company_id_or_global_scope
- version_number
- version_status
- effective_from
- effective_to_or_null
- attribute_set_reference
- predecessor_version_id_or_null
- successor_version_id_or_null
- change_request_id_or_null
- approval_reference_or_null
- created_at
- created_by
- lineage_reference

allowed_version_status:
- draft
- active
- superseded
- cancelled
- correction
- rollback_reference

rules:
- active version must be effective-date resolvable
- material changes create new version
- historical source references must resolve to correct version/effective date
- old version must remain queryable

# ============================================================
# 4. MASTER IDENTIFIER / ALIAS / CROSS-REFERENCE
# ============================================================

object_name:
- mdm_master_identifier

required_fields:
- master_identifier_id
- master_record_id
- identifier_type
- identifier_value
- issuing_context_or_null
- primary_flag
- effective_from
- effective_to_or_null
- status
- lineage_reference

identifier_type_examples:
- internal_code
- external_code
- customer_number
- supplier_number
- item_number
- barcode
- legal_registration_number
- tax_number
- legacy_system_id

object_name:
- mdm_master_alias

required_fields:
- master_alias_id
- master_record_id
- alias_type
- alias_value
- language_or_locale_or_null
- effective_from
- effective_to_or_null
- status
- lineage_reference

object_name:
- mdm_master_cross_reference

required_fields:
- cross_reference_id
- master_record_id
- external_system_or_module
- external_object_type
- external_object_id
- external_code_or_key
- mapping_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- identifier and cross-reference preserve mapping lineage
- alias does not create separate master identity
- legacy keys must not replace master_record_id as shared ERP identity

# ============================================================
# 5. DOMAIN EXTENSION REFERENCE
# ============================================================

object_name:
- mdm_master_domain_extension_reference

meaning:
- controlled reference from shared master to module-specific extension owner

required_fields:
- domain_extension_reference_id
- master_record_id
- company_id
- source_module
- extension_object_type
- extension_object_id
- extension_status
- effective_from
- effective_to_or_null
- lineage_reference

extension_examples:
- CRM customer relationship profile
- sales price condition profile
- billing customer preference
- procurement supplier qualification
- purchase supplier commercial terms
- inventory item stocking policy
- warehouse item handling policy
- logistics carrier service extension
- quality inspection specification
- costing cost profile
- accounting posting setup
- payroll profile extension where applicable

rules:
- extension reference points to source module object
- extension owner remains source module
- 52 does not own extension content unless explicitly common-master attribute
- source extension must reference master_record_id

# ============================================================
# 6. MASTER CHANGE REQUEST
# ============================================================

object_name:
- mdm_master_change_request

meaning:
- controlled request to create/update/deactivate/merge/split/publish master data

required_fields:
- change_request_id
- company_id_or_global_scope
- requested_change_type
- master_domain
- target_master_record_id_or_null
- proposed_master_payload_reference
- request_reason
- requested_by
- requested_at
- source_module_or_actor
- approval_required_flag
- approval_reference_or_null
- validation_result_reference_or_null
- change_request_status
- lineage_reference

requested_change_type_examples:
- create
- update
- effective_date_change
- deactivate
- reactivate
- merge
- split
- alias_add
- duplicate_mark
- duplicate_resolve
- cross_reference_add
- cross_reference_update
- publication
- correction
- rollback_reference

allowed_change_request_status:
- draft
- submitted
- validation_pending
- approval_pending
- approved
- rejected
- returned
- applied
- published
- cancelled
- superseded

rules:
- change request does not update master until applied by 52 workflow
- approval decision may authorize but not apply master change by itself
- audit finding may request but not apply master change by itself
- source module request may propose but not apply common master change by itself

# ============================================================
# 7. CHANGE VALIDATION
# ============================================================

validation_required_checks:
- domain ownership check
- duplicate check
- required attribute check
- identifier uniqueness check
- effective date overlap check
- reference integrity check
- downstream consumer impact check where applicable
- approval policy check
- data quality rule check

validation_result_examples:
- passed
- passed_with_warning
- blocked_duplicate
- blocked_missing_required
- blocked_effective_date_overlap
- blocked_reference_integrity
- blocked_consumer_impact
- blocked_approval_required
- failed_unknown

rules:
- failed validation blocks apply unless exception approval policy allows
- warning must be preserved
- consumer impact must be visible for merge/split/deactivate

# ============================================================
# 8. MASTER PUBLICATION PACKAGE
# ============================================================

object_name:
- mdm_master_publication_package

meaning:
- controlled publication of master snapshot/change events to consumer modules

required_fields:
- publication_package_id
- company_id_or_global_scope
- master_domain
- publication_type
- master_record_id_set
- master_version_id_set
- target_module_set
- publication_status
- publication_created_at
- publication_created_by
- source_change_request_id_or_null
- lineage_reference

publication_type_examples:
- full_snapshot
- delta_change
- merge_notice
- split_notice
- deactivate_notice
- reactivate_notice
- correction_notice
- reference_mapping_notice

allowed_publication_status:
- building
- validation_pending
- published
- partially_acknowledged
- fully_acknowledged
- failed
- cancelled
- superseded

rules:
- publication does not guarantee consumer acceptance
- publication must preserve master version/effective basis
- consumer rejection must be recorded
- publication cannot silently rewrite consumer transactions

# ============================================================
# 9. CONSUMER ACKNOWLEDGEMENT
# ============================================================

object_name:
- mdm_master_consumer_acknowledgement

required_fields:
- consumer_acknowledgement_id
- publication_package_id
- company_id
- target_module
- acknowledgement_status
- acknowledged_at_or_null
- acknowledged_by_system_actor_or_null
- rejection_reason_code_or_null
- rejection_detail_or_null
- consumer_impact_reference_or_null
- lineage_reference

allowed_acknowledgement_status:
- pending
- acknowledged
- acknowledged_with_warning
- rejected
- held_for_review
- failed
- superseded

rejection_reason_examples:
- MODULE_VALIDATION_FAILED
- EXTENSION_CONFLICT
- EFFECTIVE_DATE_CONFLICT
- MAPPING_UNRESOLVABLE
- DUPLICATE_CONFLICT
- DEACTIVATION_BLOCKED_BY_OPEN_TRANSACTION
- PERMISSION_DENIED
- UNKNOWN_ERROR

rules:
- source module may reject/hold publication for module-specific reasons
- rejection does not automatically revert master truth
- remediation/correction may require 52 change or source extension change depending on owner

# ============================================================
# 10. DUPLICATE / MERGE / SPLIT
# ============================================================

object_name:
- mdm_duplicate_candidate

required_fields:
- duplicate_candidate_id
- company_id_or_global_scope
- master_domain
- master_record_id_a
- master_record_id_b
- match_score_or_reason
- duplicate_status
- detected_at
- detected_by
- review_reference_or_null
- lineage_reference

allowed_duplicate_status:
- detected
- under_review
- confirmed_duplicate
- rejected_duplicate
- merge_requested
- resolved
- cancelled
- superseded

object_name:
- mdm_merge_request

required_fields:
- merge_request_id
- company_id_or_global_scope
- master_domain
- surviving_master_record_id
- merged_master_record_id_set
- merge_reason
- downstream_impact_summary
- approval_reference_or_null
- merge_status
- requested_at
- requested_by
- lineage_reference

allowed_merge_status:
- draft
- validation_pending
- approval_pending
- approved
- applied
- published
- rejected
- cancelled
- superseded

object_name:
- mdm_split_request

required_fields:
- split_request_id
- company_id_or_global_scope
- master_domain
- original_master_record_id
- proposed_new_master_record_set
- split_reason
- downstream_impact_summary
- approval_reference_or_null
- split_status
- requested_at
- requested_by
- lineage_reference

allowed_split_status:
- draft
- validation_pending
- approval_pending
- approved
- applied
- published
- rejected
- cancelled
- superseded

merge_split_rules:
- merge/split must preserve historical mapping
- historical transactions must not be silently re-keyed
- source modules may need extension remapping
- BI dimensions must refresh through snapshot process
- approval may be required for high-impact merge/split
- audit trail must remain complete

# ============================================================
# 11. DATA QUALITY ISSUE
# ============================================================

object_name:
- mdm_data_quality_issue

required_fields:
- data_quality_issue_id
- company_id_or_global_scope
- master_domain
- master_record_id_or_candidate_reference
- issue_type
- severity
- issue_summary
- detected_by_module_or_actor
- detected_at
- remediation_owner_module
- remediation_status
- linked_change_request_id_or_null
- linked_audit_finding_id_or_null
- lineage_reference

issue_type_examples:
- missing_required_attribute
- duplicate_candidate
- invalid_identifier
- invalid_effective_date
- inconsistent_cross_reference
- stale_master
- invalid_status
- consumer_rejection
- extension_conflict

allowed_remediation_status:
- open
- assigned
- in_progress
- change_requested
- corrected
- accepted_risk
- closed
- cancelled
- superseded

rules:
- data quality issue belongs to 52 when master-related
- if issue concerns source extension, remediation owner may be source module
- audit finding may link but does not replace data quality issue
- correction follows owner workflow

# ============================================================
# 12. REFERENCE CODE SET
# ============================================================

object_name:
- mdm_reference_code_set

required_fields:
- code_set_id
- company_id_or_global_scope
- code_set_code
- code_set_name
- code_set_domain
- owner_module
- version_id
- effective_from
- effective_to_or_null
- active_flag
- lineage_reference

object_name:
- mdm_reference_code_value

required_fields:
- code_value_id
- code_set_id
- code_value
- display_name
- sort_order_or_null
- parent_code_value_id_or_null
- effective_from
- effective_to_or_null
- active_flag
- lineage_reference

rules:
- common code sets may be owned by 52
- domain-specific code sets may be owned by source modules
- owner_module must be explicit
- BI may consume code dimensions but not alter code truth

# ============================================================
# 13. OUTPUT TO BI / APPROVAL / AUDIT / COMMONOS
# ============================================================

BI_consumable_outputs:
- master record snapshot
- master version snapshot
- master publication snapshot
- duplicate candidate snapshot
- data quality issue snapshot
- reference code snapshot
- consumer acknowledgement snapshot

approval_relationship:
- 50 may approve master change request / merge / split / deactivate
- approval decision does not apply master change by itself

audit_relationship:
- 51 may audit master controls and create findings
- audit finding does not mutate master record directly

CommonOS_allowed_presentation:
- master list/detail/form/search
- master change request queue
- duplicate review UI
- publication status UI
- consumer acknowledgement UI
- data quality issue UI

# ============================================================
# 14. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- source module silently creating shared master identity outside 52 workflow
- master record update directly changing source transaction values
- master merge deleting historical identities
- master split erasing original lineage
- deactivation deleting source history
- BI dimension edit treated as master correction
- approval outcome treated as applied master change without 52 apply step
- audit finding treated as applied master change
- CommonOS form draft treated as master record
- consumer rejection silently ignored without issue tracking

# ============================================================
# 15. DECISION TEST
# ============================================================

decision_test:
- If it is shared master identity / golden record / reference code / publication, 52 owns it.
- If it is module-specific extension, the domain source module owns it.
- If it is a transaction or business result, source module owns it.
- If it is approval, 50 owns it.
- If it is audit finding, 51 owns it.
- If it is dashboard projection, 60 owns projection only.

# ============================================================
# 16. COMPLETION STATE
# ============================================================

completion_state:
- master data exact design fixed
- record/version/identifier/cross-reference fixed
- change request/publication/acknowledgement fixed
- duplicate/merge/split/data quality fixed
- approval/audit/BI/CommonOS boundaries fixed

# ============================================================
