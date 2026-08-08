# ============================================================
# CLOSE REPORTING DASHBOARD BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 60.business-intelligence
related_modules:
- 30.accounting
- 31.management-accounting

purpose:
Define how BI renders accounting close and managerial close information through
snapshots, dashboards, and executive summaries without becoming close truth.

canonical_role:
- analytical projection truth only

# ============================================================
# 1. CLOSE REPORTING DATASETS
# ============================================================

dataset_examples:
- accounting_close_status_dataset
- trial_balance_summary_dataset
- statutory_report_basis_dataset
- managerial_close_status_dataset
- management_profitability_dataset
- budget_actual_variance_dataset
- responsibility_center_performance_dataset
- close_exception_dataset

rules:
- each dataset must declare source module
- each dataset must declare source close package or managerial close package
- each dataset snapshot is immutable after completion

# ============================================================
# 2. DASHBOARD TYPES
# ============================================================

dashboard_examples:
- statutory_close_monitor_dashboard
- managerial_close_monitor_dashboard
- executive_close_summary_dashboard
- budget_actual_dashboard
- profitability_dashboard
- responsibility_center_dashboard
- close_reopen_impact_dashboard

rules:
- dashboard shows projection
- dashboard does not approve close
- dashboard does not execute reopen
- dashboard does not correct source values

# ============================================================
# 3. REQUIRED DASHBOARD METADATA
# ============================================================

required_metadata:
- dashboard_projection_id
- company_id
- dashboard_definition_id
- dataset_snapshot_id_set
- source_module_set
- source_close_package_reference_set
- snapshot_created_at
- source_cutoff_at
- stale_state
- completeness_status
- visible_warning_set
- drilldown_link_set

rules:
- close dashboard must always show source cutoff
- stale state must be visible
- partial refresh must be visible
- source changed after snapshot must be visible

# ============================================================
# 4. DRILL-DOWN BEHAVIOR
# ============================================================

allowed_drilldown_targets:
- 30.accounting accounting_close_package
- 30.accounting trial_balance
- 30.accounting adjustment_journal_summary
- 31.management-accounting managerial_close_package
- 31.management-accounting variance_analysis_package
- 31.management-accounting profitability_view
- 31.management-accounting responsibility_center_report

rules:
- drill-down opens source context
- mutation permission remains controlled by source module
- BI does not grant correction authority

# ============================================================
# 5. SOURCE CHANGE AFTER SNAPSHOT
# ============================================================

source_change_cases:
- accounting close reopened
- accounting adjustment issued after BI snapshot
- managerial close reopened
- managerial package superseded
- allocation run superseded
- variance package corrected

BI_required_response:
- mark affected dashboard stale or source_changed_after_snapshot
- create new refresh run if policy requires
- produce new dataset snapshot
- preserve previous snapshot lineage
- expose warning on dashboard until refreshed

forbidden_response:
- silently overwrite old dashboard values
- hide source correction
- treat refresh as source approval
- back-post correction into 30 or 31

# ============================================================
# 6. EXECUTIVE SUMMARY RULE
# ============================================================

executive_summary_rules:
- summary must distinguish source facts from analytical interpretation
- summary must declare accounting close package basis when using 30
- summary must declare managerial close package basis when using 31
- summary may recommend review
- summary may not approve accounting close
- summary may not approve managerial close
- summary may not execute reopen

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- dashboard publish treated as close approval
- executive summary treated as accounting adjustment evidence by itself
- BI stale dashboard used as final official report without warning
- BI drill-down bypassing source module permission
- refresh run modifying accounting or MA source objects

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_test:
- If it is a point-in-time analytical copy, BI owns snapshot.
- If it is close approval, source module owns it.
- If it is correction or reopen, source module owns it.
- If it is visual presentation, BI owns projection.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- close dashboard boundary fixed
- stale/source-change behavior fixed
- drill-down permissions fixed
- executive summary limitations fixed

# ============================================================
