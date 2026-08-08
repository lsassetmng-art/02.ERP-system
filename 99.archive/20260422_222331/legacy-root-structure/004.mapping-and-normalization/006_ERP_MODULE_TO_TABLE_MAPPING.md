# ============================================================
# ERP MODULE TO TABLE MAPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical mapping between ERP modules
and their expected table ownership categories.

goals:
- provide a formal module-to-table ownership map
- prepare for physical schema normalization
- provide a bridge between architecture and database design
- make later dump-based table classification easier

note:
This document defines canonical expected ownership categories.
It does not claim that every listed table already exists physically.

# ============================================================
# 1. MAPPING PRINCIPLE
# ============================================================

mapping_principle:
Each module must own the tables that represent
its semantic source-of-truth meaning.

mapping_columns:
- layer
- module
- table_category
- canonical_table_patterns
- ownership_type
- notes

ownership_type_meaning:
- source_of_truth
- support
- bridge
- registry
- derived
- audit
- cache

# ============================================================
# 2. 000.platform MAPPING
# ============================================================

## 2.1 010.foundation

layer: 000.platform
module: 010.foundation

table_categories:
- document skeleton
- lifecycle baseline
- numbering baseline
- shared document relation skeleton

canonical_table_patterns:
- document_header
- document_line
- document_relation
- document_number_sequence
- document_lifecycle_rule
- document_type_definition

ownership_type:
- source_of_truth

notes:
Foundation owns shared document structure, not domain truth itself.

## 2.2 020.security

layer: 000.platform
module: 020.security

table_categories:
- operation security logging
- security incidents
- runtime health support
- retention/security control

canonical_table_patterns:
- operation_log
- security_incident
- runtime_health_snapshot
- job_monitoring_record
- retention_policy_record

ownership_type:
- source_of_truth
- support

## 2.3 030.identity

layer: 000.platform
module: 030.identity

table_categories:
- identity reference
- actor/subject mapping

canonical_table_patterns:
- actor_identity
- subject_reference
- identity_link
- external_identity_mapping

ownership_type:
- source_of_truth
- bridge

## 2.4 040.permission

layer: 000.platform
module: 040.permission

table_categories:
- role and permission baseline
- authorization mapping

canonical_table_patterns:
- role
- permission
- role_permission
- actor_role_assignment
- authorization_scope_rule

ownership_type:
- source_of_truth
- bridge

## 2.5 050.event

layer: 000.platform
module: 050.event

table_categories:
- event registry
- event dispatch
- command execution
- queue execution support

canonical_table_patterns:
- event_registry
- event_header
- event_dispatch_record
- command_execution_record
- operation_queue_item
- finalization_event_record

ownership_type:
- source_of_truth
- registry
- support

## 2.6 060.data

layer: 000.platform
module: 060.data

table_categories:
- master data
- shared configuration
- attachments/files
- schema and migration metadata

canonical_table_patterns:
- company
- organization
- partner
- product
- employee_master
- configuration_parameter
- feature_flag
- attachment
- file_reference
- schema_version
- migration_history

ownership_type:
- source_of_truth
- registry
- support

## 2.7 070.integration

layer: 000.platform
module: 070.integration

table_categories:
- connectors
- integration bridges
- external boundary mappings

canonical_table_patterns:
- integration_connector
- external_endpoint_registry
- integration_bridge_record
- external_request_bridge
- connector_delivery_record

ownership_type:
- source_of_truth
- bridge
- support

## 2.8 080.workflow

layer: 000.platform
module: 080.workflow

table_categories:
- workflow definition
- workflow runtime support
- scheduler/batch/alert/message support

canonical_table_patterns:
- workflow_definition
- workflow_state_machine
- workflow_instance
- workflow_step_state
- scheduler_job
- batch_job
- alert_record
- message_delivery_record
- notification_queue

ownership_type:
- source_of_truth
- support

## 2.9 090.audit

layer: 000.platform
module: 090.audit

table_categories:
- audit evidence
- trace correlation
- snapshots

canonical_table_patterns:
- audit_event
- audit_trace_link
- audit_snapshot
- action_audit
- state_transition_audit
- execution_audit
- accounting_audit

ownership_type:
- source_of_truth
- audit

## 2.10 095.interface

layer: 000.platform
module: 095.interface

table_categories:
- contract registry
- interface metadata
- interface consumers

canonical_table_patterns:
- interface_contract_registry
- interface_version_registry
- interface_consumer_registry
- api_publication_record

ownership_type:
- registry
- support

# ============================================================
# 3. 100.business MAPPING
# ============================================================

