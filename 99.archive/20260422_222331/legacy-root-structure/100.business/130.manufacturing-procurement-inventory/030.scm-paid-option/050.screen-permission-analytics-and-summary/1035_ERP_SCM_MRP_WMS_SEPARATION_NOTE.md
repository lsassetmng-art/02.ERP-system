# ============================================================
# ERP SCM MRP WMS SEPARATION NOTE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1035
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.mrp_wms.separation_note
component: scm-mrp-wms-separation-note


# NOTE

SCM may consume planning signals from MRP and execution signals from WMS,
but it does not absorb BOM-driven planning ownership from MRP
or warehouse execution ownership from WMS.

This note preserves the cross-module structure without
flattening manufacturing-procurement-inventory modules
into one monolith.

