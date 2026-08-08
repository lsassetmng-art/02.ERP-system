# ============================================================
# ERP MANUFACTURING COST MANAGEMENT OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2781
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.object_family_set
component: manufacturing-cost-management-object-family-set


# PRIMARY OBJECT FAMILIES

- cost_collection_case
- standard_cost_snapshot
- actual_cost_accumulation_case
- production_cost_variance_case
- cost_closure_case

# RULE

Cost collection is not standard-cost snapshot.
Standard-cost snapshot is not actual-cost accumulation.
Actual-cost accumulation is not production-cost variance.
Production-cost variance is not cost closure.

