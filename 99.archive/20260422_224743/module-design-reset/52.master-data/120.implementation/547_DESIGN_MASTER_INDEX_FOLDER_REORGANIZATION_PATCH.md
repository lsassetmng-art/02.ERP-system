# ============================================================
# DESIGN MASTER INDEX FOLDER REORGANIZATION PATCH
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-547
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.design_master_index.folder_reorganization_patch
component: design-master-index-folder-reorganization-patch


# PATCH INTENT

Reflect the ERP folder reorganization by treating
top-level folders as the primary entry blocks and
their subfolders as the detailed design locations.


# REFLECTION TARGETS

- root INDEX / OVERVIEW
- 000.platform
- 002.interface-and-contract
- 003.control-and-workflow
- 100.business
- 200.management
- 300.analytics

