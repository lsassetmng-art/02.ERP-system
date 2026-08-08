# ============================================================
# ERP DUMP TO CANONICAL TABLE MAPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines how ERP dump contents should be mapped to canonical ERP ownership and classification.

goals:
- provide a standard review method for dump analysis
- map discovered tables to canonical layer/module ownership
- classify dump tables using canonical classes
- identify gaps, duplicates, and migration candidates

note:
This document defines mapping procedure and output format.
It does not yet assert the full classified result of every discovered table.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
A dumped table must be mapped by meaning,
not by historical accident, path name, or temporary implementation context.

# ============================================================
# 2. MAPPING OUTPUT FORMAT
# ============================================================

required_mapping_columns:
- physical_table_name
- guessed_current_location
- canonical_layer
- canonical_module
- canonical_table_class
- ownership_confidence
- migration_label
- rationale
- related_contracts
- notes

ownership_confidence_values:
- high
- medium
- low
- unknown

migration_label_values:
- canonical
- transitional
- duplicate_candidate
- deprecated_candidate
- cache_only
- bridge_only
- unknown

# ============================================================
# 3. MAPPING PROCEDURE
# ============================================================

mapping_procedure:
- step_1: identify table semantic meaning from name, fields, and usage
- step_2: determine whether it stores current truth, support, bridge, cache, audit, or projection
- step_3: assign canonical layer
- step_4: assign canonical module
- step_5: assign canonical table class
- step_6: assign confidence
- step_7: assign migration label
- step_8: record rationale and uncertainties

# ============================================================
# 4. FAST DECISION RULES
# ============================================================

fast_rules:
- if table stores approval requests or actions -> management/approval
- if table stores governance exceptions or controls -> management/governance
- if table stores AR/AP/journal/settlement/period -> business/accounting
- if table stores payment execution/tax/exchange rate -> business/finance
- if table stores dashboard cache or KPI output -> analytics
- if table stores audit evidence -> platform/audit
- if table stores workflow runtime/scheduler/message delivery -> platform/workflow
- if table stores event registry or dispatch -> platform/event
- if table stores role/permission/auth -> platform/permission
- if table stores company/org/product/partner/config/attachment -> platform/data

# ============================================================
# 5. EXAMPLE MAPPING ROWS
# ============================================================

example_rows:

- physical_table_name: approval_request
  canonical_layer: 200.management
  canonical_module: 270.approval
  canonical_table_class: source_of_truth
  ownership_confidence: high
  migration_label: canonical
  rationale: formal approval request truth

- physical_table_name: accounts_receivable_ledger
  canonical_layer: 100.business
  canonical_module: 140.accounting
  canonical_table_class: source_of_truth
  ownership_confidence: high
  migration_label: canonical
  rationale: authoritative receivable balance truth

- physical_table_name: dashboard_cache_snapshot
  canonical_layer: 300.analytics
  canonical_module: 330.dashboard
  canonical_table_class: cache
  ownership_confidence: high
  migration_label: cache_only
  rationale: performance-oriented dashboard cache

- physical_table_name: external_request_bridge
  canonical_layer: 000.platform
  canonical_module: 070.integration
  canonical_table_class: bridge
  ownership_confidence: medium
  migration_label: canonical
  rationale: cross-boundary exchange linking structure

# ============================================================
# 6. DUPLICATE DETECTION RULE
# ============================================================

duplicate_detection_rule:
If two or more tables appear to own the same semantic truth,
mark all but one as duplicate_candidate or transitional
until resolved.

review_questions:
- which one has mutation authority?
- which one is referenced as current truth?
- which one has lifecycle authority?
- which one is only a summary or mirror?

# ============================================================
# 7. UNKNOWN TABLE RULE
# ============================================================

unknown_table_rule:
If semantic meaning is unclear:
- do not force canonical ownership prematurely
- assign ownership_confidence = unknown
- assign migration_label = unknown
- record likely candidates
- require follow-up review

# ============================================================
# 8. CACHE / DERIVED / PROJECTION RULE
# ============================================================

derived_table_rule:
If a table is clearly computed from authoritative tables,
classify as derived, cache, or projection
instead of forcing source_of_truth.

required_metadata_for_non_authoritative_tables:
- source_tables
- regeneration_method if known
- invalidation logic if known
- read purpose

# ============================================================
# 9. BRIDGE RULE
# ============================================================

bridge_rule:
If a table mainly links modules or systems,
classify it as bridge even if heavily used operationally.

examples:
- source_link tables
- bridge delivery state
- identity mapping tables
- connector relation tables

# ============================================================
# 10. DUMP REVIEW OUTPUT RULE
# ============================================================

recommended_output_files:
- ERP_DUMP_TABLE_INVENTORY.tsv
- ERP_DUMP_TABLE_CANONICAL_MAPPING.tsv
- ERP_DUMP_TABLE_DUPLICATE_REVIEW.tsv
- ERP_DUMP_TABLE_UNKNOWN_REVIEW.tsv

recommended_output_columns:
- table_name
- canonical_layer
- canonical_module
- canonical_class
- confidence
- migration_label
- notes

# ============================================================
# 11. API RELATION RULE
# ============================================================

api_relation_rule:
Mapped table ownership must later be linked to:
- request contracts
- action contracts
- query contracts
- interface ownership registry

example:
- approval_request table -> approval endpoints
- accounts_receivable_ledger -> receivable detail/list endpoints
- governance exception tables -> reopen/cancel governance endpoints

# ============================================================
# 12. MIGRATION CONSEQUENCES
# ============================================================

migration_consequences:
After dump tables are mapped:
- canonical tables remain
- transitional tables get migration plans
- duplicates get rationalization plans
- unknowns get follow-up analysis
- deprecated candidates get deprecation plans

# ============================================================
# 13. REVIEW SEQUENCE
# ============================================================

recommended_review_sequence:
- platform tables
- management tables
- accounting/finance tables
- other business tables
- analytics tables
- duplicates and unknowns last

# ============================================================
# 14. CONCLUSION
# ============================================================

conclusion:
ERP dump tables must be mapped into canonical ownership
by semantic meaning and table class.

This document becomes the formal procedure for:
- dump review
- canonical classification
- duplicate detection
- migration planning
