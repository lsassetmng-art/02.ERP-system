# ============================================================
# ERP MANUFACTURING COST MANAGEMENT TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2776
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.truth_map
component: manufacturing-cost-management-truth-map


# MANUFACTURING COST MANAGEMENT TRUTH MAP

Manufacturing cost management owns:
- cost collection truth
- standard-cost snapshot truth
- actual-cost accumulation truth
- production variance truth
- cost-closure truth

Adjacent lines own:
- manufacturing management = execution quantity truth
- accounting = posting truth
- inventory = quantity and movement truth
- management = review and approval truth

