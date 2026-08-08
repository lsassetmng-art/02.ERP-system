# ============================================================
# ERP MANUFACTURING MRP WMS SCM FAMILY RELATIONSHIP RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2523
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_mrp_wms_scm.family_relationship_rule
component: manufacturing-mrp-wms-scm-family-relationship-rule


# RULE

Manufacturing management owns:
- production order and work execution truth

MRP owns:
- requirement and supply proposal truth

WMS owns:
- warehouse task and warehouse execution truth

SCM owns:
- multi-node supply coordination truth

Inventory owns:
- stock quantity and movement truth

Purchase owns:
- sourcing commitment truth

Sales owns:
- commercial commitment truth

# CONSEQUENCE

Manufacturing is not MRP.
MRP is not WMS.
WMS is not SCM.
These modules may exchange references,
but they do not replace core-owned transaction truths.

