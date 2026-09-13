# ============================================================
# MASTER DATA INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 52.master-data

- canonical shared reference data
- lookup/search projections
- reference change log
- consumer refresh notification queue

# P0 MASTER DATA STORAGE EXACT REFERENCE

p0_exact_reference:
- ../920.meta/9252000009_P0_MASTER_DATA_PHYSICAL_AUTHORITY_UI_OFFLINE_AIWORKER_EXACT.md

binding_rule:
- master_data is the physical canonical shared-master schema.
- master is legacy/noncanonical.
- public may contain ordinary read-only views only.
