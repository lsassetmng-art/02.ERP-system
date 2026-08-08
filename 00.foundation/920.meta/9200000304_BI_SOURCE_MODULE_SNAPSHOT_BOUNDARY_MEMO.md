# ============================================================
# BI SOURCE MODULE SNAPSHOT BOUNDARY MEMO
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 60.business-intelligence
- all ERP source modules

purpose:
Fix the foundation-level rule that BI consumes source modules through
declared snapshots, read models, approved extracts, or controlled projections,
without absorbing source business canon.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
- BI owns analytical projection truth.
- Source modules own business truth.
- BI snapshots are immutable analytical copies with lineage.
- BI refresh creates new snapshots, not silent overwrites.

# ============================================================
# 2. SOURCE MODULE TO BI FLOW
# ============================================================

canonical_flow:
- source module truth
- -> source read model / approved extract / source snapshot
- -> BI dataset snapshot
- -> BI KPI / dashboard / executive summary
- -> drill-down link back to source module

rules:
- BI does not sit in the write path of source modules
- BI does not approve source workflow
- BI does not correct source data
- BI may show stale / partial / delayed status

# ============================================================
# 3. SNAPSHOT BASIS RULE
# ============================================================

snapshot_basis_must_include:
- source_module
- source_object_type
- source_object_id_or_query_reference
- source_version_id_or_null
- source_cutoff_at
- extraction_method
- extraction_completed_at
- row_count
- lineage_reference

required_dashboard_disclosure:
- dataset_snapshot_id
- snapshot_created_at
- source_cutoff_at
- stale_state
- completeness_status

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- dashboard number used as source truth
- BI manual correction bypassing source module
- silent overwrite of completed snapshot
- mixed-source refresh without partial status
- drill-down link granting mutation authority that source module does not allow
- BI what-if scenario becoming S&OP or planning truth without formal module workflow

# ============================================================
# 5. DEMAND / SOP / PLANNING / MANUFACTURING EXAMPLE
# ============================================================

example_flow:
- 06 frozen forecast candidate
- -> 07 approved consensus freeze
- -> 16 accepted planning basis snapshot / planning run
- -> 15 manufacturing actuals
- -> 60 BI analytical snapshots and dashboards

ownership_reminder:
- 06 owns forecast truth
- 07 owns consensus truth
- 16 owns planning truth
- 15 owns execution truth
- 60 owns analytical projection truth only

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- BI snapshot boundary fixed at foundation layer
- source module truth preservation clarified
- snapshot / refresh / drill-down expectations clarified

# ============================================================
