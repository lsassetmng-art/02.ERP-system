# ============================================================
# ERP MPI ACTIVE LINE SUMMARY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1044
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.active_line_summary
component: mpi-active-line-summary


# ACTIVE LINE

The manufacturing-procurement-inventory family now has:

1. MRP bundled line
2. WMS bundled line
3. SCM bundled line
4. cross-module integration summary line


# CONSEQUENCE

This means the family can now be read:
- vertically per module
and
- horizontally across the family

