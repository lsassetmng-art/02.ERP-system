# ============================================================
# BUSINESS INTELLIGENCE
# DATASET SNAPSHOT / LINEAGE / REFRESH EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 60.business-intelligence

purpose:
Define the exact BI dataset snapshot, lineage, refresh, stale-state,
and drill-down boundary so BI can provide analytical projection without
absorbing source business canon.

canonical_role:
- 60.business-intelligence owns analytical projection truth only

source_modules:
- 06.demand-forecasting
- 07.sop-consensus
- 15.manufacturing
- 16.production-planning
- 01.sales
- 04.order-management
- 05.billing
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 17.quality
- 18.costing
- 30.accounting
- 31.management-accounting
- 32.project-accounting
- 33.fixed-assets
- 34.cash-management
- 40.human-resources
- 41.labor-management
- 42.payroll
- 50.approval
- 51.audit
- 52.master-data

non_goals:
- BI does not own source transaction truth
- BI does not own approval truth
- BI does not own forecast truth
- BI does not own consensus truth
- BI does not own executable planning truth
- BI does not own execution truth
- BI does not rewrite source modules
- BI does not act as system-of-record for corrections

# ============================================================
# 1. CORE BI OBJECTS
# ============================================================

core_objects:
- bi_kpi_definition
- bi_dataset_definition
- bi_dataset_snapshot
- bi_snapshot_lineage
- bi_dashboard_definition
- bi_dashboard_projection
- bi_executive_summary
- bi_drilldown_link
- bi_refresh_policy
- bi_refresh_run
- bi_stale_state

ownership:
- KPI definition canon belongs to 60
- dashboard projection canon belongs to 60
- dataset snapshot canon belongs to 60
- source business canon remains in source modules

# ============================================================
# 2. BI DATASET DEFINITION
# ============================================================

object_name:
- bi_dataset_definition

meaning:
- reusable analytical dataset contract
- defines which source read models / extracts / snapshots can be consumed
- defines grain, dimensions, measures, filters, and lineage requirements

required_fields:
- dataset_definition_id
- company_id
- dataset_code
- dataset_name
- dataset_description
- source_module_set
- source_object_reference_set
- allowed_grain
- dimension_set
- measure_set
- refresh_policy_id
- lineage_required_flag
- drilldown_allowed_flag
- active_flag
- created_at
- created_by
- updated_at
- updated_by

source_module_set_rules:
- must declare all source modules used
- must not hide source ownership
- must not combine source meanings without explicit measure definition

allowed_grain_examples:
- company_day
- company_month
- store_day
- item_store_day
- item_plant_week
- sop_cycle
- forecast_cycle
- planning_run
- production_order
- audit_finding
- approval_request

rules:
- dataset definition is BI canon
- source business meaning remains in source modules
- changing dataset definition does not change source module truth

# ============================================================
# 3. BI DATASET SNAPSHOT
# ============================================================

object_name:
- bi_dataset_snapshot

meaning:
- immutable analytical snapshot used for dashboards, summaries, and drill-down views

required_fields:
- dataset_snapshot_id
- company_id
- dataset_definition_id
- snapshot_version
- snapshot_status
- snapshot_created_at
- snapshot_created_by
- snapshot_basis_start_at
- snapshot_basis_end_at
- source_cutoff_at
- refresh_run_id
- source_module_set
- source_lineage_reference_set
- row_count
- measure_count
- completeness_status
- stale_state
- superseded_by_snapshot_id_or_null
- retained_until_or_null

allowed_snapshot_status:
- building
- completed
- completed_with_warning
- failed
- superseded
- retired

allowed_completeness_status:
- complete
- partial
- source_delayed
- source_error
- source_inconsistent
- unknown

allowed_stale_state:
- fresh
- stale
- expired
- refresh_pending
- source_changed_after_snapshot
- manual_review_required

immutability_rules:
- completed snapshot is immutable
- correction requires new snapshot
- failed snapshot must retain failure evidence
- superseded snapshot remains traceable
- dashboard must declare which snapshot it uses

forbidden_behavior:
- silent overwrite of completed snapshot
- changing source module data through snapshot
- treating stale snapshot as fresh
- hiding partial refresh status

