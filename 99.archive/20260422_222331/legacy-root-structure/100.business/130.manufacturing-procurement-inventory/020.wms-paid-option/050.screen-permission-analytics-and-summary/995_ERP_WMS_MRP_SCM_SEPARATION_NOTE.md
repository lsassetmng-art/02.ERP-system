# ============================================================
# ERP WMS MRP SCM SEPARATION NOTE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-995
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.mrp_scm.separation_note
component: wms-mrp-scm-separation-note


# NOTE

WMS may feed stock execution signals to MRP and SCM,
but it does not absorb planning ownership from MRP
or broader network ownership from SCM.

This note preserves the next-step direction without
flattening manufacturing-procurement-inventory modules
into one monolith.

