# ============================================================
# ERP CANONICAL TABLE CLASSIFICATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical table classification model of ERP.

goals:
- classify ERP tables by semantic type
- separate source-of-truth, derived, cache, audit, bridge, and registry tables
- support dump analysis and schema normalization
- provide a standard vocabulary for table review

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Every ERP table should be classified by semantic role,
not just by its current file location or implementation convenience.

classification_priority:
- semantic truth meaning
- mutation authority
- lifecycle authority
- cross-module relationship meaning
- read-model or cache meaning

# ============================================================
# 2. CANONICAL TABLE CLASSES
# ============================================================

canonical_table_classes:
- source_of_truth
- support
- bridge
- registry
- derived
- cache
- audit
- history
- projection
- staging
- transitional
- deprecated_candidate

# ============================================================
# 3. SOURCE OF TRUTH
# ============================================================

table_class: source_of_truth

definition:
Authoritative record for a business, management, platform, or analytics concept.

characteristics:
- one formal owner
- mutation authority clearly defined
- current correctness accountable
- not subordinate to cache or derived tables

examples:
- sales_order_header
- approval_request
- governance_policy
- accounts_receivable_ledger
- journal_header
- accounting_period
- dashboard_definition
- kpi_definition

must_not_be:
- disposable cache
- mirror copy without authority
- UI-only convenience table

# ============================================================
# 4. SUPPORT
# ============================================================

table_class: support

definition:
Supports source-of-truth handling but is not itself the main semantic truth.

characteristics:
- operationally useful
- helps execution or validation
- may be mutable
- does not outrank source tables

examples:
- workflow_job
- scheduler_job
- job_monitoring_record
- payment_schedule
- runtime_health_snapshot
- connector_delivery_record

# ============================================================
# 5. BRIDGE
# ============================================================

table_class: bridge

definition:
Relates two modules, systems, or semantic objects without becoming their primary truth.

characteristics:
- cross-boundary meaning
- relationship-focused
- often references owning tables in other modules

examples:
- external_request_bridge
- sales_invoice_source_link
- supplier_invoice_source_link
- approval_actor_resolution
- identity_link

# ============================================================
# 6. REGISTRY
# ============================================================

table_class: registry

definition:
Catalog or registration structure for known items, definitions, contracts, or event metadata.

characteristics:
- listing and discovery meaning
- stable identifiers
- reference-oriented

examples:
- event_registry
- interface_contract_registry
- interface_version_registry
- external_endpoint_registry

# ============================================================
# 7. DERIVED
# ============================================================

table_class: derived

definition:
Computed from source-of-truth tables for a specific semantic purpose.

characteristics:
- generated from authoritative tables
- does not replace authoritative truth
- regeneration should be possible

examples:
- kpi_snapshot
- report_snapshot
- analytics_projection
- ai_analytics_summary

# ============================================================
# 8. CACHE
# ============================================================

table_class: cache

definition:
Performance-oriented replicated or precomputed table.

characteristics:
- replaceable
- must declare source tables
- must not become authority by accident

examples:
- dashboard_cache_snapshot
- dashboard_widget_dataset cache form
- BI cache layers

# ============================================================
# 9. AUDIT
# ============================================================

table_class: audit

definition:
Evidence-oriented tables capturing trace and accountability.

characteristics:
- evidence-focused
- historical meaning
- does not replace business current-state truth

examples:
- audit_event
- action_audit
- execution_audit
- accounting_audit
- audit_trace_link

# ============================================================
# 10. HISTORY
# ============================================================

table_class: history

definition:
Historical change records tied to a domain or control entity.

characteristics:
- time-sequenced
- related to an owned truth
- not necessarily generic audit

examples:
- document_state_history
- workflow_step_history
- approval lane history
- period status history

# ============================================================
# 11. PROJECTION
# ============================================================

table_class: projection

definition:
Read-model assembled for query convenience across one or more source tables.

characteristics:
- query-optimized
- may denormalize
- must declare source-of-truth origin

examples:
- control_tower_projection
- receivable_summary_projection
- approval_pending_projection

# ============================================================
# 12. STAGING
# ============================================================

table_class: staging

definition:
Temporary intake or pre-normalization holding structure.

characteristics:
- intermediate
- not final truth
- usually short-lived or pipeline-bound

examples:
- raw_import_staging
- connector_inbound_staging
- invoice_capture_staging

# ============================================================
# 13. TRANSITIONAL
# ============================================================

table_class: transitional

definition:
Used during migration from old ownership or model to canonical ownership.

characteristics:
- planned to move or disappear
- currently tolerated
- must have migration direction

examples:
- duplicated legacy request table awaiting migration
- legacy approval mirror table

# ============================================================
# 14. DEPRECATED CANDIDATE
# ============================================================

table_class: deprecated_candidate

definition:
Candidate for retirement because its semantic ownership is duplicated,
obsolete, or superseded.

characteristics:
- not immediately deleted
- under review
- should not receive new ownership responsibility

# ============================================================
# 15. CLASSIFICATION DECISION RULE
# ============================================================

decision_order:
- identify semantic meaning
- identify authoritative owner
- identify whether it stores current truth
- identify whether it stores evidence/history/projection/cache
- assign one primary class
- optionally assign one secondary operational note

rule:
Each table should have one primary canonical class.

# ============================================================
# 16. PRIMARY VS SECONDARY LABEL
# ============================================================

primary_label_examples:
- source_of_truth
- bridge
- cache
- audit

secondary_label_examples:
- high_risk
- migration_target
- read_heavy
- async_runtime_support

rule:
Secondary labels are optional and do not replace primary class.

# ============================================================
# 17. LAYER ALIGNMENT RULE
# ============================================================

layer_alignment_rule:
Table class does not replace layer ownership.

examples:
- approval_request:
  layer_owner: 200.management
  class: source_of_truth

- dashboard_cache_snapshot:
  layer_owner: 300.analytics
  class: cache

- audit_event:
  layer_owner: 000.platform
  class: audit

# ============================================================
# 18. VALIDATION RULES
# ============================================================

validation_rules:
- every major table must have one primary class
- cache tables must declare source tables
- derived tables must declare origin tables
- bridge tables must declare both boundary sides
- transitional tables must declare target ownership
- deprecated candidates must declare rationale

# ============================================================
# 19. REVIEW CONSEQUENCES
# ============================================================

review_consequences:
This classification must be used when reviewing:
- dump tables
- new schema proposals
- API ownership
- migration plans
- duplication cleanup

# ============================================================
# 20. CONCLUSION
# ============================================================

conclusion:
ERP tables must be canonically classified by semantic role.

Key rules:
- source_of_truth is unique in meaning
- derived/cache/projection never replace authority
- audit/history are historical and evidentiary
- bridge/registry/support are structural, not core truth

This document becomes the formal base for dump review and schema normalization.
