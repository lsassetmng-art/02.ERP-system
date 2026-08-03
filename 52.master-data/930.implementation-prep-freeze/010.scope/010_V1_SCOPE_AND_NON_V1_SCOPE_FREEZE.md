# ============================================================
# 52.master-data V1 SCOPE / NON-V1 SCOPE FREEZE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
phase: implementation-prep-freeze
db_apply_status: STOPPED

# ============================================================
# 1. V1 PURPOSE
# ============================================================

v1_purpose:
- Establish shared master identity/reference foundation for ERP.
- Provide stable IDs and version/effective-date lineage for source modules.
- Support publication and acknowledgement patterns for source module consumers.
- Prevent source modules from forking shared customer/supplier/item/location/company identity.
- Provide enough master-data base for later transaction modules.

# ============================================================
# 2. V1 MASTER DOMAINS
# ============================================================

v1_master_domains:
- business_partner
- customer
- supplier
- contact_person
- item
- product
- unit_of_measure
- address
- location
- site
- warehouse_reference
- company
- legal_entity
- organization_unit
- department
- cost_center
- profit_center

# ============================================================
# 3. V1 INCLUDED CAPABILITIES
# ============================================================

v1_included:
- create draft master record
- update draft master record
- activate master record
- deactivate master record
- create new master version
- effective-date controlled update
- identifier registration
- role assignment for customer/supplier
- item/product/UOM reference creation
- location/site/address reference creation
- company/legal entity/org reference creation
- publication package creation
- publication line creation
- consumer acknowledgement recording
- impact review recording
- source extension owner matrix reference
- read/search/list/detail endpoints
- audit-friendly lineage fields
- BI snapshot export candidate

# ============================================================
# 4. V1 EXCLUDED
# ============================================================

v1_excluded:
- DB apply
- runtime implementation
- full UI implementation
- automatic merge/split execution
- high-volume import
- OCR/import from documents
- external system sync
- bank account secret storage
- tax calculation engine
- chart of accounts implementation
- supplier invoice matching runtime
- transaction posting
- stock ledger
- payroll
- order/invoice creation
- payment execution
- AI automatic master correction
- destructive cleanup

# ============================================================
# 5. V1 MASTER RECORD STATE MODEL
# ============================================================

master_record_states:
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

state_rules:
- draft can be edited.
- active changes require version/effective-date handling.
- inactive/deprecated blocks future usage where policy requires.
- merged/split preserves lineage and historical references.
- cancelled/superseded never deletes historical source references.

# ============================================================
# 6. V1 LINEAGE REQUIREMENTS
# ============================================================

required_lineage_fields:
- company_id
- master_domain
- master_record_id
- master_version_id
- effective_from
- effective_to_or_null
- created_at
- created_by
- updated_at_or_null
- updated_by_or_null
- lineage_reference
- source_change_request_id_or_null
- approval_reference_or_null

rules:
- historical source transactions must remain explainable.
- source modules store master IDs and version/effective-date basis where needed.
- master correction does not rewrite source transactions directly.

# ============================================================
# 7. ACCEPTANCE CRITERIA
# ============================================================

acceptance_criteria:
- V1 scope is limited to shared identity/reference and publication/acknowledgement.
- Source module extensions remain outside 52.
- No business transaction truth is moved into 52.
- No DB apply is performed in this freeze.
- DB review by 佐藤（DB担当） is required before any DDL apply.

# ============================================================