# ============================================================
# 4. SOURCE LINEAGE
# ============================================================

object_name:
- bi_snapshot_lineage

meaning:
- exact trace from BI snapshot back to source module objects, versions, and extraction basis

required_fields:
- lineage_id
- dataset_snapshot_id
- company_id
- source_module
- source_object_type
- source_object_id_or_query_reference
- source_version_id_or_null
- source_snapshot_id_or_null
- source_cutoff_at
- extraction_started_at
- extraction_completed_at
- extraction_actor
- extraction_method
- source_filter_summary
- source_row_count
- checksum_or_hash_or_null
- lineage_note_or_null

extraction_method_examples:
- source_read_model
- approved_extract
- event_projection
- immutable_snapshot
- reporting_view
- materialized_view
- controlled_query

rules:
- lineage is mandatory for executive dashboards
- lineage is mandatory for cross-module KPI
- lineage must identify source module ownership
- lineage must not imply BI ownership of source truth

# ============================================================
# 5. REFRESH POLICY
# ============================================================

object_name:
- bi_refresh_policy

meaning:
- rule defining when and how dataset snapshots are refreshed

required_fields:
- refresh_policy_id
- company_id
- dataset_definition_id
- refresh_mode
- refresh_frequency
- allowed_refresh_window
- source_lag_tolerance
- stale_after_duration
- expire_after_duration
- partial_refresh_allowed_flag
- manual_refresh_allowed_flag
- failure_notification_policy
- active_flag

allowed_refresh_mode:
- manual
- scheduled
- event_triggered
- hybrid

refresh_frequency_examples:
- hourly
- daily
- weekly
- monthly
- per_close_cycle
- per_sop_cycle
- per_forecast_cycle
- per_planning_run
- on_source_publish

rules:
- refresh policy belongs to BI
- source publication timing belongs to source module
- BI may request or consume source data, but may not force source truth mutation

# ============================================================
# 6. REFRESH RUN
# ============================================================

object_name:
- bi_refresh_run

meaning:
- execution record for generating or updating BI analytical snapshots

required_fields:
- refresh_run_id
- company_id
- dataset_definition_id
- requested_by
- requested_at
- refresh_mode
- refresh_started_at
- refresh_completed_at_or_null
- refresh_status
- source_module_set
- source_cutoff_at
- produced_snapshot_id_or_null
- failure_code_or_null
- failure_detail_or_null
- warning_count
- row_count_total
- lineage_generated_flag

allowed_refresh_status:
- queued
- running
- completed
- completed_with_warning
- failed
- cancelled

failure_code_examples:
- SOURCE_UNAVAILABLE
- SOURCE_SCHEMA_CHANGED
- SOURCE_PERMISSION_DENIED
- LINEAGE_INCOMPLETE
- PARTIAL_REFRESH_NOT_ALLOWED
- CHECKSUM_MISMATCH
- DATA_QUALITY_BLOCKED
- UNKNOWN_ERROR

rules:
- failed refresh does not corrupt previous completed snapshot
- dashboard may continue using previous snapshot if policy allows
- stale marker must be visible when previous snapshot is beyond tolerance
- completed_with_warning must show warning basis in dashboard metadata

# ============================================================
# 7. DASHBOARD PROJECTION
# ============================================================

object_name:
- bi_dashboard_projection

meaning:
- dashboard rendered from BI dataset snapshots and KPI definitions

required_fields:
- dashboard_projection_id
- company_id
- dashboard_definition_id
- dataset_snapshot_id_set
- projection_generated_at
- projection_status
- stale_state
- visible_warning_set
- drilldown_link_set
- published_flag
- published_at_or_null
- published_by_or_null

allowed_projection_status:
- draft
- generated
- published
- stale
- retired

rules:
- dashboard projection must identify snapshot basis
- dashboard projection must show stale or partial status when applicable
- dashboard projection is not source business approval
- dashboard projection is not source correction workflow

# ============================================================
# 8. EXECUTIVE SUMMARY PROJECTION
# ============================================================

object_name:
- bi_executive_summary

meaning:
- summarized analytical projection for executives using declared dataset snapshots

