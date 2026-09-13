# ============================================================
# MASTER DATA SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 52.master-data

Screens:
- CustomerMasterScreen
- SupplierMasterScreen
- ItemMasterScreen
- OrgReferenceScreen
- FinanceReferenceScreen

# P0 HTML / MULTILINGUAL / OFFLINE EXACT REFERENCE

p0_exact_reference:
- ../920.meta/9252000009_P0_MASTER_DATA_PHYSICAL_AUTHORITY_UI_OFFLINE_AIWORKER_EXACT.md

binding_rule:
- primary screen canon is CommonOS-aligned HTML.
- multilingual presentation is mandatory.
- offline-first, local queue, online sync, pending/retry/conflict visibility
  are mandatory.