## 3.1 110.sales

layer: 100.business
module: 110.sales

table_categories:
- sales transaction truth
- sales documents

canonical_table_patterns:
- sales_order_header
- sales_order_line
- sales_transaction
- shipment_header
- shipment_line
- sales_invoice_source_link

ownership_type:
- source_of_truth
- bridge

## 3.2 120.purchase

layer: 100.business
module: 120.purchase

table_categories:
- purchase transaction truth
- procurement documents

canonical_table_patterns:
- purchase_request_header
- purchase_request_line
- purchase_order_header
- purchase_order_line
- goods_receipt_header
- goods_receipt_line
- supplier_invoice_source_link

ownership_type:
- source_of_truth
- bridge

## 3.3 130.inventory

layer: 100.business
module: 130.inventory

table_categories:
- stock truth
- stock movement
- reservation

canonical_table_patterns:
- warehouse
- stock_ledger
- stock_balance
- stock_movement
- stock_reservation

ownership_type:
- source_of_truth

## 3.4 140.accounting

layer: 100.business
module: 140.accounting

table_categories:
- ledger truth
- settlement truth
- period truth
- posting truth

canonical_table_patterns:
- journal_header
- journal_line
- accounts_receivable_ledger
- accounts_payable_ledger
- settlement_header
- settlement_line
- accounting_period
- posting_batch
- reconciliation_record
- matching_record

ownership_type:
- source_of_truth
- bridge
- support

## 3.5 150.finance

layer: 100.business
module: 150.finance

table_categories:
- payment and finance operation truth
- tax and currency operational truth

canonical_table_patterns:
- payment_transaction
- payment_schedule
- tax_rule
- tax_calculation_result
- currency_definition
- exchange_rate
- bank_account_reference

ownership_type:
- source_of_truth
- support

## 3.6 160.hr

layer: 100.business
module: 160.hr

table_categories:
- hr transaction truth

canonical_table_patterns:
- employment_record
- payroll_record
- attendance_record

ownership_type:
- source_of_truth

## 3.7 170.project

layer: 100.business
module: 170.project

table_categories:
- project truth
- project cost truth

canonical_table_patterns:
- project_header
- project_member
- project_cost_record

ownership_type:
- source_of_truth

## 3.8 180.production

layer: 100.business
module: 180.production

table_categories:
- production structure and work truth

canonical_table_patterns:
- bom_header
- bom_line
- work_order
- production_execution_record

ownership_type:
- source_of_truth

## 3.9 190.crm

layer: 100.business
module: 190.crm

table_categories:
- crm operational truth

canonical_table_patterns:
- crm_account
- crm_contact
- crm_activity
- crm_opportunity

ownership_type:
- source_of_truth

## 3.10 195.asset

layer: 100.business
module: 195.asset

table_categories:
- asset operational truth

canonical_table_patterns:
- asset_master
- asset_assignment
- asset_maintenance_record

ownership_type:
- source_of_truth

## 3.11 196.quality

layer: 100.business
module: 196.quality

table_categories:
- quality operational truth

canonical_table_patterns:
- quality_case
- quality_inspection
- quality_result

ownership_type:
- source_of_truth

## 3.12 197.legal

layer: 100.business
module: 197.legal

table_categories:
- legal business-linked truth

canonical_table_patterns:
- legal_case
- legal_document_reference
- compliance_business_record

ownership_type:
- source_of_truth
- bridge

# ============================================================
# 4. 200.management MAPPING
# ============================================================

## 4.1 210.strategy

layer: 200.management
module: 210.strategy

table_categories:
- strategy structures

canonical_table_patterns:
- strategy_theme
- strategy_goal
- strategy_initiative

ownership_type:
- source_of_truth

## 4.2 220.planning

layer: 200.management
module: 220.planning

table_categories:
- planning structures

canonical_table_patterns:
- planning_cycle
- planning_item
- plan_target

ownership_type:
- source_of_truth

## 4.3 230.performance

layer: 200.management
module: 230.performance

table_categories:
- performance structures

canonical_table_patterns:
- performance_review
- performance_metric_assignment
- performance_assessment

ownership_type:
- source_of_truth

## 4.4 240.compliance

layer: 200.management
module: 240.compliance

table_categories:
- compliance oversight truth

canonical_table_patterns:
- compliance_case
- compliance_check
- compliance_violation_record

ownership_type:
- source_of_truth

## 4.5 250.risk

layer: 200.management
module: 250.risk

table_categories:
- risk oversight truth

canonical_table_patterns:
- risk_register
- risk_assessment
- risk_control_record

