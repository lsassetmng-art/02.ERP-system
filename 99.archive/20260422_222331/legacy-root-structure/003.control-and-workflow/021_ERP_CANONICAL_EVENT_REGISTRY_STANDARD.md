# ============================================================
# ERP CANONICAL EVENT REGISTRY STANDARD
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical standard for registering ERP events.

goals:
- standardize event registration
- define minimum metadata for all canonical events
- support event governance, discovery, and reuse
- prevent ambiguous or duplicate event meaning

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Every canonical ERP event must be registered before
it is treated as a formal reusable event in ERP design.

event_registry_must_define:
- event_code
- event_family
- semantic_owner_layer
- semantic_owner_module
- infrastructure_owner
- event_meaning
- target_entity_type
- visibility_class
- sync_or_async_publication
- source_contracts
- source_tables
- non_goals

# ============================================================
# 2. REQUIRED REGISTRY FIELDS
# ============================================================

required_registry_fields:
- event_code
- event_name
- event_family
- semantic_owner_layer
- semantic_owner_module
- infrastructure_owner_layer
- infrastructure_owner_module
- target_entity_type
- event_meaning
- emitted_by_actions
- source_of_truth_tables
- visibility_class
- publication_mode
- canonical_status
- non_goals
- notes

canonical_status_values:
- canonical
- draft
- planned
- deprecated_candidate

publication_mode_values:
- sync
- async
- internal_only
- mixed

visibility_class_values:
- internal_only
- module_internal
- ERP_internal
- app_facing
- external_facing

# ============================================================
# 3. EVENT CODE RULE
# ============================================================

event_code_rule:
Event codes must be stable, unique, and occurrence-based.

good_examples:
- document_submitted
- approval_requested
- approval_approved
- settlement_applied
- journal_posted
- accounting_period_closed
- dashboard_refreshed

avoid:
- do_submit
- approved_status
- process_complete_generic
- final_event

# ============================================================
# 4. EVENT FAMILY RULE
# ============================================================

event_family_rule:
Every event must belong to a canonical family.

canonical_families:
- request_intake_event
- document_lifecycle_event
- approval_event
- governance_event
- execution_event
- integration_event
- workflow_event
- accounting_event
- settlement_event
- reporting_event
- analytics_event
- audit_support_event

# ============================================================
# 5. OWNERSHIP RULE
# ============================================================

ownership_rule:
Event registry must record both:
- semantic owner
- infrastructure owner

standard_infrastructure_owner:
- 000.platform/050.event

semantic_owner_examples:
- approval_approved -> 200.management/270.approval
- settlement_applied -> 100.business/140.accounting
- dashboard_refreshed -> 300.analytics/330.dashboard

# ============================================================
# 6. TARGET ENTITY RULE
# ============================================================

target_entity_rule:
Each event must declare the target entity type it speaks about.

examples:
- document
- approval_request
- governance_request
- execution_request
- settlement
- journal
- accounting_period
- dashboard
- forecast_run

# ============================================================
# 7. SOURCE ACTION RULE
# ============================================================

source_action_rule:
Each event should declare likely source actions.

examples:
- document_submitted <- submit
- approval_approved <- approve
- settlement_applied <- create_settlement
- journal_posted <- post_journal
- execution_retried <- retry

# ============================================================
# 8. SOURCE TABLE RULE
# ============================================================

source_table_rule:
Each event should declare the authoritative tables
whose semantic truth it reflects.

examples:
- approval_approved -> approval_request, approval_action
- settlement_applied -> settlement_header, settlement_line
- journal_posted -> journal_header, journal_line

# ============================================================
# 9. NON-GOAL RULE
# ============================================================

non_goal_rule:
Every canonical event should declare what it does not mean.

examples:
- approval_approved does not mean business finalized
- settlement_applied does not mean dashboard refreshed
- journal_posted does not mean payment completed

# ============================================================
# 10. DUPLICATE PREVENTION RULE
# ============================================================

duplicate_prevention_rule:
Do not register multiple event codes for the same semantic occurrence
without explicit versioning or scope separation.

bad_pattern_examples:
- document_submit_done
- document_submitted
for the same exact meaning

# ============================================================
# 11. REVIEW RULE
# ============================================================

review_rule:
Before a new event becomes canonical, verify:
- family correctness
- semantic owner correctness
- duplicate risk
- source action linkage
- source table linkage
- non-goal clarity

# ============================================================
# 12. CONCLUSION
# ============================================================

conclusion:
ERP canonical events must be formally registered with explicit ownership,
family, target, source, and non-goal semantics.

This document becomes the formal basis for:
- event registry design
- event review
- event reuse
- event governance
