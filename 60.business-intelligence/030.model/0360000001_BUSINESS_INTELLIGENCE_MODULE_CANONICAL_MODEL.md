# ============================================================
# BUSINESS INTELLIGENCE MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Canonical entities

### 1.1 bi_kpi_definition
- bi_kpi_definition_id
- kpi_code
- kpi_name
- kpi_category
- calculation_rule_summary
- display_unit
- owner_module_group
- active_status
- created_by
- created_at
- updated_by
- updated_at

### 1.2 bi_dataset_snapshot
- bi_dataset_snapshot_id
- dataset_name
- snapshot_scope
- snapshot_period_from nullable
- snapshot_period_to nullable
- source_reference_summary
- refresh_run_id
- snapshot_status
- row_count
- created_at

### 1.3 bi_dashboard_view
- bi_dashboard_view_id
- dashboard_code
- dashboard_name
- dashboard_category
- dashboard_scope
- latest_snapshot_id nullable
- publish_status
- created_by
- created_at
- updated_by
- updated_at

### 1.4 bi_executive_summary
- bi_executive_summary_id
- summary_period_id
- summary_scope
- summary_title
- latest_snapshot_id
- summary_status
- generated_at

### 1.5 bi_drilldown_link
- bi_drilldown_link_id
- dashboard_view_id
- source_module
- source_route_type
- source_reference_hint
- link_status
- created_at

### 1.6 bi_refresh_run
- bi_refresh_run_id
- refresh_scope
- dataset_name
- refresh_status
- started_at
- finished_at nullable
- error_code nullable
- error_message nullable
- triggered_by

### 1.7 bi_filter_profile
- bi_filter_profile_id
- profile_name
- profile_scope
- filter_payload
- created_by
- created_at
- updated_at

## 2. Status canon

### 2.1 active_status
- active
- inactive
- archived

### 2.2 snapshot_status
- draft
- ready
- published
- superseded
- archived

### 2.3 publish_status
- draft
- published
- retired

### 2.4 summary_status
- draft
- published
- archived

### 2.5 link_status
- active
- broken
- retired

### 2.6 refresh_status
- pending
- running
- completed
- failed
- cancelled

## 3. Keys and uniqueness
- kpi_code unique
- dashboard_code unique
- dataset snapshots are versioned by refresh_run_id
- refresh runs are append-oriented and historically visible

## 4. Canonical invariants
- dashboard publish does not transfer source ownership
- snapshots remain traceable to source reference summary
- failed refresh runs remain historically visible
- drill-down links must resolve to source-owned surfaces where available