ownership_type:
- source_of_truth

## 4.6 260.governance

layer: 200.management
module: 260.governance

table_categories:
- governance policy
- exception and high-risk control

canonical_table_patterns:
- governance_policy
- operation_policy
- exception_request
- high_risk_operation_request
- reopen_request
- cancel_request

ownership_type:
- source_of_truth

## 4.7 270.approval

layer: 200.management
module: 270.approval

table_categories:
- approval truth

canonical_table_patterns:
- approval_request
- approval_action
- approval_route
- approval_lane
- delegation_rule
- approval_actor_resolution

ownership_type:
- source_of_truth
- bridge

## 4.8 280.ai-support

layer: 200.management
module: 280.ai-support

table_categories:
- management ai support truth

canonical_table_patterns:
- ai_support_case
- ai_support_suggestion
- ai_management_assist_record

ownership_type:
- source_of_truth
- derived

## 4.9 290.reporting

layer: 200.management
module: 290.reporting

table_categories:
- formal reporting structures

canonical_table_patterns:
- report_definition
- report_publication
- report_distribution
- report_snapshot

ownership_type:
- source_of_truth
- derived

# ============================================================
# 5. 300.analytics MAPPING
# ============================================================

## 5.1 310.kpi

layer: 300.analytics
module: 310.kpi

table_categories:
- KPI definition and result

canonical_table_patterns:
- kpi_definition
- kpi_snapshot
- kpi_measurement

ownership_type:
- source_of_truth
- derived

## 5.2 320.bi

layer: 300.analytics
module: 320.bi

table_categories:
- analytics/BI models and projections

canonical_table_patterns:
- bi_dataset
- analytics_projection
- analytics_cube
- reporting_view_registry

ownership_type:
- derived
- cache

## 5.3 330.dashboard

layer: 300.analytics
module: 330.dashboard

table_categories:
- dashboard view structures

canonical_table_patterns:
- dashboard_definition
- dashboard_widget
- dashboard_widget_dataset
- dashboard_cache_snapshot

ownership_type:
- source_of_truth
- derived
- cache

## 5.4 340.forecast

layer: 300.analytics
module: 340.forecast

table_categories:
- forecast structures and outputs

canonical_table_patterns:
- forecast_definition
- forecast_run
- forecast_result

ownership_type:
- source_of_truth
- derived

## 5.5 350.ai-analytics

layer: 300.analytics
module: 350.ai-analytics

table_categories:
- AI analytics outputs

canonical_table_patterns:
- ai_analytics_run
- ai_analytics_summary
- ai_analytics_result

ownership_type:
- source_of_truth
- derived

# ============================================================
# 6. SHARED TABLE PATTERN RULES
# ============================================================

shared_table_pattern_rules:

document_pattern_rule:
- shared document skeleton tables belong to foundation
- domain document tables belong to business modules
- approval relation belongs to approval
- audit evidence belongs to audit

event_pattern_rule:
- event infrastructure belongs to event
- event meaning follows source module

request_pattern_rule:
- generic intake envelopes may belong to platform/foundation or interface
- business intake requests belong to business meaning owners
- governance/approval requests belong to management meaning owners

history_pattern_rule:
- current truth belongs to the owning module
- evidence and generic trace belong to audit
- domain-native action history remains with the source module

# ============================================================
# 7. TABLE MAPPING VALIDATION RULES
# ============================================================

validation_rules:
- every important table must map to one owning module
- duplicated source-of-truth tables are invalid
- cache and derived tables must declare their source tables
- interface-facing tables must not silently become business truth
- analytics tables must declare non-authoritative status when applicable

# ============================================================
# 8. MIGRATION LABELS
# ============================================================

migration_labels:
- canonical
- expected_but_not_yet_created
- transitional
- duplicate_candidate
- deprecated_candidate
- cache_only
- bridge_only

migration_use:
This mapping should later be applied against actual dumps and live schemas
to classify real tables into one of the above states.

# ============================================================
# 9. FOLLOW-UP DOCUMENTS
# ============================================================

next_documents:
- ERP_CANONICAL_TABLE_CLASSIFICATION
- ERP_CANONICAL_STATE_MODEL
- ERP_CANONICAL_EVENT_MODEL
- ERP_DUMP_TO_CANONICAL_TABLE_MAPPING

# ============================================================
# 10. CONCLUSION
# ============================================================

conclusion:
This document defines the canonical expected table patterns
for every ERP module.

It is the bridge between:
- architecture
- module responsibility
- physical schema design
- later dump-based normalization

This mapping must be used as the formal baseline
for real-table classification and future schema alignment.