required_fields:
- executive_summary_id
- company_id
- summary_period_start
- summary_period_end
- dataset_snapshot_id_set
- kpi_definition_id_set
- summary_generated_at
- summary_text_or_structured_blocks
- key_risk_highlights
- key_variance_highlights
- stale_state
- source_lineage_summary
- published_flag

rules:
- summary must declare basis
- summary must distinguish confirmed source facts from analytical interpretation
- summary may recommend review, but does not approve business changes
- summary may link to source workflows, but may not bypass them

# ============================================================
# 9. DRILL-DOWN LINK
# ============================================================

object_name:
- bi_drilldown_link

meaning:
- controlled link from BI projection to source module detail or source read model

required_fields:
- drilldown_link_id
- company_id
- source_module
- source_object_type
- source_object_id_or_filter_reference
- source_version_id_or_null
- dataset_snapshot_id
- dashboard_projection_id_or_null
- allowed_actor_role_set
- link_purpose
- created_at

link_purpose_examples:
- inspect_source
- open_source_detail
- open_source_read_model
- investigate_variance
- review_exception
- review_audit_finding
- review_planning_basis

rules:
- drill-down does not transfer ownership to BI
- source module controls mutation permissions
- BI drill-down may open source detail, but source workflow decides changes

# ============================================================
# 10. KPI DEFINITION BOUNDARY
# ============================================================

object_name:
- bi_kpi_definition

meaning:
- BI-owned analytical metric definition

required_fields:
- kpi_definition_id
- company_id
- kpi_code
- kpi_name
- kpi_description
- formula_definition
- source_dataset_definition_id_set
- numerator_definition_or_null
- denominator_definition_or_null
- dimension_set
- period_rule
- owner_role
- active_flag
- version_id
- created_at
- updated_at

rules:
- KPI definition belongs to BI
- source measure facts belong to source modules
- formula can aggregate source facts
- formula cannot redefine source business events
- KPI change requires versioning
- historical dashboard must retain KPI version used

# ============================================================
# 11. SOURCE CHANGE HANDLING
# ============================================================

source_change_cases:
- source corrected after BI snapshot
- source version superseded
- source delayed
- source schema changed
- source permission changed
- source business close reopened

BI_required_response:
- mark snapshot source_changed_after_snapshot where applicable
- refresh if policy requires
- preserve old snapshot lineage
- generate new snapshot rather than overwriting old one
- show warning if dashboard uses old basis

forbidden_response:
- silent dashboard value change without snapshot version
- BI-side correction of source data
- hiding source correction lineage
- using mixed old/new source basis without declared partial status

# ============================================================
# 12. DEMAND / SOP / PLANNING SPECIFIC RULES
# ============================================================

06_demand_forecasting_rules:
- BI may consume forecast versions, forecast accuracy, forecast candidate status
- BI may not become forecast override workflow
- BI may not alter frozen forecast candidate

07_sop_consensus_rules:
- BI may consume consensus scenario summary, approved freeze, unresolved issues, accepted risk
- BI may not approve consensus
- BI may not mutate accepted risk register

16_production_planning_rules:
- BI may consume planning run status, MRP/CRP summary, planning exceptions
- BI may not release executable plan
- BI may not alter planning basis snapshot

15_manufacturing_rules:
- BI may consume actuals, variance, yield, downtime
- BI may not rewrite execution actuals
- BI may not issue execution correction

# ============================================================
# 13. SECURITY / ACCESS
# ============================================================

access_rules:
- source module access rules still apply
- BI may hide restricted drill-downs
- BI may aggregate restricted data only if policy permits
- dashboard visibility does not imply source mutation permission
- executive view permission must not bypass source module audit controls

# ============================================================
# 14. DECISION TEST
# ============================================================

decision_test:
- If the object defines how to calculate or present a metric, BI owns it.
- If the object is the actual transaction, forecast, consensus, plan, execution, approval, or audit finding, source module owns it.
- If the object is a point-in-time analytical copy with declared lineage, BI owns the snapshot.
- If the object changes source business meaning, it must go back to source module workflow.

# ============================================================
# 15. COMPLETION STATE
# ============================================================

completion_state:
- BI dataset snapshot canon fixed
- source lineage fixed
- refresh policy and run fixed
- stale / partial / delayed display rules fixed
- drill-down boundary fixed
- source module ownership preserved

# ============================================================
