# ============================================================
# ERP SCM TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2550
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.truth_map
component: scm-truth-map


# SCM TRUTH MAP

SCM owns:
- cross-node supply coordination truth
- transfer planning truth
- service-level exception truth
- supply risk visibility truth

Adjacent lines own:
- purchase = sourcing commitment truth
- sales = demand and commercial commitment truth
- WMS = warehouse execution truth
- inventory = stock truth

